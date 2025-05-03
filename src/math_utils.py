import numpy as np
from numba import njit

@njit
def _lanczos_gamma(z: np.ndarray) -> np.ndarray:
    """
    Compute gamma function using Lanczos approximation (Numba-compatible).

    Parameters
    ----------
    z : ndarray
        Complex input array (shape maintained)

    Returns
    -------
    ndarray
        Gamma function values with same shape as z
    """
    g = 7
    p = np.array([
        0.99999999999980993,
        676.5203681218851,
        -1259.1392167224028,
        771.32342877765313,
        -176.61502916214059,
        12.507343278686905,
        -0.13857109526572012,
        9.9843695780195716e-6,
        1.5056327351493116e-7
    ])
    if z.real < 0.5:
        return np.pi / (np.sin(np.pi * z) * _lanczos_gamma(1 - z))
    z -= 1
    a = p[0]
    for i in range(1, np.size(p)):
        a += p[i] / (z + i)
    t = z + g + 0.5
    return np.sqrt(2 * np.pi) * (t ** (z + 0.5)) * np.exp(- t) * a

# integral
@njit
def integral_solver(
        y_vec: np.ndarray, x_step: np.float64,
        cc_matrix: np.ndarray,
        order_num: int,
        method="ab",
) -> np.ndarray:
    """
    Adams-Bashforth multistep integrator for uniform grids.

    Parameters
    ----------
    y_vec : ndarray
        Integrand values (1D array)
    x_step : float
        Uniform step size
    cc_matrix : ndarray
        Adams-Bashforth coefficients matrix
    order_num : int
        Integration order (2-8 supported)
    method : str
        Integration family ("ab" for Adams-Bashforth)

    Returns
    -------
    ndarray
        Integrated values (same shape as y_vec)
    """
    if method == "ab":
        y_count = y_vec.size
        integrate_y_vec = np.zeros_like(y_vec)
        for i in range(order_num):
            integrate_y_vec[i + 1] = integrate_y_vec[i]
            for j in range(i + 1):
                integrate_y_vec[i + 1] += x_step * (cc_matrix[i][j] * y_vec[i - j])
        for i in range(order_num, y_count - 1):
            integrate_y_vec[i + 1] = integrate_y_vec[i]
            for j in range(order_num):
                integrate_y_vec[i + 1] += x_step * (cc_matrix[order_num - 1][j] * y_vec[i - j])
        return integrate_y_vec

# derivation function
@njit
def derive_semi_action(
        kx: np.ndarray, ky: np.ndarray, kz: float,
        vec_pot_x_vec: np.ndarray, vec_pot_y_vec: np.ndarray,
        ion_pot: float,
) -> np.ndarray:
    """
    Compute time-derivative of semi-classical action S(t).

    Parameters
    ----------
    kx, ky, kz : ndarray
        Canonical momentum components (a.u.)
    vec_pot_x_vec, vec_pot_y_vec : ndarray
        Vector potential components (time-dependent)
    ion_pot : float
        Ionization potential (Hartree)

    Returns
    -------
    ndarray
        dS/dt values computed via:
        dS/dt = 0.5*(p + A(t))² + I_p
    """
    param_1 = 0.5 * (kx + vec_pot_x_vec) ** 2
    param_2 = 0.5 * (ky + vec_pot_y_vec) ** 2
    param_3 = 0.5 * kz ** 2 + ion_pot
    semi_action_deriva_vec = param_1 + param_2 + param_3
    return semi_action_deriva_vec

@njit
def sfa_deriva_trans_amp(
        px: float, py: float, pz: float,
        ele_x_vec, ele_y_vec,
        vec_pot_x_vec: np.ndarray, vec_pot_y_vec:np.ndarray,
        ion_pot: float, atom_ip: float,
        semi_action_vec: np.ndarray,
) -> np.ndarray:
    """
    Compute SFA transition amplitude derivative (dD/dt).

    Implements Strong Field Approximation model for ionization rates.

    Parameters
    ----------
    px, py, pz : float
        Final momentum components (a.u.)
    ele_x_vec, ele_y_vec : ndarray
        Laser electric field components
    vec_pot_x_vec, vec_pot_y_vec : ndarray
    ion_pot, atom_ip : float
    semi_action_vec : ndarray
        Precomputed semi-classical action

    Returns
    -------
    ndarray
        Time-dependent transition amplitude derivative
    """
    qx = px + vec_pot_x_vec
    qy = py + vec_pot_y_vec
    qz = pz + 0.0
    mp_const = - 1j * 2.0 ** (7.0 / 2.0) * (2.0 * ion_pot) ** (5.0 / 4.0) / np.pi
    mp_up = ele_x_vec * qx + ele_y_vec * qy
    mp_down = (qx ** 2 + qy ** 2 + qz ** 2 + 2.0 * np.pi) ** 3.0
    trans_amp_deriva_vec = mp_const * mp_up / mp_down * np.exp(1j * semi_action_vec)
    return trans_amp_deriva_vec

@njit
def cva_deriva_trans_amp(
        px: float, py: float, pz: float,
        ele_x_vec, ele_y_vec,
        vec_pot_x_vec: np.ndarray, vec_pot_y_vec:np.ndarray,
        ion_pot: float, atom_ip: float,
        semi_action_vec: np.ndarray,
) -> np.ndarray:
    """
    Compute CVA transition amplitude derivative (dD/dt).

    Implements Coulomb-Volkov Approximation including Coulomb corrections.

    Parameters match sfa_deriva_trans_amp with additional:
    atom_ip : float
        Atomic ionization potential for Coulomb correction
    """
    qx = px + vec_pot_x_vec
    qy = py + vec_pot_y_vec
    qz = pz + 0.0
    pr = np.sqrt(px ** 2 + py ** 2 + pz ** 2)
    qr = np.sqrt(qx ** 2 + qy ** 2 + qz ** 2)
    vv = 1.0 / pr
    a1 = vv
    dd = atom_ip ** 2 + (qx ** 2 + qy ** 2 + qz ** 2)
    ss = - (px * qx + py * qy + pz * qz) - 1j * atom_ip * pr
    uu = 2.0 * ss / dd
    aa = 1.0 + uu
    b1 = 2.0 * (1j * pr + atom_ip * uu)
    l01 = 2.0 * atom_ip - 1j * a1 * b1 / aa
    int_r = 4.0 * np.pi * aa ** (-1j * a1) * l01 / dd ** 2
    nt_p = np.exp(np.pi * vv / 2.0) * _lanczos_gamma(1.0 - 1j * vv)
    ds_dt = (0.5 * qr ** 2 + ion_pot)
    mp_const = - 1j * (2.0 * np.pi) ** (-1.5) / np.sqrt(4.0 * np.pi)
    trans_amp_deriva_vec = mp_const * nt_p * int_r * np.exp(1j * semi_action_vec) * ds_dt
    return trans_amp_deriva_vec






