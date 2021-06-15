def generator():
    x=var("x")
    y = var("y")
    
    # parabola and line
    intx1 = choice([-1,1])*randint(1,6)
    inty1 = choice([-1,1])*randint(1,6)
    intx2 = intx1+randint(2,10)
    parabola(x) = (x-intx1)^2+inty1
    line(x) = (parabola(intx2)-inty1)/(intx2-intx1)*(x-intx1)+inty1
    parab = {"eqn": parabola(x)}
    l = {"eqn": line(x)}
    functions = [parab, l]
    shuffle(functions)
    if parabola(intx1+1)>line(intx1+1):
        ansfx = parabola(x)-line(x)
    else:
        ansfx = line(x)-parabola(x)
    paraby(y) = solve([parabola(x)==y],x)[0].rhs()
    liney(y) = solve([line(x)==y],x)[0].rhs()
    inty2=parabola(intx2)
    if paraby(inty1+1/2)>liney(inty1+1/2):
        ansfy = paraby(y)-liney(y)
    else:
        ansfy = liney(y)-paraby(y)
     
    return {
        "functions": functions,
        "xlbound": intx1,
        "xubound": intx2,
        "ansfx": ansfx,
        "ylbound": inty1,
        "yubound": inty2,
        "ansfy":ansfy
    }
    
    
    #two parabolas
    
    #sqrt and parabola
    
    #sqrt and line

