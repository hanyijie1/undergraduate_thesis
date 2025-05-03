import numpy as np
from numba import njit

@njit
def compute_action(t0, t_end, kx, ky, vec_pot_x_func, vec_pot_y_func, ion_pot):
    """
    计算从t0到t_end的动作S(t)，使用中点法，模仿getPhase。
    参数:
        t0: 复数时间起点（鞍点）
        t_end: 实数时间终点（通常为Duration）
        kx, ky: 动量分量
        vec_pot_x_func, vec_pot_y_func: 矢势函数（接受复数时间）
        ion_pot: 电离势
    返回:
        Phase_t: 动作S(t_s)
    """
    dtr = 0.01
    t0_real = np.real(t0)
    n_steps = int((t_end - t0_real) / dtr)
    Phase_t = 0j
    for n in range(n_steps):
        t_mid = t0_real + (n + 0.5) * dtr
        Ax_t = vec_pot_x_func(t_mid)
        Ay_t = vec_pot_y_func(t_mid)
        integrand = 0.5 * (kx + Ax_t)**2 + 0.5 * (ky + Ay_t)**2 + ion_pot
        Phase_t -= integrand * dtr
    # 处理剩余部分
    t_last = t0_real + n_steps * dtr
    if t_last < t_end:
        dt_remain = t_end - t_last
        t_mid = t_last + 0.5 * dt_remain
        Ax_t = vec_pot_x_func(t_mid)
        Ay_t = vec_pot_y_func(t_mid)
        integrand = 0.5 * (kx + Ax_t)**2 + 0.5 * (ky + Ay_t)**2 + ion_pot
        Phase_t -= integrand * dt_remain
    return Phase_t

@njit
def find_saddle_points(kx, ky, ion_pot, ele_x_func, vec_pot_x_func, ele_y_func, vec_pot_y_func):
    """
    求解鞍点，模仿getSaddlePoint。
    参数:
        kx, ky: 动量分量
        ion_pot: 电离势
        ele_x_func, vec_pot_x_func, ele_y_func, vec_pot_y_func: 电场和矢势函数
    返回:
        tr, ti: 鞍点实部和虚部数组
        spNum: 鞍点数量
    """
    # 参数与Fortran一致
    trStart = 0.01
    tiStart = 0.01
    trStep = 20.0
    tiStep = 20.0
    tiMax = 150.0
    trMax = 1000.0  # 需根据激光周期Duration设置
    max_iter = 1000
    tol = 1e-14
    tGap_threshold = 1.0

    tr = np.zeros(2000)
    ti = np.zeros(2000)
    spNum = 0
    trLast = 0.0
    tiLast = 0.0

    trCycle = trStart
    while trCycle <= trMax:
        tiCycle = tiStart
        while tiCycle <= tiMax:
            ts = complex(trCycle, tiCycle)
            jj = 0
            while True:
                trNow = np.real(ts)
                tiNow = np.imag(ts)
                if trNow < trStart or trNow > trMax or tiNow <= 0 or jj > max_iter:
                    break
                
                Ax_t = vec_pot_x_func(ts)
                Ay_t = vec_pot_y_func(ts)
                Ex_t = ele_x_func(ts)
                Ey_t = ele_y_func(ts)
                
                df_dt_x = (kx + Ax_t) * (-Ex_t)
                df_dt_y = (ky + Ay_t) * (-Ey_t)
                df_dt = df_dt_x + df_dt_y
                
                func = 0.5 * (kx + Ax_t)**2 + 0.5 * (ky + Ay_t)**2 + ion_pot
                funcAbs = np.abs(func)
                
                if funcAbs <= tol:
                    tGap = np.sqrt((trNow - trLast)**2 + (tiNow - tiLast)**2)
                    if tGap > tGap_threshold:
                        spNum += 1
                        tr[spNum-1] = trNow
                        ti[spNum-1] = tiNow
                        trLast = trNow
                        tiLast = tiNow
                    break
                
                ts = ts - func / df_dt
                jj += 1
            
            tiCycle += tiStep
        trCycle += trStep
    
    # 去重，模仿remove_the_same
    ii = 0
    while ii < spNum-1:
        jj = ii + 1
        while jj < spNum:
            tGap = np.sqrt((tr[ii] - tr[jj])**2 + (ti[ii] - ti[jj])**2)
            if tr[ii] != 0 and tr[jj] != 0 and tGap < tGap_threshold:
                tr[jj] = 0
                ti[jj] = 0
            jj += 1
        ii += 1
    
    # 清理零值并整理数组
    valid_idx = (tr != 0) & (ti != 0)
    tr = tr[valid_idx][:spNum]
    ti = ti[valid_idx][:spNum]
    spNum = len(tr)
    
    return tr, ti, spNum

@njit
def spa_trans_amp(
        px: float, py: float, pz: float,
        ele_x_func, ele_y_func,
        vec_pot_x_func, vec_pot_y_func,
        ion_pot: float, atom_ip: float,
        t_end: float
) -> complex:
    """
    计算SPA总振幅，通过鞍点求和。
    参数:
        px, py, pz: 动量分量
        ele_x_func, ele_y_func: 电场函数（接受复数时间）
        vec_pot_x_func, vec_pot_y_func: 矢势函数（接受复数时间）
        ion_pot: 电离势
        atom_ip: 原子电离势（此处未使用）
        t_end: 时间积分终点（激光周期Duration）
    返回:
        Mp: SPA总振幅（复数）
    """
    # 求解鞍点
    tr, ti, spNum = find_saddle_points(px, py, ion_pot, ele_x_func, vec_pot_x_func, ele_y_func, vec_pot_y_func)
    
    Mp = 0j
    for i in range(spNum):
        t_s = complex(tr[i], ti[i])
        if tr[i] == 0 or ti[i] == 0:
            continue
        
        # 计算矢势和电场
        Ax_t = vec_pot_x_func(t_s)
        Ay_t = vec_pot_y_func(t_s)
        Ex_t = ele_x_func(t_s)
        Ey_t = ele_y_func(t_s)
        
        # 计算S''(t_s)
        df_dt_x = (px + Ax_t) * (-Ex_t)
        df_dt_y = (py + Ay_t) * (-Ey_t)
        dS_dt2 = df_dt_x + df_dt_y
        
        # 筛选鞍点
        judgeSP_imag = np.imag(dS_dt2)
        judgeSP_real = np.abs(np.real(dS_dt2))
        if judgeSP_imag < 0 or judgeSP_real > 1:
            continue
        
        # 计算动作S(t_s)
        Phase_t = compute_action(t_s, t_end, px, py, vec_pot_x_func, vec_pot_y_func, ion_pot)
        
        # 计算鞍点贡献
        MP_temp = np.sqrt(2 * ion_pot) / np.sqrt(2) / dS_dt2 * np.exp(1j * Phase_t)
        Mp += MP_temp
    
    return Mp