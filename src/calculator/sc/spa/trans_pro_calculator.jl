module TransProCalculator
    include("../../../const_initializer.jl") 
    import .ConstInitializer as CI
    using JLD2

    function save_visual_trans_pro()
        # data input 
        transamp_arr = JLD2.jldopen(CI.sc_spa_datafile, "r") do file
            my_array = read(file, "trans_amp")
            return my_array
        end
        transamp_pro = zeros(Float64, CI.visual_length, CI.plength, CI.thetalength)
        transamp_pro[1, :, :] = @. abs(transamp_arr[2, :, :])^2
        transamp_pro[2, :, :] = @. abs(transamp_arr[3, :, :] - transamp_arr[2, :, :] + transamp_arr[1, :, :])^2
        transamp_pro[3, :, :] = @. abs(transamp_arr[4, :, :])^2
        transamp_pro[4, :, :] = @. abs(transamp_arr[5, :, :])^2
        # add save data
        data = load(CI.sc_spa_datafile)
        data["trans_pro"] = transamp_pro
        save(CI.sc_spa_datafile, data)
    end
end