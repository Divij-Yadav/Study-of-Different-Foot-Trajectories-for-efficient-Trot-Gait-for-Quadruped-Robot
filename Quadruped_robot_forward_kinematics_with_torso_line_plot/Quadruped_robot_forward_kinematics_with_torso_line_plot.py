import math             # importing math libraries for trigonometric functions
import numpy            # importing pandas libraries for matrix operations
import matplotlib.pyplot as plt          # importing libraries to plot graphs
from mpl_toolkits.mplot3d import Axes3D     # to plot 3D plots

# Defining a function to calculate linear translation in x direction
def Trans_x(d): # d is variable for input of distance translated
    T_X=[[1,0,0,d],[0,1,0,0],[0,0,1,0],[0,0,0,1]] # translation matrix_x 
    T_X=numpy.mat(T_X)
    return T_X # output of function which is translation 4X4 matrix in x

# Defining a function to calculate linear translation in y direction
def Trans_y(d): # d is variable for input of distance translated
    T_Y=[[1,0,0,0],[0,1,0,d],[0,0,1,0],[0,0,0,1]] # translation matrix_y 
    T_Y=numpy.mat(T_Y)
    return T_Y # output of function which is translation 4X4 matrix in y

# Defining a function to calculate linear translation in z direction
def Trans_z(d): # d is variable for input of distance translated
    T_Z=[[1,0,0,0],[0,1,0,0],[0,0,1,d],[0,0,0,1]]  # translation matrix_z
    T_Z=numpy.mat(T_Z)
    return T_Z  # output of function which is translation 4X4 matrix in z

# Defining a function to calculate composite linear translation in x,y,z direction
def Trans_composite(x,y,z):
    T_C=Trans_x(x)*Trans_y(y)*Trans_z(z)
    T_C=numpy.mat(T_C)
    return T_C

# Defining a function to calculate rotation about x axis
def Rot_x(t): # t is variable that takes input of angle rotated i.e theta
    rad = math.radians(t)   # rad is variable for angle in radians
    ST = math.sin(rad)      # ST is sine(theta)
    CT = math.cos(rad)      # CT is cosine(theta)
    R_X=[[1,0,0,0],[0,CT,-ST,0],[0,ST,CT,0],[0,0,0,1]]
    R_X=numpy.mat(R_X)
    return R_X # output of function which is rotation 4X4 matrix in x

# Defining a function to calculate rotation about y axis
def Rot_y(t): # t is variable that takes input of angle rotated i.e theta
    rad = math.radians(t)   # rad is variable for angle in radians
    ST = math.sin(rad)      # ST is sine(theta)
    CT = math.cos(rad)      # CT is cosine(theta)
    R_Y=[[CT,0,ST,0],[0,1,0,0],[-ST,0,CT,0],[0,0,0,1]]
    R_Y=numpy.mat(R_Y)
    return R_Y # output of function which is rotation 4X4 matrix in x

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

c=1 # control variable for program loop

L=505
W=360

while c==1:
    
    points=[]

    p_1=(0,0,0)
    points.append(p_1)
    
    # Fixed values 
    L_hip=70
    L_thigh=200
    L_shank=200

    # origin frame
    P_1=[[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]]
    al_1=float(input('Enter angle of roll : '))  # roll angle alpha
    be_1=float(input('Enter angle of pitch : ')) # pitch angle beta
    ga_1=float(input('Enter angle of yaw : '))   # Yaw angle gamma
    P_1=P_1*Rot_z(ga_1)*Rot_y(be_1)*Rot_x(al_1)

    # Calculations for point 2
    P_2=P_1*Trans_composite(L/2, W/2, 0) # position vector of point_2
    x_2=P_2[0,3]
    y_2=P_2[1,3] 
    z_2=P_2[2,3]
    p_2=(x_2,y_2,z_2)
    points.append(p_2)

    # Calculation for Left Front (LF) leg

    # orientation of frame
    P_2_0=P_2*Rot_y(90)*Rot_x(90)

    #calculations for hip link
    t_3=float(input('Enter angle theta_1 for LF leg : '))
    P_3=P_2_0*Screw_z(0,t_3)*Screw_x(L_hip, 0)             # point 3
    x_3=P_3[0,3]
    y_3=P_3[1,3] 
    z_3=P_3[2,3]
    p_3=(x_3,y_3,z_3)
    points.append(p_3)
    
    #calculations for thigh link
    t_4=float(input('Enter angle theta_2 LF leg : '))
    P_4=P_3*Screw_z(0,t_4)*Screw_x(L_thigh, 0)          # point 4
    x_4=P_4[0,3]
    y_4=P_4[1,3] 
    z_4=P_4[2,3]
    p_4=(x_4,y_4,z_4)
    points.append(p_4)
    
    #calculations for shank link
    t_5=float(input('Enter angle theta_3 LF leg : '))
    P_5=P_4*Screw_z(0,t_5)*Screw_x(L_shank, 0)        # point 5
    x_5=P_5[0,3]
    y_5=P_5[1,3] 
    z_5=P_5[2,3]
    p_5=(x_5,y_5,z_5)
    points.append(p_5)
    
    points.append(p_4)
    points.append(p_3)
    points.append(p_2)
    points.append(p_1)
    
    # Calculations for point 6
    P_6=P_1*Trans_composite(L/2, -W/2, 0) # position vector of point_6
    x_6=P_6[0,3]
    y_6=P_6[1,3] 
    z_6=P_6[2,3]
    p_6=(x_6,y_6,z_6)
    points.append(p_6)

    # Calculation for Right Front (RF) leg

    # orientation of frame
    P_6_0=P_6*Rot_y(90)*Rot_x(90)

    #calculations for hip link
    t_7=float(input('Enter angle theta_7 for RF leg : '))
    P_7=P_6_0*Screw_z(0,t_7)*Screw_x(L_hip, 0)             # point 7
    x_7=P_7[0,3]
    y_7=P_7[1,3] 
    z_7=P_7[2,3]
    p_7=(x_7,y_7,z_7)
    points.append(p_7)
    
    #calculations for thigh link
    t_8=float(input('Enter angle theta_8 RF leg : '))
    P_8=P_7*Screw_z(0,t_8)*Screw_x(L_thigh, 0)          # point 8
    x_8=P_8[0,3]
    y_8=P_8[1,3] 
    z_8=P_8[2,3]
    p_8=(x_8,y_8,z_8)
    points.append(p_8)
    
    #calculations for shank link
    t_9=float(input('Enter angle theta_9 RF leg : '))
    P_9=P_8*Screw_z(0,t_9)*Screw_x(L_shank, 0)        # point 9
    x_9=P_9[0,3]
    y_9=P_9[1,3] 
    z_9=P_9[2,3]
    p_9=(x_9,y_9,z_9)
    points.append(p_9)
    
    points.append(p_8)
    points.append(p_7)
    points.append(p_6)
    points.append(p_1)
    
    # Calculations for point 10
    P_10=P_1*Trans_composite(-L/2, -W/2, 0) # position vector of point_10
    x_10=P_10[0,3]
    y_10=P_10[1,3] 
    z_10=P_10[2,3]
    p_10=(x_10,y_10,z_10)
    points.append(p_10)

    # Calculation for Right Hind (RH) leg

    # orientation of frame
    P_10_0=P_10*Rot_y(90)*Rot_x(90)

    #calculations for hip link
    t_11=float(input('Enter angle theta_11 for RH leg : '))
    P_11=P_10_0*Screw_z(0,t_11)*Screw_x(L_hip, 0)             # point 11
    x_11=P_11[0,3]
    y_11=P_11[1,3] 
    z_11=P_11[2,3]
    p_11=(x_11,y_11,z_11)
    points.append(p_11)
    
    #calculations for thigh link
    t_12=float(input('Enter angle theta_12 RH leg : '))
    P_12=P_11*Screw_z(0,t_12)*Screw_x(L_thigh, 0)          # point 12
    x_12=P_12[0,3]
    y_12=P_12[1,3] 
    z_12=P_12[2,3]
    p_12=(x_12,y_12,z_12)
    points.append(p_12)
    
    #calculations for shank link
    t_13=float(input('Enter angle theta_13 RH leg : '))
    P_13=P_12*Screw_z(0,t_13)*Screw_x(L_shank, 0)        # point 13
    x_13=P_13[0,3]
    y_13=P_13[1,3] 
    z_13=P_13[2,3]
    p_13=(x_13,y_13,z_13)
    points.append(p_13)
    
    points.append(p_12)
    points.append(p_11)
    points.append(p_10)
    points.append(p_1)
    
    # Calculations for point 14
    P_14=P_1*Trans_composite(-L/2, W/2, 0) # position vector of point_10
    x_14=P_14[0,3]
    y_14=P_14[1,3] 
    z_14=P_14[2,3]
    p_14=(x_14,y_14,z_14)
    points.append(p_14)

    # Calculation for Left Hind (LH) leg

    # orientation of frame
    P_14_0=P_14*Rot_y(90)*Rot_x(90)

    #calculations for hip link
    t_15=float(input('Enter angle theta_15 for LH leg : '))
    P_15=P_14_0*Screw_z(0,t_15)*Screw_x(L_hip, 0)             # point 15
    x_15=P_15[0,3]
    y_15=P_15[1,3] 
    z_15=P_15[2,3]
    p_15=(x_15,y_15,z_15)
    points.append(p_15)
    
    #calculations for thigh link
    t_16=float(input('Enter angle theta_16 LH leg : '))
    P_16=P_15*Screw_z(0,t_16)*Screw_x(L_thigh, 0)          # point 16
    x_16=P_16[0,3]
    y_16=P_16[1,3] 
    z_16=P_16[2,3]
    p_16=(x_16,y_16,z_16)
    points.append(p_16)
    
    #calculations for shank link
    t_17=float(input('Enter angle theta_17 LH leg : '))
    P_17=P_16*Screw_z(0,t_17)*Screw_x(L_shank, 0)        # point 17
    x_17=P_17[0,3]
    y_17=P_17[1,3] 
    z_17=P_17[2,3]
    p_17=(x_17,y_17,z_17)
    points.append(p_17)
    
    points.append(p_16)
    points.append(p_15)
    points.append(p_14)
    points.append(p_1)
    
    
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
    
    c=int(input('To continue the program enter 1 else enter 0 : '))