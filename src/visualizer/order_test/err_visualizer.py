from src.const_initializer import ConstInitializer
import numpy as np
import seaborn as sns
import h5py
import pandas as pd
import matplotlib.pyplot as plt

class ErrVisualizer(ConstInitializer):
    def __init__(self):
        super().__init__()
        with h5py.File(self.order_test_data_file_path, 'r') as f:
            self.err_matrix = f[self.err_name][:]
        self.order_vec = np.arange(1, self.max_order + 1)
        self.clean_t_count_vec = np.arange(self.min_t_count, self.min_t_count + 300)
        self.clean_err_df = pd.DataFrame(
            self.err_matrix[:, 0:300],
            index=self.order_vec,
            columns=self.clean_t_count_vec
        )
        self.blur_t_count_vec = np.arange(self.max_t_count - 300, self.max_t_count)
        self.blur_err_df = pd.DataFrame(
            self.err_matrix[:, - 300:],
            index=self.order_vec,
            columns=self.blur_t_count_vec
        )

    def plot_err(self):
        fig = plt.figure(figsize=(10 * 2, 7 * 2))
        ax = [fig.add_subplot(2, 2, i) for i in range(1, 4 + 1)]
        # heatmap clean
        sns.heatmap(
            self.clean_err_df,
            cmap="viridis",
            ax=ax[0],
            vmax=np.median(self.err_matrix[:, 0:300]),
        )
        x_ticks1 = np.linspace(0, np.size(self.clean_t_count_vec) - 1, 5, dtype=int)  # 选择5个刻度
        x_tick_labels1 = ["{:.0f}".format(self.clean_t_count_vec[i]) for i in x_ticks1]
        ax[0].set_xticks(x_ticks1)
        ax[0].set_xticklabels(x_tick_labels1)
        # heatmap blur
        sns.heatmap(
            self.blur_err_df,
            cmap="viridis",
            ax=ax[2],
            vmax=np.median(self.err_matrix[:, - 300:]),
        )
        x_ticks2 = np.linspace(0, np.size(self.blur_t_count_vec) - 1, 5, dtype=int)  # 选择5个刻度
        x_tick_labels2 = ["{:.0f}".format(self.blur_t_count_vec[i]) for i in x_ticks1]
        ax[2].set_xticks(x_ticks2)
        ax[2].set_xticklabels(x_tick_labels2)
        # when k = 4, 5, 6
        k_min = 4
        k_max = 6
        for k in range(k_min, k_max + 1):
            sns.lineplot(
                x=self.clean_t_count_vec[:int(0.1 * self.clean_t_count_vec.size)],
                y=self.err_matrix[k - 1, :int(0.1 * self.clean_t_count_vec.size)],
                label=f"$order={k}$",
                ax=ax[1],
            )
            sns.lineplot(
                x=self.blur_t_count_vec[- int(0.1 * self.blur_t_count_vec.size):],
                y=self.err_matrix[k - 1, - int(0.1 * self.blur_t_count_vec.size):],
                label=f"$order={k}$",
                ax=ax[3],
            )
        clean_y_max = np.max(self.err_matrix[k_min - 1:k_max, :int(0.1 * self.clean_t_count_vec.size)])
        clean_y_min = np.min(self.err_matrix[k_min - 1:k_max, :int(0.1 * self.clean_t_count_vec.size)])
        blur_y_max = np.max(self.err_matrix[k_min - 1:k_max, - int(0.1 * self.blur_t_count_vec.size):])
        blur_y_min = np.min(self.err_matrix[k_min - 1:k_max, - int(0.1 * self.blur_t_count_vec.size):])
        ax[1].set_ylim(clean_y_min, clean_y_max)
        ax[3].set_ylim(blur_y_min, blur_y_max)
        ax[0].set_ylabel("orders", fontsize=15)
        ax[2].set_xlabel("time counts", fontsize=15)
        ax[2].set_ylabel("orders", fontsize=15)
        ax[1].set_ylabel("error", fontsize=15)
        ax[3].set_xlabel("time counts", fontsize=15)
        ax[3].set_ylabel("error", fontsize=15)
        for i in range(len(self.err_alphabetic_sq)):
            ax[i].set_title("({})".format(self.err_alphabetic_sq[i]), fontsize=15)
        plt.savefig(f"{self.err_graph_path}.png", format="png", dpi=1000, bbox_inches='tight')
        plt.savefig(f"{self.err_graph_path}.pdf", format="pdf", bbox_inches='tight')
        plt.show()
