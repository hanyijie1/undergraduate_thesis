from src.const_initializer import ConstInitializer
import matplotlib.pyplot as plt
import matplotlib.colors as mcolors
from matplotlib.ticker import ScalarFormatter
import seaborn as sns
import numpy as np
import h5py

class TransProSpectVisualizer(ConstInitializer):
    """
    Trans pro visualizer

    Attributes
    ----------
    trans_pro_arr : numpy.ndarray
        its first dim is moment, second dim is theta, third dim is the t range we intend to visualize.
    """
    def __init__(self):
        super().__init__()
        # data input
        with h5py.File(self.sc_cva_data_file, 'r') as f:
            self.trans_pro_arr = f[self.trans_pro_name][:]
        # data input
        with h5py.File(self.sc_cva_data_file, 'r') as f:
            self.spectrum_matrix = f[self.spect_name][:]  # spect

    @staticmethod
    def _assist_plot_spect(x_vec, y_vec, sub_ax, label):
        sns.lineplot(
            x=x_vec,
            y=y_vec,
            ax=sub_ax,
            label=label,
        )
    @staticmethod
    def _assist_plot_trans_pro(sub_ax, p_mesh, theta_mesh, trans_pro_display_mesh, norm):
        im = sub_ax.pcolormesh(
            theta_mesh, p_mesh, trans_pro_display_mesh,
            cmap='viridis',
            shading='auto',
            norm=norm
        )
        return im

    @staticmethod
    def _forward(x):
        return x ** (1 / 6)

    @staticmethod
    def _inverse(x):
        return x ** 6

    def plot_trans_pro_spect(self, ):
        # trans_pro
        p_mesh, theta_mesh = np.meshgrid(self.p_vec, self.theta_vec)
        fig = plt.figure(figsize=(5.5 * 2, 4.5 * self.visual_count + 1))
        gs = fig.add_gridspec(self.visual_count + 2, 2, width_ratios=[1] * 2, height_ratios=[0.15] + [0.02] + [1] * self.visual_count)  # cbar distribution
        ax_trans_pro = [fig.add_subplot(gs[i, 0], polar=True) for i in range(0 + 2, self.visual_count + 2)]
        cax = fig.add_subplot(gs[0, :])
        # plot
        v_min, v_max = 0, np.percentile(self.trans_pro_arr[:, :, 0], 99)
        norm = mcolors.FuncNorm((self._forward, self._inverse), vmin=v_min, vmax=v_max)
        self._assist_plot_trans_pro(ax_trans_pro[0], p_mesh, theta_mesh, self.trans_pro_arr[:, :, 0].T, norm)
        v_min, v_max = 0, np.percentile(self.trans_pro_arr[:, :, 1], 99)
        norm = mcolors.FuncNorm((self._forward, self._inverse), vmin=v_min, vmax=v_max)
        self._assist_plot_trans_pro(ax_trans_pro[1], p_mesh, theta_mesh, self.trans_pro_arr[:, :, 1].T, norm)
        v_min, v_max = 0, np.percentile(self.trans_pro_arr[:, :, 2], 99)
        norm = mcolors.FuncNorm((self._forward, self._inverse), vmin=v_min, vmax=v_max)
        self._assist_plot_trans_pro(ax_trans_pro[2], p_mesh, theta_mesh, self.trans_pro_arr[:, :, 2].T, norm)
        v_min, v_max = 0, np.percentile(self.trans_pro_arr[:, :, 3], 99)
        norm = mcolors.FuncNorm((self._forward, self._inverse), vmin=v_min, vmax=v_max)
        im = self._assist_plot_trans_pro(ax_trans_pro[3], p_mesh, theta_mesh, self.trans_pro_arr[:, :, 3].T, norm)
        # title, label and tick.
        ax_trans_pro[0].set_title("({}) inter-cycle".format(self.trans_pro_alphabetic_sq[0]))
        ax_trans_pro[0].set_rticks([0, 1, 2,])
        ax_trans_pro[0].tick_params(axis='y', colors='white')
        ax_trans_pro[0].set_xticks([])
        ax_trans_pro[0].grid(False, axis='y')
        ax_trans_pro[0].set_ylabel("$p_y$", fontsize=15)
        ax_trans_pro[0].set_rlabel_position(-90)
        ax_trans_pro[1].set_title('({}) intra-cycle'.format(self.trans_pro_alphabetic_sq[1]))
        ax_trans_pro[1].set_rticks([])
        ax_trans_pro[1].set_xticks([])
        ax_trans_pro[1].set_ylabel("$p_y$", fontsize=15)
        ax_trans_pro[2].set_title("({}) 2 cycles".format(self.trans_pro_alphabetic_sq[2]))
        ax_trans_pro[2].set_rticks([])
        ax_trans_pro[2].set_xticks([])
        ax_trans_pro[2].set_ylabel("$p_y$", fontsize=15)
        ax_trans_pro[3].set_title("({}) 4 cycles".format(self.trans_pro_alphabetic_sq[3]))
        ax_trans_pro[3].set_rticks([])
        ax_trans_pro[3].set_xticks([])
        ax_trans_pro[3].set_ylabel("$p_y$", fontsize=15)
        ax_trans_pro[3].set_xlabel("$p_x$", fontsize=15)
        # cbar
        cbar = fig.colorbar(im, cax=cax, orientation='horizontal')  # cbar and its tick
        cbar.set_label('6th power heel of relative value')
        bar_tick = np.linspace(self._forward(v_min), self._forward(v_max), 5)
        cbar.set_ticks(self._inverse(bar_tick))
        # spect
        ax_spect = [fig.add_subplot(gs[i, 1]) for i in range(0 + 2, self.visual_count + 2)]
        self._assist_plot_spect(self.energy_vec, self.spectrum_matrix[:, 0], ax_spect[0], "inter-cycle")
        self._assist_plot_spect(self.energy_vec, self.spectrum_matrix[:, 1], ax_spect[1], "intra-cycle")
        self._assist_plot_spect(self.energy_vec, self.spectrum_matrix[:, 2], ax_spect[2], "2 cycles")
        self._assist_plot_spect(self.energy_vec, self.spectrum_matrix[:, 3], ax_spect[3], "4 cycles")
        ax_spect[-1].set_xlabel("$E_k(a.u)$", fontsize=12)
        for i in range(self.visual_count):
            max_visual_x = 0.2
            max_visual_y = np.percentile(self.spectrum_matrix[:, i], 100)
            ax_spect[i].set_title("({})".format(self.spect_alphabetic_sq[i]))
            ax_spect[i].set_xlim(0, max_visual_x)
            ax_spect[i].set_ylim(0, max_visual_y)
            ax_spect[i].set_xticks(np.linspace(0, max_visual_x, 5))  # ticks
            ax_spect[i].set_yticks(np.linspace(0, max_visual_y, 5))
            formatter = ScalarFormatter(useMathText=True)
            formatter.set_powerlimits((0, 0))  # 强制所有数值使用统一乘数
            ax_spect[i].yaxis.set_major_formatter(formatter)
            ax_spect[i].set_ylabel(r"$dP/dE_k(a.u.)$", fontsize=12)
            ax_spect[i].grid(False)
        # modulate linear
        sns.lineplot(
            x=self.energy_vec,
            y=self.spectrum_matrix[:, 0] + 0.02,
            ax=ax_spect[2],
            label="inter-cycle shape",
            linestyle='--',
            color='black',
        )
        plt.savefig(f"{self.sc_cva_trans_pro_spect_graph_path}.png", format='png', dpi=500, bbox_inches='tight')
        plt.savefig(f"{self.sc_cva_trans_pro_spect_graph_path}.pdf", format='pdf', bbox_inches='tight')
        plt.show()