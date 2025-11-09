import math             # importing math libraries for trigonometric functions
import numpy            # importing pandas libraries for matrix operations
import matplotlib.pyplot as plt          # importing libraries to plot graphs
from mpl_toolkits.mplot3d import Axes3D     # to plot 3D plots

c=1         # a control variable for main loop
points=[]   # Array to store coordinates calculated to plot line plot

# Defining two unit matrices which will be used to simplify calculations of 
# transformations by transformation matrices 

T=[[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]] # Generation of a 4X4 matrix for calculation
T=numpy.mat(T)

# Generation of 4X4 matrix for transformation calculation from universal frame point of view
T_U=[[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]] 
T_U=numpy.mat(T_U)

# Defining a function to calculate linear translation in x direction
def Trans_x(d): # d is variable for input of distance translated
    T_X=[[1,0,0,d],[0,1,0,0],[0,0,1,0],[0,0,0,1]] # translation matrix_x 
    T_X=numpy.mat(T_X)
    return T_X # output of function which is translation 4X4 matrix in x

# Defining a function to calculate linear translation in z direction
def Trans_z(d): # d is variable for input of distance translated
    T_Z=[[1,0,0,0],[0,1,0,0],[0,0,1,d],[0,0,0,1]]  # translation matrix_z
    T_Z=numpy.mat(T_Z)
    return T_Z  # output of function which is translation 4X4 matrix in z

# Defining a function to calculate rotation about x axis
def Rot_x(t): # t is variable that takes input of angle rotated i.e theta
    rad = math.radians(t)   # rad is variable for angle in radians
    ST = math.sin(rad)      # ST is sine(theta)
    CT = math.cos(rad)      # CT is cosine(theta)
    R_X=[[1,0,0,0],[0,CT,-ST,0],[0,ST,CT,0],[0,0,0,1]]
    R_X=numpy.mat(R_X)
    return R_X # output of function which is rotation 4X4 matrix in x

# Defining a function to calculate rotation about z axis
def Rot_z(t):  # t is variable that takes input of angle rotated i.e theta
    rad = math.radians(t) # rad is variable for angle in radians
    ST = math.sin(rad)    # ST is sine(theta)
    CT = math.cos(rad)    # CT is cosine(theta)
    R_Z=[[CT,-ST,0,0],[ST,CT,0,0],[0,0,1,0],[0,0,0,1]]
    R_Z=numpy.mat(R_Z)
    return R_Z # output of function which is rotation 4X4 matrix in z

# Defining a function to calculate screw_x
# screw_x is the transation function about x (product of translation and rotation) 
def Screw_x(d,t):
    S_x=Rot_x(t)*Trans_x(d)
    return S_x # output of function which is transformation 4X4 matrix in x

# Defining a function to calculate screw_x
# screw_x is the transation function about x (product of translation and rotation) 
def Screw_z(d,t):
    S_z=Rot_z(t)*Trans_z(d)
    return S_z  # output of function which is transformation 4X4 matrix in z

# Units used in calculations
# Angles : degrees
# Length : mm

a=(0,0,0)         # Point 1 : 0,0,0
points.append(a)  # adding point one for plotting

# Calulations for link 1
t_1=float(input('Please enter angle theta_1 : ')) # t_1 is variable theta_1
d_1=0
al_1=-90
a_1=70
T_U_1=Screw_z(d_1, t_1)*Screw_x(a_1, al_1) # transformation for link 1 wrt Universal coordinates
T_U_1=T_U_1*T
x=T_U_1[0,3]
y=T_U_1[1,3]
z=T_U_1[2,3]
R_1=(x,y,z)     # variable to store coordinates
print('')       # To give space in output
print('end coordinates of link 1 :')
print('')
print(R_1)      # Display of coordinates of end of link
points.append(R_1)


# Calulations for link 2
t_2=float(input('Please enter angle theta_2 : ')) # t_2 is variable theta_2
d_2=0
al_2=0
a_2=200
T_1_2=Screw_z(d_2, t_2)*Screw_x(a_2, al_2) # transformation for link 2 wrt 1
T_U_2=T_U_1*T_1_2
x=T_U_2[0,3]
y=T_U_2[1,3]
z=T_U_2[2,3]
R_2=(x,y,z)        # variable to store coordinates
print('')
print('end coordinates of link 2 :')
print('')
print(R_2)         # Display of coordinates of end of link
points.append(R_2)

# Calulations for link 3
t_3=float(input('Please enter angle theta_3 : ')) # t_3 is variable theta_3
d_3=0
al_3=0
a_3=200
T_2_3=Screw_z(d_3, t_3)*Screw_x(a_3, al_3) # transformation for link 3 wrt 2
T_U_3=T_U_1*T_1_2*T_2_3
x=T_U_3[0,3]
y=T_U_3[1,3]
z=T_U_3[2,3]
R_3=(x,y,z)     # variable to store coordinates
print('')
print('end coordinates of link 3 :')
print('')
print(R_3)      # Display of coordinates of end of link
points.append(R_3)

# Generation and display of table of D-H values
D_H=[['Frame','t_i','d_i','al_i','a_i'],[1,t_1,d_1,al_1,a_1],[2,t_2,d_2,al_2,a_2],[3,t_3,d_3,al_3,a_3]]
D_H=numpy.mat(D_H)
print('')
print('D-H values are : ')
print(D_H)



# Steps followed to plot the calculated coordinates in line plot
# Extract x, y, and z coordinates
x_coords, y_coords, z_coords = zip(*points)

# Create a 3D line plot
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

ax.plot(x_coords, y_coords, z_coords, c='blue', marker='o')

# Set labels for each axis
ax.set_xlabel('X Axis')
ax.set_ylabel('Y Axis')
ax.set_zlabel('Z Axis')

# Show the plot
plt.show()