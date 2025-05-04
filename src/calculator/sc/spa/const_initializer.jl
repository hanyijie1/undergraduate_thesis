module ConstInitializer
    #---------- general info ---------
    #
    # grid
    plength = 200
    thetalength = 1000
    tlength = 15000
    pvec = range(1e-2, 2, length=plength) 
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
    tvec = range(0, duration, length=tlength)
    tstep = step(tvec)
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
    max_iter = 1000
    tol = 1e-14
    threshold = 1.
    realtlength = 20 * 4
    imagtlength = 20
    realtvec = range(tvec[1], tvec[end], length=realtlength)
    imagtvec = range(tvec[1], tvec[end] / 4, length=imagtlength)
    realtgrid = repeat(realtvec, 1, imagtlength)
    imagtgrid = repeat(imagtvec, 1, realtlength)' 
    complextgrid = @. realtgrid + imagtgrid * 1.0im
    # path
    scdatafolder = joinpath(datafolder, "sc")
end