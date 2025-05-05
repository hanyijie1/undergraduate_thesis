module MathUtils
    # const input
    include("./const_initializer.jl")
    include("./laser_generator.jl") 
    import .ConstInitializer as CI
    import .LaserGenerator as LG
    using CairoMakie
    using ScatteredInterpolation
    # function
    function calculate_semiaction(saddle, kx, ky, kz)
        # variables input
        realt0 = real(saddle)
        tend = CI.duration
        tlength = (tend - realt0) / (tend - 0) * CI.tlength  # the t step of t in [realt0, tend], with similar step as CI.
        tlength = round(Int64, tlength) + 2  # 防止tvec长度为1
        tvec = range(realt0, tend, length=tlength)
        tstep = step(tvec)
        # calculation
        semi_action = 0
        @simd for t in tvec[begin:end-1]
            tmid = t + 0.5tstep
            vecpotx, vecpoty = LG.generate_vecpot(tmid)
            deriva_semiaction = -(0.5(kx + vecpotx)^2 + 0.5(ky + vecpoty)^2 + CI.ION_POT)
            semi_action += deriva_semiaction * tstep
        end
        return semi_action
    end

    function calculate_deriva_semiaction(vecpotx, vecpoty, kx, ky, kz)
        deriva_semiaction = 0.5 * (kx + vecpotx)^2 + 0.5 * (ky + vecpoty)^2 + CI.ION_POT 
        return deriva_semiaction
    end

    function calculate_deriva2_semiaction(elex, eley, vecpotx, vecpoty, kx, ky, kz)
        deriva2_semiaction_x = (kx + vecpotx) * (-elex)
        deriva2_semiaction_y = (ky + vecpoty) * (-eley)
        deriva2_semiaction = deriva2_semiaction_x + deriva2_semiaction_y 
        return deriva2_semiaction
    end

    function seek_saddle(kx, ky, kz)
        saddle_length = 0
        saddlevec = zeros(ComplexF64, size(CI.complextgrid))[:] 
        for j in 1:CI.imagtlength
            for i in 1:CI.realtlength
                iter = 0
                complext = CI.complextgrid[i, j]
                while iter < CI.max_iter
                    elex, eley = LG.generate_ele(complext)
                    vecpotx, vecpoty = LG.generate_vecpot(complext)
                    deriva_semiaction = calculate_deriva_semiaction(vecpotx, vecpoty, kx, ky, kz)  # S'(t)
                    deriva_semiaction_abs = abs(deriva_semiaction)
                    # choose non-repetition saddle, |S'(t)| \approx 0.
                    if deriva_semiaction_abs < CI.tol && 
                       real(complext) > CI.realtvec[1] &&  
                       real(complext) < CI.realtvec[end] && 
                       imag(complext) > CI.imagtvec[1] &&  
                       real(complext) * imag(complext) != 0
                        saddle_length += 1
                        saddlevec[saddle_length] = complext
                        break
                    end
                    # if there is no saddle point, renew t_s and continue the iteration
                    iter += 1
                    deriva2_semiaction = calculate_deriva2_semiaction(elex, eley, vecpotx, vecpoty, kx, ky, kz)  # S''(t_s)
                    complext -= deriva_semiaction / deriva2_semiaction
                end
            end
        end
        # clean saddlevec
        @simd for i in 1:saddle_length-1
            for j in i+1:saddle_length
                distancet = abs(saddlevec[i] - saddlevec[j])
                if distancet < CI.threshold
                    saddlevec[j] = 0. + 0.0im
                end
            end
        end
        valid_saddlevec = filter(!iszero, saddlevec)
        return valid_saddlevec
    end

    function spa_transamp(kx, ky, kz)
        saddlevec = seek_saddle(kx, ky, kz)
        saddle_length = length(saddlevec)
        transamp_vec = zeros(ComplexF64, CI.visual_point_length)
        for i in 1:saddle_length
            saddle = saddlevec[i]
            elex, eley = LG.generate_ele(saddle)
            vecpotx, vecpoty = LG.generate_vecpot(saddle)
            deriva2_semiaction = calculate_deriva2_semiaction(elex, eley, vecpotx, vecpoty, kx, ky, kz)
            if imag(deriva2_semiaction) < 0 ||
               real(abs(real(deriva2_semiaction))) > 1  # eliminate unstable points
                continue
            end
            # calculate semiaction
            semiaction = calculate_semiaction(saddle, kx, ky, kz)
            if real(saddle) < CI.visual_point_vec[1]
                transamp_vec .+= sqrt(2 * CI.ION_POT) / sqrt(2) / deriva2_semiaction * exp(1im * semiaction)
            elseif real(saddle) < CI.visual_point_vec[2]
                transamp_vec[2:end] .+= sqrt(2 * CI.ION_POT) / sqrt(2) / deriva2_semiaction * exp(1im * semiaction)
            elseif real(saddle) < CI.visual_point_vec[3]
                transamp_vec[3:end] .+= sqrt(2 * CI.ION_POT) / sqrt(2) / deriva2_semiaction * exp(1im * semiaction)
            elseif real(saddle) < CI.visual_point_vec[4]
                transamp_vec[4:end] .+= sqrt(2 * CI.ION_POT) / sqrt(2) / deriva2_semiaction * exp(1im * semiaction)
            else
                transamp_vec[end] += sqrt(2 * CI.ION_POT) / sqrt(2) / deriva2_semiaction * exp(1im * semiaction)
            end
        end
        return transamp_vec
    end
end
