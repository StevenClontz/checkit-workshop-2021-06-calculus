def generator():
    x=var("x")

    biggest_power = randrange(3,7)
    smaller_powers = list(range(biggest_power))

    coeffs = list(IntegerRange(1,10))+list(IntegerRange(-9,0))
    shuffle(coeffs)

    top = coeffs[0]*x^biggest_power + \
          coeffs[1]*x^choice(smaller_powers) + \
          coeffs[2]*x^choice(smaller_powers)

    bottom = coeffs[3]*x^biggest_power + \
             coeffs[4]*x^choice(smaller_powers) + \
             coeffs[5]*x^choice(smaller_powers)

    return {
      "f": top/bottom,
      "limit": coeffs[0]/coeffs[3],
    }
