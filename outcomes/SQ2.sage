def generator():
    n=var("n")

    #mixed fraction
    p1=randint(2,5)^n+randint(-5,5)
    q1=n^randint(1,5)+randint(-5,5)
    tempL1=[p1/q1, q1/p1]
    Sequence1=choice(tempL1)
    Limit1=Sequence1.limit(n=oo)
    Converge1=False
    if Limit1 <oo and Limit1>-oo:
        Converge1=True
    
    Problem1={
        "Sequence":Sequence1,
        "Limit":Limit1,
        "Converge":Converge1,
    }
    
    
    #rational function
    #p2=randint(-5,5)*n^2+randint(-5,5)*n+randint(1,5)*(-1)^randint(0,1)
    #q2=randint(-5,5)*n^2+randint(-5,5)*n+randint(1,5)*(-1)^randint(0,1)
    
    # Generate a list of small powers
    biggest_power1 = randrange(3,7)
    smaller_powers1 = list(range(biggest_power1))
    
    biggest_power2 = randrange(3,7)
    smaller_powers2 = list(range(biggest_power2))

    # Generate a list of nonzero integers from -9 to 9 and shuffle
    coeffs = list(IntegerRange(1,10))+list(IntegerRange(-9,0))
    shuffle(coeffs)

    # Generate a 3-term polynomial with small powers (possibly zero)
    p2 = expand(coeffs[0]*n^biggest_power1 + 
          coeffs[1]*n^choice(smaller_powers1) + 
          coeffs[2]*n^choice(smaller_powers1))
    shuffle(coeffs)
    q2 = expand(coeffs[0]*n^biggest_power2 + 
          coeffs[1]*n^choice(smaller_powers2) + 
          coeffs[2]*n^choice(smaller_powers2))
    Sequence2=choice([p2/q2, q2/p2]) #not sure the "expand" above is doing anything since we're creating a new function from the quotient.
    Limit2=Sequence2.limit(n=oo)
    Converge2=False
    if Limit2 <oo and Limit2>-oo:
        Converge2=True
    
    Problem2={
        "Sequence":Sequence2,
        "Limit":Limit2,
        "Converge":Converge2,
    }
    
    #Alternating
    Sequence3=randint(-5,5)+(-1)^randint(0,1)*(choice([1/randint(1,5), randint(1,5)])*(-1))^n
    Limit3=Sequence3.limit(n=oo)
    Converge3=False
    if Limit3 <oo and Limit3>-oo:
        Converge3=True
    
    Problem3={
        "Sequence":Sequence3,
        "Limit":Limit3,
        "Converge":Converge3,
    }
    
    Problems=[Problem1, Problem2, Problem3]
    shuffle(Problems)

    return {
      "Problems": Problems,
    }
