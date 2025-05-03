from src.const_initializer import ConstInitializer
from src.math_utils import integral_solver
import numpy as np
import h5py
from numba import njit

@njit
def _assist_integrate_spectrum(
        info_arr,
        theta_step,
        cc_matrix,
        order,
) -> np.ndarray:
    p_count, theta_count, t_count = info_arr.shape
    integrate_info_matrix = np.zeros(
        (p_count, t_count),
        dtype=info_arr.dtype
    )
    for t_point in range(t_count):
        for p_point in range(p_count):
            info_vec = info_arr[p_point, :, t_point]
            integrate_info_value = integral_solver(
                info_vec,
                theta_step,
                cc_matrix,
                order,
            )[-1]
            integrate_info_matrix[p_point, t_point] = integrate_info_value
    return integrate_info_matrix

class SpectrumCalculator(ConstInitializer):
    """
    Get spectrum_calculator data and save it to HDF5 file

    Methods
    --------
    _integrate_spectrum()
        integrate to theta for arr(p_count, theta_count, t_count), Viz.,integral to second dim
    save_visual_spect()
        calculator spectrum_calculator from time zero and every cycle, then save to HDF5 file

    Attributes
    ----------

    """
    def __init__(self):
        super().__init__()
        # data input
        with h5py.File(self.otc_sfa_data_file, 'r') as f:
            self.trans_pro_arr = f[self.trans_pro_name][:]
        with h5py.File(self.order_test_data_file_path, 'r') as f:
            self.cc_matrix = f[self.ab_cc_name][:]
        # target
        self.spectrum_matrix = np.zeros_like(self.trans_pro_arr)

    def save_visual_spect(self, ):
        self.spectrum_matrix = _assist_integrate_spectrum(
            self.trans_pro_arr,
            self.theta_step,
            self.cc_matrix,
            self.spec_order
        )
        with h5py.File(self.otc_sfa_data_file, 'a') as f:
            if self.spect_name in f:
                del f[self.spect_name]
            spectrum_dset = f.create_dataset(
                self.spect_name,
                (self.p_count, self.visual_count),
                dtype=np.float64,
            )
            spectrum_dset[:] = self.spectrum_matrix
