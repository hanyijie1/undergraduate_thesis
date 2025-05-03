from .math_utils import *
from src.const_initializer import ConstInitializer
import h5py
import numpy as np


class CcGenerator(ConstInitializer):
    def __init__(self):
        super().__init__()

    def save_ab_cc(self, ):
        with h5py.File(self.order_test_data_file_path, 'w') as f:
            if self.ab_cc_name in f:
                pass  # because this matrix is fixed.
            else:
                k = self.max_order
                ab_cc_matrix = generate_ab_cc_matrix(k)
                total_period_spectrum_dset = f.create_dataset(  # save trans_pro_general
                    self.ab_cc_name,
                    (k, k),
                    dtype=np.float64,
                )
                total_period_spectrum_dset[:] = ab_cc_matrix

