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
        t_step: float,
        cc_matrix: np.ndarray,
        trans_amp_order: int,
) -> np.ndarray:
    """
    This function optimized semi-action calculation by numba
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
        p_count: int, theta_count: int,
        p_vec: np.ndarray, theta_vec: np.ndarray,
        ion_pot: float, atom_ip: float,
        ele_x_vec: np.ndarray, ele_y_vec: np.ndarray,
        vec_pot_x_vec: np.ndarray, vec_pot_y_vec: np.ndarray, t_step: float,
        visual_time_index_vec: np.ndarray,
        cc_matrix: np.ndarray,
        trans_amp_order: int,
) -> np.ndarray:
    """
    This function optimized trans_amp calculation by numba
    """
    # target
    trans_amp_display_arr = np.zeros(
        (p_count, theta_count, visual_time_index_vec.size),
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
            trans_amp_display_arr[i, j, :] = trans_amp_part_vec[visual_time_index_vec]
    return trans_amp_display_arr

class TransAmpCalculator(ConstInitializer):
    """
    This class implements the transmission amplitude calculation.

    methods:
    ----------
    get_semi_action_fun()
    _calculate_visual_trans_amp()
        complete sub-tasks of transmission amplitude calculation of tread_id.
    save_visual_trans_amp()
        save all transmission amplitude in HDF5 format from sharded window.
    """
    def __init__(self,):
        super().__init__()
        self.thread_count = multiprocessing.cpu_count()
        self.semi_action_vec = np.zeros(self.t_count)
        my_df = pd.read_hdf(self.sc_laser_data_file, key=self.laser_name)
        self.ele_x_vec, self.ele_y_vec \
            = my_df[self.ele_x_table_label].values.astype(np.float64), my_df[self.ele_y_table_label].values.astype(np.float64)
        self.vec_pot_x_vec, self.vec_pot_y_vec \
            = my_df[self.vec_pot_x_table_label].values.astype(np.float64), my_df[self.vec_pot_y_table_label].values.astype(np.float64)  # 显式转化为arr, 以便numba优化。
        with h5py.File(self.order_test_data_file_path, mode="r") as f:
            self.cc_matrix = f[self.ab_cc_name][:].astype(np.float64)

    def _calculate_visual_trans_amp(self) -> np.ndarray:
        trans_amp_display_arr = _jit_trans_amp(
            self.thread_count,
            self.p_count, self.theta_count,
            self.p_vec, self.theta_vec,
            self.ion_pot, self.atom_ip,
            self.ele_x_vec, self.ele_y_vec,
            self.vec_pot_x_vec, self.vec_pot_y_vec, self.t_step,
            self.visual_time_index_vec,
            self.cc_matrix,
            self.trans_amp_order,
        )
        return trans_amp_display_arr

    def save_visual_trans_amp(self, ) -> None:
        with h5py.File(self.sc_cva_data_file , "a") as collect_file:
            if self.trans_amp_name in collect_file:  # 如果存在，删除该数据集
                del collect_file[self.trans_amp_name]
            trans_amp_display_dset = collect_file.create_dataset(
                self.trans_amp_name,
                (self.p_count, self.theta_count, self.visual_time_index_vec.size),
                dtype=np.complex128,
            )
            trans_amp_display_dset[:] = self._calculate_visual_trans_amp()