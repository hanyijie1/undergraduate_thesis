from src.const_initializer import ConstInitializer
import matplotlib.patches as patches
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np
import pandas as pd

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
        # plot
        # get datas from HDF5
        my_df = pd.read_hdf(self.sc_laser_data_file, key=self.laser_name)
        # distribution
        ax = [0, 0]
        fig = plt.figure(figsize=(12, 4.5))
        ax[0] = fig.add_subplot(1, 1, 1)
        ax[0].set_xlabel(self.t_table_label, fontsize=15,)
        ax[0].set_ylabel(self.ele_x_table_label, fontsize=15,)
        ax[1] = ax[0].twinx()
        ax[1].set_ylabel(self.vec_pot_x_table_label, fontsize=15,)
        sns.lineplot(
            x=my_df[self.t_table_label][:],
            y=my_df[self.ele_x_table_label][:],
            color='red',
            label=r"$E_x$",
            ax=ax[0],
        )
        sns.lineplot(
            x=my_df[self.t_table_label][:],
            y=my_df[self.vec_pot_x_table_label][:],
            color='blue',
            label=r"$A_x$",
            ax=ax[1],
        )
        ax[1].get_legend().remove()
        ax[1].grid(False)
        lines = ax[0].get_lines() + ax[1].get_lines()  # legend
        labels = [line.get_label() for line in lines]
        ax[0].legend(lines, labels, loc='upper right')
        # rect
        x_start = np.min(my_df[self.t_table_label])  # rect 1
        y_start = np.min(my_df[self.ele_x_table_label])
        width = self.laser_cycle * 0.5  # 框的宽度
        height = np.max(my_df[self.ele_x_table_label]) - np.min(my_df[self.ele_x_table_label]) # 框的高度
        rect = patches.Rectangle(
            (x_start, y_start), width, height,
            linewidth=2, edgecolor='gray', linestyle='--', fill=False
        )
        ax[0].add_patch(rect)
        x_start = self.laser_cycle * 1  # rect 2
        y_start = np.min(my_df[self.ele_x_table_label])
        width = self.laser_cycle * 0.5  # 框的宽度
        height = np.max(my_df[self.ele_x_table_label]) - np.min(my_df[self.ele_x_table_label])  # 框的高度
        rect = patches.Rectangle(
            (x_start, y_start), width, height,
            linewidth=2, edgecolor='gray', linestyle='--', fill=False
        )
        ax[0].add_patch(rect)
        plt.savefig(f"{self.sc_laser_graph_path}.png", format="png", dpi=1000, bbox_inches='tight')
        plt.savefig(f"{self.sc_laser_graph_path}.pdf", format="pdf", bbox_inches='tight')
        plt.show()