from src.const_initializer import ConstInitializer
import matplotlib.pyplot as plt
import matplotlib.colors as mcolors
from matplotlib.ticker import ScalarFormatter
import numpy as np
import seaborn as sns
import h5py

class TransProSpectVisualizer(ConstInitializer):
    """
    Trans pro visualizer

    Attributes
    ----------
    trans_pro_arr : numpy.ndarray
        its first dim is moment, second dim is theta, third dim is the t range we intent to visualize.
    """
    def __init__(self):
        super().__init__()
        # data input
        with h5py.File(self.n_otc_cva_data_file, 'r') as f:
            self.trans_pro_arr = f[self.trans_pro_name][:]
        # data input
        with h5py.File(self.n_otc_cva_data_file, 'r') as f:
            self.spectrum_matrix = f[self.spect_name][:]  # general trans pro

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

    @staticmethod
    def _assist_plot_spect(x_vec, y_vec, sub_ax, label):
        sns.lineplot(
            x=x_vec,
            y=y_vec,
            ax=sub_ax,
            label=label,
        )

    def plot_trans_pro_spect(self, ):
        # distribution
        p_mesh, theta_mesh = np.meshgrid(self.p_vec, self.theta_vec)
        p_mesh, theta_mesh = np.meshgrid(self.p_vec, self.theta_vec)
        fig = plt.figure(figsize=(5.5 * 2, 4.5 * self.alpha_count + 1))
        gs = fig.add_gridspec(self.alpha_count + 2, 2, width_ratios=[1] * 2, height_ratios=[0.15] + [0.02] + [1] * self.alpha_count)  # cbar distribution
        ax_trans_pro = [fig.add_subplot(gs[i, 0], polar=True) for i in range(0 + 2, self.alpha_count + 2)]
        cax = fig.add_subplot(gs[0, :])
        # trans_pro
        # plot
        for i in range(self.alpha_count):
            v_min, v_max = 0, np.percentile(self.trans_pro_arr[:, :, i], 98)
            norm = mcolors.FuncNorm((self._forward, self._inverse), vmin=v_min, vmax=v_max)
            im = self._assist_plot_trans_pro(ax_trans_pro[i], p_mesh, theta_mesh, self.trans_pro_arr[:, :, i].T, norm)
        # title, label and tick.
        for i in range(self.alpha_count):
            alpha = self.alpha_vec[i]
            ax_trans_pro[i].set_title(r"$({}) \alpha = {}^\circ$".format(self.trans_pro_alphabetic_scan_sq[i], alpha))
            ax_trans_pro[i].set_xticks([])
            ax_trans_pro[i].set_yticks([])
            ax_trans_pro[i].set_ylabel("$p_y$", fontsize=15)
        ax_trans_pro[-1].set_xlabel("$p_x$", fontsize=15)
        # cbar
        cbar = fig.colorbar(im, cax=cax, orientation='horizontal')  # cbar and its tick
        cbar.set_label('6th power heel of relative value')
        bar_tick = np.linspace(self._forward(v_min), self._forward(v_max), 5)
        cbar.set_ticks(self._inverse(bar_tick))
        # modulate linear
        theta = np.radians(30)
        max_radius = ax_trans_pro[3].get_rmax()
        r = np.linspace(0, max_radius, 100)
        ax_trans_pro[3].plot([theta] * 100, r, color='black', linewidth=1, linestyle='--', label=r'$\theta=30^\circ$')
        theta = np.radians(150)
        max_radius = ax_trans_pro[3].get_rmax()
        r = np.linspace(0, max_radius, 100)
        ax_trans_pro[3].plot([theta] * 100, r, color='black', linewidth=1, linestyle='--', label=r'$\theta=150^\circ$')
        # spect
        ax_spect = [fig.add_subplot(gs[i, 1]) for i in range(0 + 2, self.alpha_count + 2)]
        ax_spect[-1].set_xlabel("$E_k(a.u)$", fontsize=15)
        for i in range(self.alpha_count):
            max_visual_x = 0.3
            max_visual_y = np.percentile(self.spectrum_matrix[:, i], 96)
            ax_spect[i].set_title("({})".format(self.spect_alphabetic_scan_sq[i]))
            ax_spect[i].grid(False)
            alpha = self.alpha_vec[i]
            ax_spect[i].set_xlim(0, max_visual_x )
            ax_spect[i].set_ylim(0, max_visual_y)
            ax_spect[i].set_xticks(np.linspace(0, max_visual_x, 5))  # ticks
            ax_spect[i].set_yticks(np.linspace(0, max_visual_y, 5))
            formatter = ScalarFormatter(useMathText=True)
            formatter.set_powerlimits((0, 0))  # 强制所有数值使用统一乘数
            ax_spect[i].set_ylabel(r"$dP/dE_k(a.u.)$", fontsize=15)
            ax_spect[i].yaxis.set_major_formatter(formatter)
            self._assist_plot_spect(self.energy_vec, self.spectrum_matrix[:, i], ax_spect[i], r"$\alpha = {}^\circ$".format(alpha))
            # arrow inter peak
            ax_spect[0].scatter(0.155, 0.03,
                                marker=r'$\downarrow$',  # LaTeX上箭头符号
                                s=200,  # 符号大小
                                c='black',
                                edgecolors='black'
                        )
            ax_spect[1].scatter(0.155, 0.028,
                                marker=r'$\downarrow$',  # LaTeX上箭头符号
                                s=200,  # 符号大小
                                c='black',
                                edgecolors='black'
                        )
            ax_spect[2].scatter(0.145, 0.025,
                                marker=r'$\downarrow$',  # LaTeX上箭头符号
                                s=200,  # 符号大小
                                c='black',
                                edgecolors='black'
                                )
            ax_spect[3].scatter(0.13, 0.02,
                                marker=r'$\downarrow$',  # LaTeX上箭头符号
                                s=200,  # 符号大小
                                c='black',
                                edgecolors='black'
                                )
            ax_spect[4].scatter(0.1, 0.015,
                                marker=r'$\downarrow$',  # LaTeX上箭头符号
                                s=200,  # 符号大小
                                c='black',
                                edgecolors='black'
                                )
        plt.savefig(f"{self.n_otc_cva_trans_pro_spect_graph_path}.png", format='png', dpi=500, bbox_inches='tight')
        plt.savefig(f"{self.n_otc_cva_trans_pro_spect_graph_path}.pdf", format='pdf', bbox_inches='tight')
        plt.show()