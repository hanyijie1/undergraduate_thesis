from src.const_initializer import ConstInitializer
import matplotlib.pyplot as plt
from matplotlib.gridspec import GridSpec
import seaborn as sns
import pandas as pd
import numpy as np

class LaserVisualizer(ConstInitializer):
    """
    This class displays laser data.

    Methods
    ----------
    plot_laser()
        visual vec-pot and ele-field laser data
    """
    def __init__(self):
        super().__init__()

    def plot_laser(self):
        # get datas from HDF5
        my_df = pd.read_hdf(self.n_otc85_laser_data_file, key=self.laser_name)
        # distribution
        sns.set(style="whitegrid")  # white grid
        fig = plt.figure(figsize=(19, 5 * 2))
        gs = GridSpec(1, 3, width_ratios=[1, 1, 0.05], wspace=0.05)  # to plot z label, we set a subplot room.
        ax = [fig.add_subplot(gs[i], projection='3d') for i in range(0, 2)]
        # ele
        ax[0].plot(
            my_df[self.ele_x_table_label][:], my_df[self.t_table_label][:],
            zs=1.618 * my_df[self.ele_y_table_label][:].min(),
            zdir='z', color='red', alpha=1, linestyle='--', label=self.ele_x_table_label,
        )
        ax[0].plot(
            np.zeros(my_df[self.ele_x_table_label][:].size) + 1.618 * my_df[self.ele_x_table_label][:].min(),
            my_df[self.t_table_label][:], my_df[self.ele_y_table_label][:],
            color='blue', linestyle='--', label=self.ele_y_table_label,
        )
        ax[0].plot(
            my_df[self.ele_x_table_label][:], my_df[self.t_table_label][:], my_df[self.ele_y_table_label][:],
            lw=2, color='green', label=r'$\vec E(a.u.)$',
        )
        ax[0].set_xlim(1.618 * my_df[self.ele_x_table_label][:].min(), 1.618 * my_df[self.ele_x_table_label][:].max())
        ax[0].set_zlim(1.618 * my_df[self.ele_y_table_label][:].min(), 1.618 * my_df[self.ele_y_table_label][:].max())
        ax[0].set_xlabel(self.ele_x_table_label, labelpad=15)
        ax[0].set_ylabel(self.t_table_label, labelpad=15)
        ax[0].legend(loc='upper left')
        ax[0].set_box_aspect([1, 1.3, 1])
        ax[0].view_init(elev=45, azim= - 30)
        # vec pot
        ax[1].plot(
            my_df[self.vec_pot_x_table_label][:], my_df[self.t_table_label][:],
            zs=1.618 * my_df[self.vec_pot_y_table_label][:].min(),
            zdir='z', color='red', alpha=1, linestyle='--', label=self.vec_pot_x_table_label,
        )
        ax[1].plot(
            np.zeros(my_df[self.vec_pot_x_table_label][:].size) + 1.618 * my_df[self.vec_pot_x_table_label][:].min(),
            my_df[self.t_table_label][:], my_df[self.vec_pot_y_table_label][:],
            color='blue', linestyle='--', label=self.vec_pot_y_table_label,
        )
        ax[1].plot(
            my_df[self.vec_pot_x_table_label][:], my_df[self.t_table_label][:], my_df[self.vec_pot_y_table_label][:],
            lw=2, color='green', label=r'$\vec E(a.u)$',
        )
        ax[1].set_xlim(1.618 * my_df[self.vec_pot_x_table_label][:].min(), 1.618 * my_df[self.vec_pot_x_table_label][:].max())
        ax[1].set_zlim(1.618 * my_df[self.vec_pot_y_table_label][:].min(), 1.618 * my_df[self.vec_pot_y_table_label][:].max())
        ax[1].set_xlabel(self.vec_pot_x_table_label, labelpad=15)
        ax[1].set_ylabel(self.t_table_label, labelpad=15)
        fig.text(
            x=0.89, y=0.5,
            s=r"$A_y(a.u.)$",
            fontsize=12,
            color="black",
            ha="left",
            va="top",
            rotation=90
        )
        ax[1].legend(loc='upper left')
        ax[1].set_box_aspect([1, 1.3, 1])
        ax[1].view_init(elev=45, azim=- 30)
        plt.savefig(f"{self.n_otc85_laser_graph_path}.png", format="png", dpi=1000, bbox_inches='tight')
        plt.savefig(f"{self.n_otc85_laser_graph_path}.pdf", format="pdf", bbox_inches='tight')
        plt.show()