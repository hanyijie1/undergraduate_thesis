module TransAmpCalculator
    include("../../../const_initializer.jl") 
    include("../../../math_utils.jl")
    import .ConstInitializer as CI
    import .MathUtils as MU
    using JLD2
    using ProgressMeter
    using Base.Threads
    # function
    function save_visual_transamp()
        transamp_arr = zeros(ComplexF64, CI.visual_point_length, CI.plength, CI.thetalength)
        @showprogress @threads for i in 1:CI.plength
            p = CI.pvec[i]
            for j in 1:CI.thetalength
                theta = CI.thetavec[j]
                px = p * cos(theta)
                py = p * sin(theta)
                pz = 0.
                transamp_arr[:, i, j] = MU.spa_transamp(px, py, pz)
            end
        end
        save(CI.sc_spa_datafile, "trans_amp", transamp_arr)
    end
end