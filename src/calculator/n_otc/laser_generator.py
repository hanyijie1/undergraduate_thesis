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
        self.ele_x_matrix = np.zeros((self.t_count, self.alpha_count), dtype=np.float64)
        self.ele_y_matrix = np.zeros((self.t_count, self.alpha_count), dtype=np.float64)
        self.vec_pot_x_matrix = np.zeros((self.t_count, self.alpha_count), dtype=np.float64)
        self.vec_pot_y_matrix = np.zeros((self.t_count, self.alpha_count), dtype=np.float64)

    def _generate_ele(self):
        """
        general electric field evolution info.

        Notice
        ----------
        $$
        \vec E(t) = E_0 \exp\left(-\frac{(t - t_0)^2}{2\sigma_1^2}\right) \cos(\omega t) \hat e_x + \
        E_0 \exp\left(-\frac{(t - t_0)^2}{2\sigma_2^2}\right) \cos(2 \omega t + \phi) \hat e_y
        $$
        """
        t = self.t_vec
        for i in range(self.alpha_count):
            alpha = self.alpha_vec[i] / 180 * np.pi
            tau = self.num_cycle * self.laser_cycle
            sigma = tau / (4 * np.sqrt(np.log(2)))
            t0 = tau / 2
            amp = self.ele_field_0 * np.exp(- (t - t0) ** 2 / (2 * sigma ** 2))
            ele_1 = amp * np.cos(self.omega_0 * t)
            ele_2 = amp * np.cos(2 * self.omega_0 * t + self.phi)
            ele_x = ele_1 + ele_2 * np.cos(alpha)
            ele_y = ele_2 * np.sin(alpha)
            self.ele_x_matrix[:, i] = ele_x
            self.ele_y_matrix[:, i] = ele_y

    def _generate_vec_pot(self, ):
        """
        generate vector potential evolution info.
        """
        for i in range(self.alpha_count):
            ele_x = self.ele_x_matrix[:, i]
            ele_y = self.ele_y_matrix[:, i]
            # vec_pot_x expr
            vec_pot_x = integral_solver(ele_x, self.t_step, self.cc_matrix, self.laser_order)
            # vec_pot_y
            vec_pot_y = integral_solver(ele_y, self.t_step, self.cc_matrix, self.laser_order)
            self.vec_pot_x_matrix[:, i] = vec_pot_x
            self.vec_pot_y_matrix[:, i] = vec_pot_y

    def save_laser_info(self):
        """
        Compute and save fields and t scatter datas to HDF5.
        """
        self._generate_ele()
        self._generate_vec_pot()
        my_data = {
            self.ele_x_table_label: self.ele_x_matrix.flatten(),
            self.ele_y_table_label: self.ele_y_matrix.flatten(),
            self.vec_pot_x_table_label: self.vec_pot_x_matrix.flatten(),
            self.vec_pot_y_table_label: self.vec_pot_y_matrix.flatten(),
        }
        my_df = pd.DataFrame(my_data)
        my_df.to_hdf(self.n_otc_laser_data_file, key=self.laser_name)
