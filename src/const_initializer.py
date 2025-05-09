import os
import numpy as np

class ConstInitializer:
    """
    Configuration initializer for strong-field physics simulations.

    Provides physical constants, numerical parameters, and path configurations
    for various simulation scenarios including Sc, OTC, N-OTC85, and N-OTC models.

    Attributes
    ----------
    ion_pot : float
        Ionization potential in atomic units (Hartree)
    atom_ip : float
        Atomic ionization potential in atomic units
    phi : float
        Phase difference for OTC (Optical Tweezer Control) configuration
    p_vec : ndarray
        Momentum grid vector (atomic units)
    t_vec : ndarray
        Time grid vector (atomic units)
    data_folder : str
        Base directory for numerical data storage
    """
    def __init__(
            self,
            p_count=150,
            theta_count=600,
            t_count=15000,
    ):
        """
        Initialize

        Parameters
        ----------
        p_count : int
            Number of p count. (on need to be more)
        theta_count : int
            Number of theta count. (should not be revised)
        t_count : int
            Number of t count. (should not be revised)
        """
        # ---------- general info ----------
        # grid
        self.theta_count = theta_count
        self.p_count = p_count
        self.p_vec, self.p_step = np.linspace(
            0.02,
            2,
            self.p_count,
            retstep=True,
            dtype=np.float64,
        )
        self.theta_vec, self.theta_step = np.linspace(
            0,
            2 * np.pi,
            self.theta_count,
            retstep=True,
            dtype=np.float64,
        )
        self.energy_vec = (self.p_vec ** 2) / 2
        #
        # laser info
        self.t_count = t_count
        self.ion_pot = 0.5  # func info
        self.atom_ip = 1.0
        self.omega_0 = 0.057  # 800 nm
        self.ele_field_0 = 0.05
        self.laser_cycle = 2 * np.pi / self.omega_0
        self.num_cycle = 4
        self.duration = self.num_cycle * self.laser_cycle
        self.phi = 0.5 * np.pi
        self.pulse_start = 0.0  # time info
        self.pulse_end = self.duration + self.pulse_start
        self.t_vec, self.t_step = np.linspace(
            self.pulse_start,
            self.pulse_end,
            self.t_count,
            retstep=True,
            dtype=np.float64,
        )
        #
        # path
        self.data_folder = "./data"
        self.graph_folder = "./graph"
        # err
        self.order_test_graph_folder = os.path.join(self.graph_folder, "order_test")
        if not os.path.exists(self.order_test_graph_folder):
            os.makedirs(self.order_test_graph_folder)
        self.err_graph_name = "err_analysis"
        self.err_graph_path = os.path.join(self.order_test_graph_folder, self.err_graph_name)
        # calculate
        self.complex_laser_name = "complex_laser"
        self.trans_amp_name = "trans_amp"
        self.trans_pro_name = "trans_pro"
        self.spect_name = "spect"
        self.sc_data_folder = os.path.join(self.data_folder, "sc")  # sc
        if not os.path.exists(self.sc_data_folder):
            os.makedirs(self.sc_data_folder)
        self.sc_laser_data_file = os.path.join(self.sc_data_folder, "laser.h5")
        self.sc_sfa_data_file = os.path.join(self.sc_data_folder, "sfa.h5")
        self.sc_cva_data_file = os.path.join(self.sc_data_folder, "cva.h5")
        self.otc_data_folder = os.path.join(self.data_folder, "otc")  # otc
        if not os.path.exists(self.otc_data_folder):
            os.makedirs(self.otc_data_folder)
        self.otc_laser_data_file = os.path.join(self.otc_data_folder, "laser.h5")
        self.otc_sfa_data_file = os.path.join(self.otc_data_folder, "sfa.h5")
        self.otc_cva_data_file = os.path.join(self.otc_data_folder, "cva.h5")
        self.n_otc85_data_folder = os.path.join(self.data_folder, "n_otc85")  # n_otc85
        if not os.path.exists(self.n_otc85_data_folder):
            os.makedirs(self.n_otc85_data_folder)
        self.n_otc85_laser_data_file = os.path.join(self.n_otc85_data_folder, "laser.h5")
        self.n_otc85_cva_data_file = os.path.join(self.n_otc85_data_folder, "cva.h5")
        self.n_otc_data_folder = os.path.join(self.data_folder, "n_otc")  # n_otc
        if not os.path.exists(self.n_otc_data_folder):
            os.makedirs(self.n_otc_data_folder)
        self.n_otc_laser_data_file = os.path.join(self.n_otc_data_folder, "laser.h5")
        self.n_otc_cva_data_file = os.path.join(self.n_otc_data_folder, "cva.h5")

        # graph
        self.sc_graph_folder = os.path.join(self.graph_folder, "sc")  # sc
        self.sc_sfa_graph_folder = os.path.join(self.sc_graph_folder, "sfa")
        self.sc_cva_graph_folder = os.path.join(self.sc_graph_folder, "cva")
        if not os.path.exists(self.sc_sfa_graph_folder):
            os.makedirs(self.sc_sfa_graph_folder)
        if not os.path.exists(self.sc_cva_graph_folder):
            os.makedirs(self.sc_cva_graph_folder)
        self.otc_graph_folder = os.path.join(self.graph_folder, "otc")  # otc
        self.otc_sfa_graph_folder = os.path.join(self.otc_graph_folder, "sfa")
        self.otc_cva_graph_folder = os.path.join(self.otc_graph_folder, "cva")
        if not os.path.exists(self.otc_sfa_graph_folder):
            os.makedirs(self.otc_sfa_graph_folder)
        if not os.path.exists(self.otc_cva_graph_folder):
            os.makedirs(self.otc_cva_graph_folder)
        self.n_otc85_graph_folder = os.path.join(self.graph_folder, "n_otc85")  # n_otc85
        self.n_otc85_cva_graph_folder = os.path.join(self.n_otc85_graph_folder, "cva")
        if not os.path.exists(self.n_otc85_cva_graph_folder):
            os.makedirs(self.n_otc85_cva_graph_folder)
        self.n_otc_graph_folder = os.path.join(self.graph_folder, "n_otc")   # n_otc
        self.n_otc_cva_graph_folder = os.path.join(self.n_otc_graph_folder, "cva")
        if not os.path.exists(self.n_otc_cva_graph_folder):
            os.makedirs(self.n_otc_cva_graph_folder)
        
        # ---------- cc tester ----------
        # path
        self.order_test_data_folder = os.path.join(self.data_folder, "order_test")
        self.order_test_data_file_path = os.path.join(self.order_test_data_folder, "order_test_data.h5")
        if not os.path.exists(self.order_test_data_folder):
            os.makedirs(self.order_test_data_folder)
        #
        # cc generator
        self.ab_cc_name = "ab_cc"
        #
        # err tester
        self.trans_amp_order = 4
        self.laser_order = 5
        self.spec_order = 5
        self.max_order = 8
        self.min_t_count = 3000
        self.max_t_count = 15000
        self.err_name = "err"
        self.err_alphabetic_sq = ["a", "b", "c", "d"]

        # ---------- sc ----------
        # laser
        self.laser_name = "laser"
        self.t_table_label = "$time(a.u.)$"
        self.ele_x_table_label = "$E_x(a.u.)$"
        self.ele_y_table_label = "$E_y(a.u.)$"
        self.vec_pot_x_table_label = "$A_x(a.u.)$"
        self.vec_pot_y_table_label = "$A_y(a.u.)$"
        self.sc_laser_graph_path = os.path.join(self.sc_graph_folder, "laser")
        #
        # trans amp
        #
        # sfa
        # calculate
        # trans amp
        self.visual_time_point_vec = self.laser_cycle * np.array(
            [0.5, 1, 1.5, 2, self.num_cycle]
        )  # visualizer time point
        self.visual_time_index_vec = (self.visual_time_point_vec / self.t_step).astype(int)
        self.visual_count = 4
        # plot
        # trans_pro and spect
        self.trans_pro_spect_graph_name = "trans_pro_spect_graph"
        self.trans_pro_alphabetic_sq = ["a1", "a2", "a3", "a4"]
        self.spect_alphabetic_sq = ["b1", "b2", "b3", "b4"]
        self.sc_sfa_trans_pro_spect_graph_path = os.path.join(self.sc_sfa_graph_folder, self.trans_pro_spect_graph_name)
        #
        # cva
        # plot
        # trans_pro and spect
        self.sc_cva_trans_pro_spect_graph_path = os.path.join(self.sc_cva_graph_folder, self.trans_pro_spect_graph_name)

        # ---------- otc ----------
        # laser
        self.otc_laser_graph_path = os.path.join(self.otc_graph_folder, "laser")
        #
        # sfa
        # plot
        # trans_pro and spect
        self.otc_sfa_trans_pro_spect_graph_path = os.path.join(self.otc_sfa_graph_folder, self.trans_pro_spect_graph_name)
        #
        # cva
        # plot
        # trans_pro and spect
        self.otc_cva_trans_pro_spect_graph_path = os.path.join(self.otc_cva_graph_folder, self.trans_pro_spect_graph_name)

        # ---------- n-otc85 --------
        # laser
        self.alpha = 85 / 180 * np.pi
        self.n_otc85_laser_graph_path = os.path.join(self.n_otc85_graph_folder, "laser")
        #
        # cva
        # plot
        # trans_pro and spect
        self.n_otc85_cva_trans_pro_spect_graph_path = os.path.join(self.n_otc85_cva_graph_folder, self.trans_pro_spect_graph_name)

        # ---------- n-otc ----------
        # laser
        self.alpha_vec = np.array([5, 25, 45, 65, 85,])
        self.alpha_count = self.alpha_vec.size
        self.n_otc_laser_graph_path = os.path.join(self.n_otc_graph_folder, "laser")
        #
        # cva
        # plot
        # trans_pro and spect
        self.n_otc_cva_trans_pro_spect_graph_path = os.path.join(self.n_otc_cva_graph_folder, self.trans_pro_spect_graph_name)
        self.trans_pro_alphabetic_scan_sq = ["a1", "a2", "a3", "a4", "a5"]
        self.spect_alphabetic_scan_sq = ["b1", "b2", "b3", "b4", "b5"]
        # amp_contrast
        self.amp_contrast_graph_name = "amp_contrast"
        self.amp_contrast_p_id_vec = [int(self.p_count * i) for i in [0.3, 0.6, 0.9]]
        self.amp_contrast_p_vec = np.array([self.p_vec[i] for i in self.amp_contrast_p_id_vec])
        self.amp_contrast_p_count = len(self.amp_contrast_p_id_vec)
        self.n_otc_cva_amp_contrast_graph_path = os.path.join(self.n_otc_cva_graph_folder, self.amp_contrast_graph_name)
        self.amp_contrast_sq = ["a", "b", "c"]