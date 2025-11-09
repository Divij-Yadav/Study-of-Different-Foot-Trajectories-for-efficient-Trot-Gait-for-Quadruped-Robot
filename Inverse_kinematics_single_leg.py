import sympy as sp
import math

t1,t2,t3=sp.symbols('t1 t2 t3')
Ry1=sp.Matrix([[0,0,1,0],[0,1,0,0],[-1,0,0,0],[0,0,0,1]])
Rx1=sp.Matrix([[1,0,0,0],[0,0,-1,0],[0,1,0,0],[0,0,0,1]])
Rx2=sp.Matrix([[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]])
Rx3=sp.Matrix([[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]])
Rz1=sp.Matrix([[sp.cos(t1),-sp.sin(t1),0,0],[sp.sin(t1),sp.cos(t1),0,0],[0,0,1,0],[0,0,0,1]])
Rz2=sp.Matrix([[sp.cos(t2),-sp.sin(t2),0,0],[sp.sin(t2),sp.cos(t2),0,0],[0,0,1,0],[0,0,0,1]])
Rz3=sp.Matrix([[sp.cos(t3),-sp.sin(t3),0,0],[sp.sin(t3),sp.cos(t3),0,0],[0,0,1,0],[0,0,0,1]])
Tx1=sp.Matrix([[1,0,0,70],[0,1,0,0],[0,0,1,0],[0,0,0,1]])
Tx2=sp.Matrix([[1,0,0,200],[0,1,0,0],[0,0,1,0],[0,0,0,1]])
Tx3=sp.Matrix([[1,0,0,200],[0,1,0,0],[0,0,1,0],[0,0,0,1]])
Tz1=sp.Matrix([[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]])
Tz2=sp.Matrix([[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]])
Tz3=sp.Matrix([[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]])
T_0_1=(Rz1*Tz1)*(Rx1*Tx1)
T_1_2=(Rz2*Tz2)*(Rx2*Tx2)
T_2_3=(Rz3*Tz3)*(Rx3*Tx3)
T_0_3=T_0_1*T_1_2*T_2_3
print('Resultant transformation matrix of link 3 w.r.t reference frame is : ')
sp.pprint(T_0_3)

z=float(input('Enter the final z coordinate : '))
x=float(input('Enter the final x coordinate : '))
y=float(input('Enter the final y coordinate : '))

equation1 = sp.Eq(T_0_3[0,3], x)
equation2 = sp.Eq(T_0_3[1,3], y)
equation3 = sp.Eq(T_0_3[2,3], z)

solution = sp.solve((equation1, equation2, equation3), (t1, t2, t3))

print("Solution:")
sp.pprint(solution)

'''
d_x = ((solution[t1]*180)/math.pi)
d_y = ((solution[t2]*180)/math.pi) 
d_z = ((solution[t3]*180)/math.pi)

degree_solution = {x: d_x, y: d_y, z: d_z}

print("Solution in degrees :")
sp.pprint(degree_solution)

'''