module ConstInitializer
    #---------- general info ---------
    #
    # grid
    plength = 100
    thetalength = 300
    pvec = range(1e-14, 1, length=plength) 
    pstep = step(pvec)   
    thetavec = range(1e-10, 2pi, length=thetalength)
    thetastep = step(thetavec)
    energyvec = @. (pvec^2) / 2
    #
    # laser info
    const ION_POT = 0.5
    const ATOM_IP = 1.
    phi = 0.5 * pi
    omega0 = 0.057
    ele0 = 0.05
    cycle = 2pi / omega0
    cyclenum = 4
    duration = cyclenum * cycle

    #
    # path
    datafolder = "./data"
    graphfolder = "./graph"
    # calculate 
    transampname = "transamp"
    transproname = "transpro"
    specname = "spec"

    #----------sc-----------+
    # spa
    max_iter = 30
    tol = 1e-14
    threshold = 1.
    realtlength = 30
    imagtlength = 15
    # path
    scdatafolder = joinpath(datafolder, "sc")
    sc_spa_datafile = joinpath(scdatafolder, "spa.jld2")
    # plot
    visual_point_vec = cycle * [0.5, 1, 1.5, 2, cyclenum]
    visual_point_length = length(visual_point_vec)
    visual_length = 4
end