def generator():
    x=var("x")
    y=var("y")
    t=var("t")
    w=var("w")
    f="f"
    g="g"
    h="h"
    
    index1 = randint(0, 3)
    index2 = randint(0, 3)
    index3 = randint(0, 3)
    
    listvars=[x,y,t,w]
    
    functionnames=[f,g,h]

    factors = [
#        x^(randint(1, 5)*choice([-1, 1])),
#       x^(1/randint(2,10)*choice([-1,1])),
   #     x^(1/2),
        e^x,
        cos(x),
        sin(x),
        tan(x),
        log(x,e),
    ]

    shuffle(factors)
    shuffle(functionnames)

    coeffs = [randint(1,6)*choice([-1,1]) for _ in range(9)]
    polynomials=[coeffs[3*i]*x^2+coeffs[3*i+1]*x+coeffs[3*i+2] for i in range(3)]

    g11 = factors[0]
    g12 = polynomials[0]
    g1 = g11()(x=g12)
    
    g21 = x^(randint(5, 1000)*choice([-1, 1]))
    g22 = coeffs[5]*factors[1]
    g2= g21()(x=g22)
    
    g31 = factors[0]
    g32 = coeffs[6]*factors[1]
    g3 = g31()(x=g32)

    g4 = g21()(x=g12)
    
    g5 = (coeffs[4]*factors[2]^(1/2))
    
    g6 = (polynomials[1])^(1/2)
    
    g = [g1, g2, g3, g4, g5, g6]
    shuffle(g)
    
    f1 = g[0]
    f2 = g[1]

    f1a = coeffs[3]*f1()(x=listvars[index1])
    f2a = f2()(x=listvars[index2])
    
    
    df1=f1a.diff()
    df2=f2a.diff()
    
    
    functions = [
        {"f":f1a,"dfdx":df1, "fn": functionnames[0], "v": listvars[index1]},
        {"f":f2a,"dfdx":df2, "fn": functionnames[1], "v": listvars[index2]},
    ]
    shuffle(functions)
    

    return {
      "functions": functions,
    }





                                                                                    
