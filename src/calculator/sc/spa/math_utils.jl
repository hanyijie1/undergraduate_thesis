module MathUtils
    # const input
    include("./laser_generator.jl") 
    import .LaserGenerator as LG
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

    function seek_saddle(kx, ky, kz)
        saddle_length = 0
        lastt = 0. + 0.0im
        saddlevec = zeros(ComplexF64, size(LG.CI.complextgrid))[:] 
        for j in 1:LG.CI.imagtlength
            for i in 1:LG.CI.realtlength
                iter = 0
                complext = LG.CI.complextgrid[i, j]
                while iter < LG.CI.max_iter
                    elex, eley = LG.generate_ele(complext)
                    vecpotx, vecpoty = LG.generate_vecpot(complext)
                    deriva2_semiaction_x = (kx + vecpotx) * (-elex)
                    deriva2_semiaction_y = (ky + vecpoty) * (-eley)
                    deriva_semiaction = 0.5 * (kx + vecpotx)^2 + 0.5 * (ky + vecpoty)^2 + LG.CI.ION_POT  # S'(t)
                    deriva_semiaction_abs = abs(deriva_semiaction)
                    # choose non-repetition saddle, |S'(t)| \approx 0.
                    if deriva_semiaction_abs < LG.CI.tol  
                        distancet = abs(complext - lastt)
                        if distancet > LG.CI.threshold
                            saddle_length += 1
                            saddlevec[saddle_length] = complext
                            lastt =  complext
                            break
                        end
                    end
                    # if there is no saddle point, renew t_s and continue the iteration
                    iter += 1
                    deriva2_semiaction = deriva2_semiaction_x + deriva2_semiaction_y  # S''(t_s)
                    complext -= deriva_semiaction / deriva2_semiaction
                end
            end
        end
        # clean saddlevec
        for i in 1:saddle_length-1
            for j in i+1:saddle_length
                distancet = abs(saddlevec[i] - saddlevec[j])
                if distancet < LG.CI.threshold
                    saddlevec[j] = 0. + 0.0im
                end
            end
        end
        valid_saddlevec = filter(!iszero, saddlevec)
        valid_saddle_length = length(valid_saddlevec)
        return Array([valid_saddlevec, valid_saddle_length])
    end
end
