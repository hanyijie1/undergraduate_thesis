from src.const_initializer import ConstInitializer
import numpy as np
import h5py

class TransProCalculator(ConstInitializer):
    """
    Compute trans pro(only content data for visualizer), save relative data

    Methods
    ----------
    save_visual_trans_pro()
        calculator and save relative data

    Attributes
    ---------
    """
    def __init__(self):
        super().__init__()
        # data input
        with h5py.File(self.n_otc85_cva_data_file, 'r') as f:
            self.trans_amp_arr = f[self.trans_amp_name][:]  # general trans pro
        self.trans_pro_arr = np.zeros(
            (self.p_count, self.theta_count, self.visual_count),
            dtype=np.float64,
        )
        self.trans_pro_arr[:, :, 0] = np.abs(self.trans_amp_arr[:, :, 1]) ** 2
        self.trans_pro_arr[:, :, 1] = np.abs(self.trans_amp_arr[:, :, 2] - self.trans_amp_arr[:, :, 1] + self.trans_amp_arr[:, :, 0]) ** 2
        self.trans_pro_arr[:, :, 2] = np.abs(self.trans_amp_arr[:, :, 3]) ** 2
        self.trans_pro_arr[:, :, -1] = np.abs(self.trans_amp_arr[:, :, -1]) ** 2


    def save_visual_trans_pro(self,):
        with h5py.File(self.n_otc85_cva_data_file, 'a') as f:
            if self.trans_pro_name in f:
                del f[self.trans_pro_name]
            trans_pro_dset = f.create_dataset(  # save trans_pro_general
                self.trans_pro_name,
                (self.p_count, self.theta_count, self.visual_count),
                dtype=np.float64,
            )
            trans_pro_dset[:] = self.trans_pro_arr



