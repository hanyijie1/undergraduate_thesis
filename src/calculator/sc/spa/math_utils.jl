include("./laser_generator.jl") 
import .LaserGenerator

module MathUtils
    # const input
    import ..LaserGenerator as LG

    # function
    function calculate_semiaction(t0, kx, ky, kz)
        # variables input
        realt0 = real(t0)
        tend = LG.CI.duration
        tlength = (tend - realt0) / (tend - 0) * LG.CI.tlength  # the t step of t in [realt0, tend], with similar step as CI.
        tlength = round(Int64, tlength)
        tvec = range(realt0, tend, length=tlength)
        tstep = step(tvec)
        # calculation
        semi_action = 0
        for t in tvec[begin:end-1]
            tmid = t + 0.5tstep
            vecpotx, vecpoty = LG.generate_vecpot(tmid)
            deriva_semiaction = -(0.5(kx + vecpotx)^2 + 0.5(ky + vecpoty)^2 + LG.CI.ION_POT)
            semi_action += deriva_semiaction * tstep
        end
        return semi_action
    end


"""
def compute_action(t0, t_end, kx, ky, vec_pot_x_func, vec_pot_y_func, ion_pot):
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
"""
end