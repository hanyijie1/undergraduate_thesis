module ConstInitializer
    #---------- general info ---------
    #
    # grid
    plength = 200
    thetalength = 1000
    tlength = 15000
    pvec = range(0.02, 2, length=plength) 
    pstep = step(pvec)   
    thetavec = range(0, 2pi, length=thetalength)
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
    scdatafolder = joinpath(datafolder, "sc")
    #
    # calculate
end