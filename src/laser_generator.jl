module LaserGenerator
    # const input
    include("./const_initializer.jl") 
    import .ConstInitializer as CI
    # generate function
    function generate_ele(t)
        cyclenum = CI.cyclenum
        cycle = CI.cycle
        ele0 = CI.ele0
        omega0 = CI.omega0
        tau = cyclenum * cycle
        sigma = tau / (4sqrt(log(2)))
        t0 = tau / 2
        amp = ele0 * exp(-(t - t0)^2 / (2sigma^2))
        elex = -ele0 * cos(omega0 * t)
        eley = 0.
        return Array([elex, eley])
    end
    function generate_vecpot(t)
        cyclenum = CI.cyclenum
        cycle = CI.cycle
        ele0 = CI.ele0
        omega0 = CI.omega0
        tau = cyclenum * cycle
        sigma = tau / (4sqrt(log(2)))
        t0 = tau / 2
        amp = ele0 * exp(-(t - t0)^2 / (2sigma^2))
        vecpotx = ele0 / omega0 * sin(omega0 * t)
        vecpoty = 0.
        return Array([vecpotx, vecpoty])
    end
end