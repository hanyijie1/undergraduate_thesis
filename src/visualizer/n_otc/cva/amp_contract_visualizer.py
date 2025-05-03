from src.const_initializer import ConstInitializer
import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns
import h5py

class AmpContrastVisualizer(ConstInitializer):
    def __init__(self):
        super().__init__()
        # data input
        with h5py.File(self.n_otc_cva_data_file, 'r') as f:
            self.trans_pro_arr = f[self.trans_pro_name][:]

    @staticmethod
    def _assist_plot_amp_contrast(x_vec, y_vec, sub_ax, label):
        rearrange_x_vec = np.linspace(- 1, 1, x_vec.size)
        sns.lineplot(
            x=rearrange_x_vec,
            y=y_vec,
            ax=sub_ax,
            label=label,
        )

    def plot_amp_contrast(self):
        fig = plt.figure(figsize=(12, 4 * self.amp_contrast_p_count))
        ax = [fig.add_subplot(self.amp_contrast_p_count, 1, i + 1) for i in range(self.amp_contrast_p_count)]
        for j in range(self.amp_contrast_p_count):
            ax[j].set_title("({}) p={:.2f}(a.u.)".format(self.amp_contrast_sq[j], self.amp_contrast_p_vec[j]), x=0.1, y=0.86, )
            for i in range(self.alpha_count):
                ax[j].set_ylabel("Probability density")
                ax[j].grid(False)
                alpha = self.alpha_vec[i]
                rearrange_trans_pro_arr = np.concatenate(
                    (self.trans_pro_arr[self.amp_contrast_p_id_vec[j], int(self.theta_count / 2):, i], self.trans_pro_arr[self.amp_contrast_p_id_vec[j], :int(self.theta_count / 2), i]),
                    axis=0,
                )
                self._assist_plot_amp_contrast(self.theta_vec, rearrange_trans_pro_arr, ax[j], r"$\alpha = {}^\circ$".format(alpha))
        # arrow do mark distance
        ax[0].scatter(- 0.01, 0.059,  # alpha = 5^\circ
                            marker=r'$\downarrow$',
                            s=50,  # 符号大小
                            c='blue',
                            edgecolors='blue'
                            )
        ax[0].scatter(0.015, 0.059,
                            marker=r'$\downarrow$',  # LaTeX上箭头符号
                            s=50,  # 符号大小
                            c='blue',
                            edgecolors='blue'
                            )
        ax[0].scatter(- 0.03, 0.0122,  # alpha = 85^\circ
                            marker=r'$\downarrow$',
                            s=50,  # 符号大小
                            c='purple',
                            edgecolors='purple'
                            )
        ax[0].scatter(0.194, 0.0055,
                            marker=r'$\downarrow$',  # LaTeX上箭头符号
                            s=50,  # 符号大小
                            c='purple',
                            edgecolors='purple'
                            )
        ax[- 1].set_xlabel(r"$\theta(\pi)$", fontsize=15)
        plt.savefig(f"{self.n_otc_cva_amp_contrast_graph_path}.png", format='png', dpi=1000, bbox_inches='tight')
        plt.savefig(f"{self.n_otc_cva_amp_contrast_graph_path}.pdf", format='pdf', bbox_inches='tight')
        plt.show()