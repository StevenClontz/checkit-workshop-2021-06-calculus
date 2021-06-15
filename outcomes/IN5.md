Find basic antiderivatives and solve basic initial value problems.

![](.IN5.md.upload/paste-0.006418509642841963)

### June 8:

Hannah Burson, Laura Kinnel, Jean-Sebastien Turcotte, and Sarah Nelson worked on the check it implementation.

For basic antiderivatives, we noted that not all texts introduce integrals before antiderivatives. So we opted to use the language "antiderivative of f(x)". There are 4 parts. One part is a trinomial. Another part is one of the basic functions (exponential, logarithmic, sine, cosine). One part is a different trig. The last part is a basic rational function. We would prefer the root to show as a root instead of a power, but we don't know how to do that with sage. Jean-Sébastien added a function to return the tex for root, but it needs to be tied into the rest of the generator.

We still want to find how to add different constants. Also, do we need function notation?

It feels like there are two different learning objectives in one here. The initial value problems still need to be created.

### June 9:
Hannah Burson: I implemented the IVP part with the function always a polynomial. I have a few thoughts:
  - I really think this part should be a separate learning objective.
  - I assumed "basic initial value problems" means only given f'(x) and f(n) find f(x).  When I teach calculus, I often give students f''(x) and two points and make them find f(x). Is that worth implementing in the public bank?
  - I chose to require the antiderivative to have integer coefficients to make the calculations easier.
  - It would be good to allow different names for the functions, but it was taking me too long to implement that. I did leave some lines commented out that could start that feature.

