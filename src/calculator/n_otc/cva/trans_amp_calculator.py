from src.const_initializer import ConstInitializer
from src.math_utils import *
import numpy as np
from numba import jit, prange
import multiprocessing
import h5py
import pandas as pd

@jit(nopython=True)
def _jit_semi_action(
        kx: np.ndarray, ky: np.ndarray, kz: float,
        vec_pot_x_vec: np.ndarray, vec_pot_y_vec: np.ndarray,
        ion_pot: float,
        t_step: np.float64,
        cc_matrix: np.ndarray,
        trans_amp_order: int,
) -> np.ndarray:
    """
    Compute the semi-classical action by integrating its time derivative.

    Optimized with Numba for performance, this function calculates the semi-classical
    action S(t) by integrating dS/dt using the Adams-Bashforth method.

    Parameters
    ----------
    kx, ky : np.ndarray
        Canonical momentum components in x and y directions (atomic units).
    kz : float
        Canonical momentum component in z direction (atomic units, typically 0).
    vec_pot_x_vec, vec_pot_y_vec : np.ndarray
        Time-dependent vector potential components in x and y directions (atomic units).
    ion_pot : float
        Ionization potential (Hartree, atomic units).
    t_step : float
        Time step size for integration (atomic units).
    cc_matrix : np.ndarray
        Adams-Bashforth coefficient matrix, where row i contains coefficients for
        the (i+1)-step method.
    trans_amp_order : int
        Integration order for the Adams-Bashforth method (2 <= order <= 8).

    Returns
    -------
    np.ndarray
        Array of semi-classical action values S(t) over the time grid.

    Notes
    -----
    The semi-classical action is computed as:
    .. math::
        S(t) = \int \frac{dS}{dt} \, dt, \quad \frac{dS}{dt} = \frac{1}{2} (p + A(t))^2 + I_p
    where :math:`p` is the canonical momentum, :math:`A(t)` is the vector potential,
    and :math:`I_p` is the ionization potential.
    """
    semi_action_deriva_vec = derive_semi_action(
        kx, ky, kz,
        vec_pot_x_vec, vec_pot_y_vec,
        ion_pot,
    )
    semi_action_vec = integral_solver(semi_action_deriva_vec, t_step, cc_matrix, trans_amp_order)
    return semi_action_vec

@jit(nopython=True, parallel=True,)
def _jit_trans_amp(
        thread_count,
        p_count: int, theta_count: int, alpha_count: int,
        p_vec: np.ndarray, theta_vec: np.ndarray,
        ion_pot: float, atom_ip: float,
        ele_x_matrix: np.ndarray, ele_y_matrix: np.ndarray,
        vec_pot_x_matrix: np.ndarray, vec_pot_y_matrix: np.ndarray, t_step: np.float64,
        cc_matrix: np.ndarray,
        trans_amp_order: int,
) -> np.ndarray:
    """
    Compute the Coulomb-Volkov Approximation (CVA) transition amplitude.

    Optimized with Numba for parallel execution, this function calculates the
    transition amplitude for a range of momentum, angle, and polarization parameters.

    Parameters
    ----------
    thread_count : int
        Number of parallel threads (typically set to CPU core count).
    p_count : int
        Number of momentum grid points.
    theta_count : int
        Number of angular grid points (theta, azimuthal angle).
    alpha_count : int
        Number of polarization angles (for N-OTC configuration).
    p_vec : np.ndarray
        1D array of momentum magnitudes (atomic units).
    theta_vec : np.ndarray
        1D array of azimuthal angles (radians, 0 to 2π).
    ion_pot : float
        Ionization potential (Hartree, atomic units).
    atom_ip : float
        Atomic ionization potential for Coulomb correction (atomic units).
    ele_x_matrix, ele_y_matrix : np.ndarray
        2D arrays of electric field components (shape: [t_count, alpha_count], atomic units).
    vec_pot_x_matrix, vec_pot_y_matrix : np.ndarray
        2D arrays of vector potential components (shape: [t_count, alpha_count], atomic units).
    t_step : float
        Time step size for integration (atomic units).
    cc_matrix : np.ndarray
        Adams-Bashforth coefficient matrix, where row i contains coefficients for
        the (i+1)-step method.
    trans_amp_order : int
        Integration order for the Adams-Bashforth method (2 <= order <= 8).

    Returns
    -------
    np.ndarray
        3D array of transition amplitudes (shape: [p_count, theta_count, alpha_count],
        dtype: complex128).

    Notes
    -----
    The transition amplitude is computed by integrating the CVA derivative:
    .. math::
        D(p, \theta, \alpha) = \int \frac{dD}{dt} \, dt
    where :math:`\frac{dD}{dt}` is provided by `cva_deriva_trans_amp`, and the integration
    uses the Adams-Bashforth method.
    """
    # target
    trans_amp_display_arr = np.zeros(
        (p_count, theta_count, alpha_count),
        dtype=np.complex128,
    )
    single_progress_count = 0
    for i in prange(p_count):
        single_progress_count += 1
        print("Current task progress", single_progress_count / (p_count / thread_count))
        for j in range(theta_count):
            px = p_vec[i] * np.cos(theta_vec[j])
            py = p_vec[i] * np.sin(theta_vec[j])
            pz = 0.0
            for k in range(alpha_count):
                ele_x_vec, ele_y_vec = ele_x_matrix[:, k], ele_y_matrix[:, k]
                vec_pot_x_vec, vec_pot_y_vec = vec_pot_x_matrix[:, k], vec_pot_y_matrix[:, k]
                semi_action_vec = _jit_semi_action(
                    px, py, pz,
                    vec_pot_x_vec, vec_pot_y_vec,
                    ion_pot,
                    t_step,
                    cc_matrix,
                    trans_amp_order,
                )
                trans_amp_deriva_vec = cva_deriva_trans_amp(
                    px, py, pz,
                    ele_x_vec, ele_y_vec,
                    vec_pot_x_vec, vec_pot_y_vec,
                    ion_pot, atom_ip,
                    semi_action_vec,
                )
                trans_amp_part_vec = integral_solver(
                    trans_amp_deriva_vec,
                    t_step,
                    cc_matrix,
                    trans_amp_order,
                )
                # save
                trans_amp_display_arr[i, j, k] = trans_amp_part_vec[- 1]
    return trans_amp_display_arr

class TransAmpCalculator(ConstInitializer):
    """
    Calculate and store transition amplitudes for strong-field physics simulations.

    Inherits from `ConstInitializer` to provide configuration parameters and
    implements methods for computing and saving Coulomb-Volkov Approximation (CVA)
    transition amplitudes for the N-OTC configuration.

    Attributes
    ----------
    thread_count : int
        Number of CPU threads for parallel computation.
    semi_action_vec : np.ndarray
        Array to store semi-classical action values (shape: [t_count]).
    ele_x_matrix, ele_y_matrix : np.ndarray
        Electric field components (shape: [t_count, alpha_count], atomic units).
    vec_pot_x_matrix, vec_pot_y_matrix : np.ndarray
        Vector potential components (shape: [t_count, alpha_count], atomic units).
    cc_matrix : np.ndarray
        Adams-Bashforth coefficient matrix for numerical integration.

    Methods
    -------
    _calculate_visual_trans_amp()
        Compute transition amplitudes for visualization.
    save_visual_trans_amp()
        Save computed transition amplitudes to an HDF5 file.
    """
    def __init__(self,):
        """
        Initialize the transition amplitude calculator.

        Loads laser field data and Adams-Bashforth coefficients from files and
        sets up parameters inherited from `ConstInitializer`.
        """
        super().__init__()
        self.thread_count = multiprocessing.cpu_count()
        self.semi_action_vec = np.zeros(self.t_count)
        my_df = pd.read_hdf(self.n_otc_laser_data_file, key=self.laser_name)
        self.ele_x_matrix, self.ele_y_matrix \
            = my_df[self.ele_x_table_label].values.astype(np.float64).reshape(self.t_count, self.alpha_count), \
              my_df[self.ele_y_table_label].values.astype(np.float64).reshape(self.t_count, self.alpha_count)
        self.vec_pot_x_matrix, self.vec_pot_y_matrix \
            = my_df[self.vec_pot_x_table_label].values.astype(np.float64).reshape(self.t_count, self.alpha_count), \
              my_df[self.vec_pot_y_table_label].values.astype(np.float64).reshape(self.t_count, self.alpha_count)  # 显式转化为arr, 以便numba优化。
        with h5py.File(self.order_test_data_file_path, mode="r") as f:
            self.cc_matrix = f[self.ab_cc_name][:].astype(np.float64)

    def _calculate_visual_trans_amp(self) -> np.ndarray:
        """
        Compute transition amplitudes for the N-OTC configuration.

        Calls the Numba-optimized `_jit_trans_amp` function to calculate the
        Coulomb-Volkov Approximation transition amplitudes.

        Returns
        -------
        np.ndarray
            3D array of transition amplitudes (shape: [p_count, theta_count, alpha_count],
            dtype: complex128).
        """
        trans_amp_display_arr = _jit_trans_amp(
            self.thread_count,
            self.p_count, self.theta_count, self.alpha_count,
            self.p_vec, self.theta_vec,
            self.ion_pot, self.atom_ip,
            self.ele_x_matrix, self.ele_y_matrix,
            self.vec_pot_x_matrix, self.vec_pot_y_matrix, self.t_step,
            self.cc_matrix,
            self.trans_amp_order,
        )
        return trans_amp_display_arr

    def save_visual_trans_amp(self, ) -> None:
        """
        Save computed transition amplitudes to an HDF5 file.

        Stores the transition amplitude data in the N-OTC CVA data file, overwriting
        any existing dataset with the same name.

        Notes
        -----
        The data is saved in the HDF5 file at `self.n_otc_cva_data_file` under the
        dataset name `self.trans_amp_name`.
        """
        with h5py.File(self.n_otc_cva_data_file , "a") as collect_file:
            if self.trans_amp_name in collect_file:  # 如果存在，删除该数据集
                del collect_file[self.trans_amp_name]
            trans_amp_display_dset = collect_file.create_dataset(
                self.trans_amp_name,
                (self.p_count, self.theta_count, self.alpha_count),
                dtype=np.complex128,
            )
            trans_amp_display_dset[:] = self._calculate_visual_trans_amp()