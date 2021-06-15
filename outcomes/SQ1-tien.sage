def generator():
    n=var("n")

    #define an arithmetic sequence
    initialA1=randint(1,5)*(-1)^randint(0,1)
    diffA1=randint(1,5)*(-1)^randint(0,1)
    A1(n)=initialA1+diffA1*n
    Seq1={
        "Formula":A1(n),
        "t0":A1(0),
        "t1":A1(1),
        "t2":A1(2),
        "t3":A1(3),
        "t4":A1(4),
        "t5":A1(5),
        "t6":A1(6),
        "t7":A1(7),
    }
    
    #define a geometric sequence
    initialA2=randint(1,5)*(-1)^randint(0,1)
    ratioA2list=[randint(2,4), 1/randint(2,4)]
    shuffle(ratioA2list)
    ratioA2=ratioA2list[0]*(-1)^randint(0,1)
    A2(n)=initialA2*ratioA2^n
    Seq2={
        "Formula":A2(n),
        "t0":A2(0),
        "t1":A2(1),
        "t2":A2(2),
        "t3":A2(3),
        "t4":A2(4),
        "t5":A2(5),
        "t6":A2(6),
        "t7":A2(7),
    }
    
    #define a 'rational' sequence
    initialA3=randint(0,3)
    numeratorA3=(-1)^randint(0,1)
    alternateA3=(-1)^randint(0,1)
    powerA3=randint(2,3)
    A3(n)=numeratorA3*alternateA3^n/((n+1)^powerA3+initialA3)
    Seq3={
        "Formula":A3(n),
        "t0":A3(0),
        "t1":A3(1),
        "t2":A3(2),
        "t3":A3(3),
        "t4":A3(4),
        "t5":A3(5),
        "t6":A3(6),
        "t7":A3(7),
    }
    
    
    #Define a second arithmetic sequence different from the first
    Seq4=Seq1
    while(Seq4==Seq1):
        initialA4=randint(1,5)*(-1)^randint(0,1)
        diffA4=randint(1,5)*(-1)^randint(0,1)
        A4(n)=initialA4+diffA4*n
        Seq1={
            "Formula":A4(n),
            "t0":A4(0),
            "t1":A4(1),
            "t2":A4(2),
            "t3":A4(3),
            "t4":A4(4),
            "t5":A4(5),
            "t6":A4(6),
            "t7":A4(7),
        }
    
    #define a second geometric sequence different from the first
    Seq5=Seq2
    while(Seq5==Seq2):
        initialA5=randint(1,5)*(-1)^randint(0,1)
        ratioA5list=[randint(2,4), 1/randint(2,4)]
        shuffle(ratioA5list)
        ratioA5=ratioA5list[0]*(-1)^randint(0,1)
        A5(n)=initialA5*ratioA5^n
        Seq2={
            "Formula":A5(n),
            "t0":A5(0),
            "t1":A5(1),
            "t2":A5(2),
            "t3":A5(3),
            "t4":A5(4),
            "t5":A5(5),
            "t6":A5(6),
            "t7":A5(7),
        }
    
    #define a second 'rational' sequence different from the first
    Seq6=Seq3
    while(Seq6==Seq3):
        initialA6=randint(0,3)
        numeratorA6=(-1)^randint(0,1)
        alternateA6=(-1)^randint(0,1)
        powerA6=randint(2,3)
        A6(n)=numeratorA6*alternateA6^n/((n+1)^powerA6+initialA6)
        Seq6={
            "Formula":A6(n),
            "t0":A5(0),
            "t1":A5(1),
            "t2":A5(2),
            "t3":A5(3),
            "t4":A5(4),
            "t5":A5(5),
            "t6":A5(6),
            "t7":A5(7),
        }
    
    #Shuffle the sequences with terms given
    Given=[Seq1, Seq2, Seq3]
    shuffle(Given)
    
    #Shuffle the sequences with closed forms given
    Closed=[Seq4, Seq5, Seq6]
    shuffle(Closed)
    
    #Define a recursive sequence
    initialR=randint(-5,5)
    coeffR=randint(1,5)*(-1)^randint(0,1)*2
    constantR=randint(-5,5)
    diffR=coeffR*n+constantR
    AR(n)=initialR+coeffR*n*(n-1)/2+n*constantR
    FormulaR=AR(n).full_simplify()
    #"{}, {}, {}, {}, {}".format(AR(1), AR(2), AR(3), AR(4), AR(5)),
    
    

    return {
      "Given": Given,
      "Closed": Closed,
      "initialR":initialR,
      "diffR":diffR,
      "tR1":AR(1),
      "tR2":AR(2),
      "tR3":AR(3),
      "tR4":AR(4),
      "tR5":AR(5),
      "FormulaR":FormulaR,  
    }
