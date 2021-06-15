def generator():
    x=var("x")
    y=var("y")
    t=var("t")
    w=var("w")
    f="f"
    g="g"
    h="h"
    
    listvars=[x,y,t,w]
    
    
    
    #polynomial
    indexp = randint(0, 3) #polynomial index
    
    #trig + transcendental
    indext = randint(0, 3)

    trig = [
        
        cos(listvars[indext]),
        sin(listvars[indext]),
    ]
    
    transc = [
        log(listvars[indext]),
        e^(listvars[indext]),
    ]

    shuffle(transc)
    shuffle(trig)
    
    summands = [
        
        randint(1,6)*choice([-1,1])*trig[0] + randint(1,6)*choice([-1,1])*transc[1],
        randint(1,6)*choice([-1,1])*transc[1]+ randint(1,6)*choice([-1,1])*trig[0],
        
    ]
    

    #exponent
    exponent = [
        x^(-randrange(2,10)),
        x^(1/randint(2,10)*choice([-1,1])),
        y^(-randrange(2,10)),
        y^(1/randint(2,10)*choice([-1,1])),
        t^(-randrange(2,10)),
        t^(1/randint(2,10)*choice([-1,1])),
        w^(-randrange(2,10)),
        w^(1/randint(2,10)*choice([-1,1])),
    ]
    
    shuffle(exponent)
    

    
    a = randint(1,10) #\sqrt[b]{x^a}
    
    b = randint(2,10) #want b coprime to a?
   
    coeff= randint(1,10)*choice([-1,1]) #c/x^d
    
    d= randint(1,6)
    
    indexe = randint(0, 3) #exponent variable index
    
    
    #functions
    
    xp=listvars[indexp]
    xe=listvars[indexe]
    xt=listvars[indext]

    
    
    functionnames=[f,g,h]
    shuffle(functionnames) #function name index
    
    polycoeff = [0, 0, randint(1,6)*choice([-1,1]), randint(1,6)*choice([-1,1]), 0, 0, randint(-6,6)] 
    shuffle(polycoeff)
    
    f1 = polycoeff[6]*choice([-1,1])*listvars[indexp]^6 + polycoeff[5]*randint(1,6)*choice([-1,1])*listvars[indexp]^5 + polycoeff[4]*listvars[indexp]^4 + polycoeff[3]*listvars[indexp]^3 + polycoeff[2]*listvars[indexp]^2 + polycoeff[1]*listvars[indexp] + polycoeff[0]
    f2 = listvars[indexe]^(a/b) + coeff/(listvars[indexe]^d)
    f3 = choice(summands)        
                             

    df1=f1.diff()
    df2=listvars[indexe]^(QQ((a-b)/b))+ -d*coeff *listvars[indexe]^(-(d+1)) #g.diff()
    df3=(f3.diff()).full_simplify()

    functions = [
        {"f":f1,"dfdx":df1},
        {"f":f2,"dfdx":df2},
        {"f":f3,"dfdx":df3},
    ]
    shuffle(functions)
    
    
    
    

    return {
      "functions": functions,
      "f1": f1,
      "f2": f2,
      "f3": f3,
      "a": a,
      "b": b,
      "c": coeff,
      "d": d,
      "xp": listvars[indexp],
      "xe": listvars[indexe],
      "xt": listvars[indext],
     "fn1": functionnames[0],
     "fn2": functionnames[1],
     "fn3": functionnames[2],
        "df1":df1,
       "df2":df2,
        "df3":df3,
    }





                                                                                    
