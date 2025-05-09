import numpy as np
import sympy as sp
from numba import njit, jit

# generate coefficients
def _lagrange_basis(t, m, points):
    """
    Compute the Lagrange basis polynomial for a given point index.

    Constructs the m-th Lagrange basis polynomial evaluated at t, based on a set of interpolation points.

    Parameters
    ----------
    t : sympy.Expr
        Symbolic variable for evaluation (typically time).
    m : int
        Index of the basis polynomial (0 <= m < len(points)).
    points : list
        list of interpolation points (symbolic or numeric).

    Returns
    -------
    sympy.Expr
        The m-th Lagrange basis polynomial evaluated at t.
    """
    k = len(points)
    numerator = 1
    denominator = 1
    for i in range(k):
        if i != m:
            numerator *= (t - points[i])
            denominator *= (points[m] - points[i])
    return numerator / denominator
def _compute_ab_cc(k):
    """
    Compute Adams-Bashforth coefficients for numerical integration.

    Generates coefficients for the k-step Adams-Bashforth method by integrating
    Lagrange basis polynomials over a uniform grid.

    Parameters
    ----------
    k : int
        Number of steps for the Adams-Bashforth method (1 <= k <= order).

    Returns
    -------
    list
        List of k coefficients for the Adams-Bashforth method.
    """
    h = sp.symbols('h', positive=True)
    t = sp.symbols('t')
    points = [ -i * h for i in range(k) ]
    coefficients = []
    for j in range(k):
        l_j = _lagrange_basis(t, j, points)
        integral = sp.integrate(l_j, (t, 0, h))
        b_j = integral / h
        coefficients.append(b_j)
    return coefficients
def generate_ab_cc_matrix(k):
    """
    Generate the Adams-Bashforth coefficient matrix for orders up to k.

    Constructs a matrix where each row i contains the coefficients for the (i+1)-step
    Adams-Bashforth integration method.

    Parameters
    ----------
    k : int
        Maximum order of the Adams-Bashforth method (number of steps).

    Returns
    -------
    np.ndarray
        Coefficient matrix of shape (k, k), where row i contains coefficients
        for the (i+1)-step method.
    """
    coefficients_matrix = np.zeros((k, k))
    for i in range(1, k + 1):
        print("process: k = {}".format(i))
        coefficients_matrix[i - 1, 0:i] = np.array(_compute_ab_cc(i))
    return coefficients_matrix

# integral
@njit
def integral_solver(
        y_vec: np.ndarray, x_step: np.float64,
        cc_matrix: np.ndarray,
        order_num: int,
        method="ab"
) -> np.ndarray:
    """
    Perform numerical integration using the Adams-Bashforth method on a uniform grid.

    Integrates the input array `y_vec` using the multistep Adams-Bashforth method
    with coefficients provided in `cc_matrix`.

    Parameters
    ----------
    y_vec : np.ndarray
        1D array of integrand values to be integrated.
    x_step : float
        Uniform step size of the grid.
    cc_matrix : np.ndarray
        Matrix of Adams-Bashforth coefficients, where row i contains coefficients
        for the (i+1)-step method.
    order_num : int
        Integration order (number of steps, 2 <= order_num <= 8).
    method : str, optional
        Integration method, currently supports "ab" (Adams-Bashforth). Default is "ab".

    Returns
    -------
    np.ndarray
        Array of integrated values, same shape as `y_vec`.
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
# target func

@njit
def integrand_function(t_vec, omega=0.057):
    r"""
    Compute the test integrand function for numerical integration.
    Evaluates the function sin(ω t / 12)² cos(ω t) for testing the numerical integrator.

    Parameters
    ----------
    t_vec : np.ndarray
        1D array of time points (in atomic units).
    omega : float, optional
        Angular frequency (default is 0.057, corresponding to 800 nm laser wavelength).

    Returns
    -------
    np.ndarray
        Array of integrand values with the same shape as `t_vec`.

    Notes
    -----
    The function is defined as:
    .. math::
        f(t) = \sin\left(\frac{\omega t}{12}\right)^2 \cos(\omega t)
    """
    return np.sin(omega * t_vec / 12) ** 2 * np.cos(omega * t_vec)
@njit
def analytical_integrated_function(t_vec, omega=0.057):
    r"""
    Compute the analytical integral of the test integrand function.

    Provides the exact antiderivative of sin(ω t / 12)² cos(ω t) for validating
    numerical integration results.

    Parameters
    ----------
    t_vec : np.ndarray
        1D array of time points (in atomic units).
    omega : float, optional
        Angular frequency (default is 0.057, corresponding to 800 nm laser wavelength).

    Returns
    -------
    np.ndarray
        Array of integrated values with the same shape as `t_vec`.

    Notes
    -----
    The analytical solution is:
    .. math::
        F(t) = \frac{\sin(\omega t)}{2\omega} - \frac{3}{14\omega} \sin\left(\frac{7\omega t}{6}\right) - \frac{3}{10\omega} \sin\left(\frac{5\omega t}{6}\right)
    """
    term1 = np.sin(omega * t_vec) / (2 * omega)
    term2 = (3 / (14 * omega)) * np.sin(7 * omega * t_vec / 6)
    term3 = (3 / (10 * omega)) * np.sin(5 * omega * t_vec / 6)
    return term1 - term2 - term3

@njit
def calculate_similarity(vec1, vec2):
    r"""
    Compute the mean squared error between two vectors.

    Measures the similarity between two vectors by calculating the mean of the squared
    differences, used to compare numerical and analytical integration results.

    Parameters
    ----------
    vec1 : np.ndarray
        First input vector (e.g., numerical integration result).
    vec2 : np.ndarray
        Second input vector (e.g., analytical integration result).

    Returns
    -------
    float
        Mean squared error between the two vectors.

    Notes
    -----
    The similarity is computed as:
    .. math::
        \text{MSE} = \frac{1}{N-1} \sum_{i=0}^{N-1} |\text{vec1}_i - \text{vec2}_i|^2
    where N is the length of the vectors.
    """
    diff_vec = vec1 - vec2
    var_vec = np.abs(diff_vec) ** 2
    return np.sum(var_vec) / (vec1.size - 1)