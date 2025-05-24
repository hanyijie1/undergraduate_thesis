module TransProSpectVisualizer
    include("../../../const_initializer.jl") 
    include("../../../math_utils.jl")
    import .ConstInitializer as CI
    import .MathUtils as MU
    using JLD2
    using Plots
    
    # data input
    pgrid = repeat(CI.pvec, 1, CI.thetalength)
    thetagrid = repeat(CI.thetavec, 1, CI.plength)'
    transamp_pro = jldopen(CI.sc_spa_datafile, "r") do file
        my_array = read(file, "trans_pro")
        return my_array
    end

    function plot_trans_pro_spect()
        # graph 
        # 绘制热力图
        pyplot()
        # 绘制极坐标热力图（注意参数顺序）
        # 定义布局：2 行 1 列
        
        for i in 1:CI.visual_length
            fig = plot(size=(500, 500))
            heatmap!(fig, CI.thetavec, CI.pvec, transamp_pro[i, :, :],
                proj=:polar,
                color=:viridis,
                grid=false,
                title="Polar Heatmap",
            )
            # savefig("final_polar_heatmap$(i).png") # just for test, generate in current directory.
        end
        
    end
end