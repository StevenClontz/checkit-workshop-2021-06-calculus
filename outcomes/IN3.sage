def generator():
    x=var("x")
    Powers=range(0,4)
    P=sample(Powers,3)
    coeffs = [randint(1,10)*choice([-1,1]) for _ in range(3)]
    polynomial=coeffs[2]*x^P[2]+coeffs[1]*x^P[1]+coeffs[0]*x^P[0]
    f     = [
        polynomial,
        randint(1,6)*choice([-1,1])*x^(1/randint(2,10)*choice([-1,1])),
        randint(1,11)*choice([-1,1])*choice([e^x,1/x]),
        randint(1,6)*choice([-1,1])*choice([cos(x),
                sin(x),
                sec(x)^2,
                sec(x)*tan(x),
                csc(x)^2,
                csc(x)*cot(x)
        ]),
    ]
    apol=randint(-3,3)
    bpol=randint(-3,3)
    while bpol==apol:  #this ensures a  is different than b 
        bpol=randint(-3,3)
    apol,bpol=min(apol,bpol),max(apol,bpol)
    answer1=f[0].integrate(x,apol,bpol)
    function1={"function":f[0], "a":apol, "b":bpol,"answer":answer1}
    
    arad=randint(1,6)
    brad=randint(arad+1,8)
    answer2=f[1].integrate(x,arad,brad)
    function2={"function":f[1], "a":arad, "b":brad,"answer":answer2}
    
    aexp=randint(1,6)
    bexp=randint(arad+1,8)
    answer3=f[2].integrate(x,aexp,bexp)
    function3={"function":f[2], "a":aexp, "b":bexp,"answer":answer3}
    

    atrig=choice([3,4,6])  #this choose a random bound from pi/3 pi/4 or pi/6
    btrig=choice([3,4,6])
    while btrig==atrig:  #this ensures a  is different than b 
        btrig=choice([3,4,6])
    k=choice([0,1,2,3])  #We are gonna pick a random quadrant
    atrig,btrig=pi/max(atrig,btrig)+k*pi/2,pi/min(atrig,btrig)+k*pi/2 #allows a and b to be in any quadrant
    answer4=f[3].integrate(x,atrig,btrig)
    function4={"function":f[3], "a":atrig, "b":btrig,"answer":answer4}
    
    functions=[function1,
                function2,
                function3,
                function4]
    shuffle(functions)
    return {
      "functions": functions
    }
