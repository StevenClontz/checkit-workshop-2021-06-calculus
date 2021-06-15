def generator():
    n=var("n")
    m=var("m")

    #fractional
    ratiofrac=(-1)^randint(0,1)/randint(2,5)
    initialfrac=randint(1,5)*(-1)^randint(0,1)
    Seqfrac(n)=initialfrac*ratiofrac^n
    Serfrac(n)=initialfrac*(1-ratiofrac^(n+1))/(1-ratiofrac)
    
    #decimal
    place=randint(1,2)
    ratiodec=(0.1)^place
    initialdec=round(uniform(0.1, 0.99), place)
    Seqdec(n)=initialdec*ratiodec^n
    Serdec(n)=initialdec*(1-ratiodec^(n+1))/(1-ratiodec)
    
    #telescope
    rational(m)=randint(2,9)/(randint(2,9)*m+randint(0,9))
    First=rational(m).expand()
    Next=rational(m+1).expand()
    initial=randint(1,6)
    Limit=rational(initial)
    

    return {
        
        "sf0": Seqfrac(0),
        "sf1": Seqfrac(1),
        "sf2": Seqfrac(2),
        "sf3": Seqfrac(3),
        "SF0": Serfrac(0),
        "SF1": Serfrac(1),
        "SF2": Serfrac(2),
        "SF3": Serfrac(3),
        "sd0": round(Seqdec(0), place),
        "sd1": round(Seqdec(1), place*2),
        "sd2": round(Seqdec(2), place*3),
        "sd3": round(Seqdec(3), place*4),
        "SD0": round(Serdec(0), place),
        "SD1": round(Serdec(1), place*2),
        "SD2": round(Serdec(2), place*3),
        "SD3": round(Serdec(3), place*4),
        "First": First,
        "Next": Next,
        "Limit": Limit,
        "initial": initial,
    }
