from .math_utils import *
from src.const_initializer import ConstInitializer
import h5py
import numpy as np
from numba import jit, prange

@jit(nopython=True, parallel=True)
def _jit_err(t_min, t_max, ab_cc_matrix, max_order, min_t_count, max_t_count):
    err_matrix = np.zeros((max_order, max_t_count - min_t_count), dtype=np.float64)
    for order in prange(1, max_order + 1):
        for t_count in range (min_t_count, max_t_count):
            t_step = (t_max - t_min) / (t_count - 1)
            t_vec = np.arange(t_min, t_max + t_step, t_step)
            primal_vec = integrand_function(t_vec)
            ana_y_vec = analytical_integrated_function(t_vec)
            numer_y_vec = integral_solver(primal_vec, t_step, ab_cc_matrix, order, method="ab")
            err = calculate_similarity(numer_y_vec, ana_y_vec)
            err_matrix[order - 1, t_count - min_t_count] = err
    return err_matrix

class ErrTester(ConstInitializer):
    """
    Err tester

    Attributes
    ----------
    ab_cc_matrix : ndarray
        ab params matrix, its first dim is order and second dim is params id.
    """
    def __init__(self):
        super().__init__()
        with h5py.File(self.order_test_data_file_path, 'r') as f:
            dataset = f[self.ab_cc_name]
            self.ab_cc_matrix = np.asarray(dataset, dtype=np.float64, order='C')

    def save_err(self, ):
        ab_cc_matrix = self.ab_cc_matrix
        err_matrix = _jit_err(
            self.pulse_start, self.pulse_end,
            ab_cc_matrix,
            self.max_order,
            self.min_t_count, self.max_t_count,
        )
        with h5py.File(self.order_test_data_file_path, 'a') as f:
            if self.err_name in f:
                del f[self.err_name]
            f.create_dataset(self.err_name, data=err_matrix)