from src.const_initializer import ConstInitializer
from src.math_utils import integral_solver
import numpy as np
import pandas as pd
import h5py

class LaserGenerator(ConstInitializer):
    """
    This class implements to get laser evolution and its graphs from assignment function.

    Methods
    ----------
    _generate_ele()
    get_laser_field_fun()
    get_field_info_fun()
        get and save fields and t scatter datas to HDF5.
    get_field_graphs_fun()
    """
    def __init__(self):
        super().__init__()
        with h5py.File(self.order_test_data_file_path, mode="r") as f:
            self.cc_matrix = f[self.ab_cc_name][:].astype(np.float64)
        # target
        self.ele_x_vec = np.zeros(self.t_count, dtype=np.float64)
        self.ele_y_vec = np.zeros(self.t_count, dtype=np.float64)
        self.vec_pot_x_vec = np.zeros(self.t_count, dtype=np.float64)
        self.vec_pot_y_vec = np.zeros(self.t_count, dtype=np.float64)

    def _generate_ele(self, t: np.ndarray) -> tuple[np.ndarray, np.ndarray]:
        r"""
        general electric field evolution info.

        Parameters
        ----------
        t : np.ndarray
            time array [a.u.]

        Returns
        ----------
        ele_field_x : np.ndarray
        ele_field_y : np.ndarray

        Notice
        ----------
        $$
        \vec E(t) = E_0 \exp\left(-\frac{(t - t_0)^2}{2\sigma_1^2}\right) \cos(\omega t) \hat e_x + \
        E_0 \exp\left(-\frac{(t - t_0)^2}{2\sigma_2^2}\right) \cos(2 \omega t + \phi) \hat e_y
        $$
        """
        tau = self.num_cycle * self.laser_cycle
        sigma = tau / (4 * np.sqrt(np.log(2)))
        t0 = tau / 2
        amp = self.ele_field_0 * np.exp(- (t - t0) ** 2 / (2 * sigma ** 2))
        ele_1 = amp * np.cos(self.omega_0 * t)
        ele_2 = amp * np.cos(2 * self.omega_0 * t + self.phi)
        ele_x = ele_1 + ele_2 * np.cos(self.alpha)
        ele_y = ele_2 * np.sin(self.alpha)
        return ele_y, ele_x

    def _generate_vec_pot(self, t: np.ndarray) -> tuple[np.ndarray, np.ndarray]:
        """
        generate vector potential evolution info.

        Parameters
        ----------
        t
            time array [a.u.]

        Returns
        ----------
        vec_pot_x : np.ndarray
        vec_pot_y : np.ndarray
        """
        # vec_pot_x expr
        vec_pot_x = integral_solver(self._generate_ele(self.t_vec)[1], self.t_step, self.cc_matrix, self.laser_order)
        # vec_pot_y
        vec_pot_y = integral_solver(self._generate_ele(self.t_vec)[0], self.t_step, self.cc_matrix, self.laser_order)
        return vec_pot_y, vec_pot_x

    def save_laser_info(self):
        """
        Compute and save fields and t scatter datas to HDF5.
        """
        self.ele_y_vec, self.ele_x_vec  = self._generate_ele(self.t_vec)
        self.vec_pot_y_vec, self.vec_pot_x_vec = self._generate_vec_pot(self.t_vec)
        my_data = {
            self.t_table_label: self.t_vec,
            self.ele_x_table_label: self.ele_x_vec,
            self.ele_y_table_label: self.ele_y_vec,
            self.vec_pot_x_table_label: self.vec_pot_x_vec,
            self.vec_pot_y_table_label: self.vec_pot_y_vec,
        }
        my_df = pd.DataFrame(my_data)
        my_df.to_hdf(self.n_otc85_laser_data_file, key=self.laser_name)

