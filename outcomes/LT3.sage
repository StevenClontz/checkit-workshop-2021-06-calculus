def generator():
    x=var("x")
    k=var("k")

    # Sine or Cosine in denominator
    # Generate a list of small powers
    biggest_power = randrange(3,7)
    smaller_powers = list(range(biggest_power))

    # Generate a list of nonzero integers from -9 to 9 and shuffle
    coeffs = list(IntegerRange(1,10))+list(IntegerRange(-9,0))
    shuffle(coeffs)

    # Generate a 3-term polynomial with small powers (possibly zero)
    top1 = coeffs[0]*x^biggest_power + \
          coeffs[1]*x^choice(smaller_powers) + \
          coeffs[2]*x^choice(smaller_powers)

    # Choose sin(x) or cos(x) for a denominator
    bottom1 = choice([sin(x),cos(x)])

    # Compute first zero of denominator
    ans = solve(bottom1,x)[0]

    # Solve outputs a list of equations, so this displays answer nicely
    answer1 = (ans.lhs()==ans.rhs() + pi*k)


    # Removable at one value and not removable at one value
    # Generate 3 zeros to use in polynomials
    zeros = sample([i for i in range(-6, 7) if i != 0], 3)

    # Construct numerator and denominator with a shared zero
    top2 = expand((x-zeros[0]) * (x-zeros[1]))
    bottom2 = expand((x-zeros[1]) * (x-zeros[2]))

    # Dictionary of zeros and removability
    answer2 = [
        {
            "zero": zeros[1],
            "removable": "removable",
        },
        {
            "zero": zeros[2],
            "removable": "non-removable",
        },
    ]


    return {
        "top1": top1,
        "bottom1": bottom1,
        "top2": top2,
        "bottom2": bottom2,
        "answer1": answer1,
        "answer2": answer2,
    }
