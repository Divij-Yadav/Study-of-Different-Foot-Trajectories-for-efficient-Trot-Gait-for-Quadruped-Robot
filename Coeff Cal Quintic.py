from sympy import symbols, Eq, solve

C0,C1,C2,C3,C4,C5,T,Vx,Vz,H,D,x1,x2,x3,x4,z1,z2,z3,z4,S=symbols('C0 C1 C2 C3 C4 C5 T Vx Vz H D x1 x2 x3 x4 z1 z2 z3 z4 S')

V=(5*S)/T

Ti=0.15*T
Tf=0.3*T

pi=z1+H
pf=z1

vi=Vz
vf=0

ai=0
af=0

e1=Eq(C0+C1*(Ti)+C2*(Ti**2)+C3*(Ti**3)+C4*(Ti**4)+C5*(Ti**5),pi)
e2=Eq(C1+2*C2*(Ti)+3*C3*(Ti**2)+4*C4*(Ti**3)+5*C5*(Ti**4),vi)
e3=Eq(2*C2+6*C3*(Ti)+12*C4*(Ti**2)+20*C5*(Ti**3),ai)
e4=Eq(C0+C1*(Tf)+C2*(Tf**2)+C3*(Tf**3)+C4*(Tf**4)+C5*(Tf**5),pf)
e5=Eq(C1+2*C2*(Tf)+3*C3*(Tf**2)+4*C4*(Tf**3)+5*C5*(Tf**4),vf)
e6=Eq(2*C2+6*C3*(Tf)+12*C4*(Tf**2)+20*C5*(Tf**3),af)
    
solutions = solve((e1,e2,e3,e4,e5,e6), (C0,C1,C2,C3,C4,C5))

print(solutions)

