#=
@file MathUtils.jl
@brief the moudle of the calculation of trans_amp
@author Han-Yijie
@version 1.0
@date 2025-05-08

@par rependent module:
- ConstInitializer
- LaserGenerator
- QuadGK
=#
module MathUtils
    # const input
    include("./const_initializer.jl")
    include("./laser_generator.jl") 
    import .ConstInitializer as CI
    import .LaserGenerator as LG
    using QuadGK

    #=
    Right-angle path integral
    # note
    First along the imaginary axis, and then along the real axis
    =#
    function _right_integral(f, z0, zend)
        x0, y0 = real(z0), imag(z0)
        xmiddle, ymiddle = real(z0), imag(zend)
        xend, yend = real(zend), imag(zend)
        function _integrand1(imagt)
            z = x0 + imagt * 1.0im
            return f(z) * 1.0im
        end
        function _integrand2(realt)
            z = realt + ymiddle * 1.0im
            return f(z) 
        end
        result1, err1 = quadgk(imagt -> _integrand1(imagt), y0, ymiddle)
        result2, err2 = quadgk(realt -> _integrand2(realt), xmiddle, xend)
        result, err = result1 + result2, max(err1, err2)
        return result, err
    end

    function _calculate_semiaction(saddle, tend, kx, ky, kz)
        # variables input
        function _solve_deriva_semiaction(t)
            vecpotx, vecpoty = LG.generate_vecpot(t)
            deriva_semiaction = -(0.5(kx + vecpotx)^2 + 0.5(ky + vecpoty)^2 + CI.ION_POT)
            return deriva_semiaction
        end
        semi_action, _ = _right_integral(_solve_deriva_semiaction, saddle, tend)
        return semi_action
    end

    function _calculate_deriva_semiaction(vecpotx, vecpoty, kx, ky, kz)
        deriva_semiaction = 0.5 * (kx + vecpotx)^2 + 0.5 * (ky + vecpoty)^2 + CI.ION_POT 
        return deriva_semiaction
    end

    function _calculate_deriva2_semiaction(elex, eley, vecpotx, vecpoty, kx, ky, kz)
        deriva2_semiaction_x = (kx + vecpotx) * (-elex)
        deriva2_semiaction_y = (ky + vecpoty) * (-eley)
        deriva2_semiaction = deriva2_semiaction_x + deriva2_semiaction_y 
        return deriva2_semiaction
    end

    function _seek_saddle(tend, kx, ky, kz)
        # generate primal grid
        realtvec = range(0, tend, length=CI.realtlength)
        imagtvec = range(0, tend / 4, length=CI.imagtlength)
        realtgrid = repeat(realtvec, 1, CI.imagtlength)
        imagtgrid = repeat(imagtvec, 1, CI.realtlength)' 
        complextgrid = @. realtgrid + imagtgrid * 1.0im
        # Saddle point search main loop
        saddle_length = 0
        saddlevec = zeros(ComplexF64, size(complextgrid))[:] 
        for j in 1:CI.imagtlength
            for i in 1:CI.realtlength
                iter = 0
                complext = complextgrid[i, j]
                # Newton's iteration to find the precise saddle point (up to CI.max_iter iterations)
                while iter < CI.max_iter
                    elex, eley = LG.generate_ele(complext)
                    vecpotx, vecpoty = LG.generate_vecpot(complext)
                    deriva_semiaction = _calculate_deriva_semiaction(vecpotx, vecpoty, kx, ky, kz)  # S'(t)
                    deriva_semiaction_abs = abs(deriva_semiaction)
                    # Judgment of saddle point convergence conditions
                    if deriva_semiaction_abs < CI.tol && 
                       real(complext) > realtvec[1] &&  
                       real(complext) < realtvec[end] && 
                       imag(complext) > imagtvec[1]
                        saddle_length += 1
                        saddlevec[saddle_length] = complext
                        break
                    end
                    # The Newton method updates and iterates the points
                    iter += 1
                    deriva2_semiaction = _calculate_deriva2_semiaction(elex, eley, vecpotx, vecpoty, kx, ky, kz)  # S''(t_s)
                    complext -= deriva_semiaction / deriva2_semiaction
                end
            end
        end
        # Saddle point de-weighting treatment
        @simd for i in 1:saddle_length-1
            for j in i+1:saddle_length
                distancet = abs(saddlevec[i] - saddlevec[j])
                if distancet < CI.threshold  # When the saddle point spacing is less than the threshold, it is regarded as a duplicate point.
                    saddlevec[j] = 0. + 0.0im
                end
            end
        end
        valid_saddlevec = filter(!iszero, saddlevec)
        return valid_saddlevec
    end

    #=
    Calculate the spatially resolved transition amplitude.
    # param 
    kx,ky,kz momentum components
    # return 
    the transition amplitude vector
    # note 
    Main calculation process function
    =#
    function spa_transamp(kx, ky, kz)
        transamp_vec = zeros(ComplexF64, CI.visual_point_length)
        # Traverse the visual sampling points (Currently only the second point is calculated for testing)
        for i in 2:2 #1:CI.visual_point_length
            tend = CI.visual_point_vec[i]
            transamp = 0. +0.0im
            saddlevec = _seek_saddle(tend, kx, ky, kz)
            saddle_length = length(saddlevec)
            for j in 1:saddle_length  # Traverse all valid saddle points to calculate the contribution
                saddle = saddlevec[j]
                elex, eley = LG.generate_ele(saddle)
                vecpotx, vecpoty = LG.generate_vecpot(saddle)
                deriva2_semiaction = _calculate_deriva2_semiaction(elex, eley, vecpotx, vecpoty, kx, ky, kz)
                if imag(deriva2_semiaction) < 0 ||
                real(abs(real(deriva2_semiaction))) > 1  # eliminate unstable points(with negative imaginary parts or overly large real parts)
                    continue
                end
                # Calculate the semi-classical action and accumulate the amplitudes
                semiaction = _calculate_semiaction(saddle, tend, kx, ky, kz)
                transamp += sqrt(2 * CI.ION_POT) / sqrt(2) / deriva2_semiaction * exp(1im * semiaction)
            end
            transamp_vec[i] = transamp
        end
        return transamp_vec
    end
end
