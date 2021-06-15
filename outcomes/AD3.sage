def generator():
    x=var("x")

#degree 3 polynomial
    #build interval
    leftend=randrange(-8,5)
    length_int=randrange(3,7)
    rightend=leftend+length_int
    #build derivative with generated zeros
    crit1=randrange(-6,5)
    spacebtwn=randrange(0,6) 
    crit2=crit1+spacebtwn
    d3primezeros(x)=(x-crit1)*(x-crit2)
    #
    #use sage to integrate, choose a f(0) between -5 and 5
    d3poly(x)=d3primezeros.integrate(x)*choice([3,6,9])*choice([-1,1])+randrange(-5,5)
    #
    #find function values at crit points and endpoints
    critval1=d3poly(crit1)
    critval2=d3poly(crit2)
    leftendval=d3poly(leftend)
    rightendval=d3poly(rightend)
    #
    #find max and min
    absmaxval=max([critval1,critval2,leftendval,rightendval])    
    absminval=min([critval1,critval2,leftendval,rightendval])
    absmaxx=-500
    absmin=-500 #to tell if something has gone wrong
    #which one gave that max/min
    for point in [crit1,crit2,leftend,rightend]:
        if(d3poly(point)==absmaxval):
           absmaxx=point
        if(d3poly(point)==absminval):
           absminx=point

    return {
      "f": d3poly(x),
      "leftend": leftend,
      "rightend": rightend,
      "absmaxx": absmaxx,
      "absmaxval": absmaxval,
      "absminx": absminx,
      "absminval": absminval,
    }
