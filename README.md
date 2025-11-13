# Study-of-Different-Foot-Trajectories-for-efficient-Trot-Gait-for-Quadruped-Robot

This repository contains the full modeling, simulation, and validation pipeline for a quadruped robot’s locomotion system. All components are derived analytically from first principles and validated through visualizations and simulation.

## Core Contributions

✔ **Developed and validated Forward Kinematics (FK) for:**
- A single 3-link robotic leg  
- A full quadruped with floating torso orientation (roll–pitch–yaw)

✔ **Implemented Inverse Kinematics (IK)** for the 3-link leg with closed-form solutions.

✔ **Conducted a complete study of trajectory generation**, implementing and comparing:
- Cubic polynomial trajectories  
- Quintic polynomial trajectories  
- Half-sine / Composite cycloidal trajectories  

✔ **Built MATLAB simulations** for analyzing position, velocity, and acceleration profiles of each curve.

✔ **Developed a complete trot gait engine with adjustable duty factor**, supporting:
- Balanced trot gait (D = 0.5)   
- Walking trot gait (D > 0.5)

✔ **Visual validation** via 2D/3D plots for FK, IK solutions, foot trajectories, and gait sequences.

# 🦿 1. Kinematic Modeling

## 1.1 Forward Kinematics of Single Leg

A 3-DOF leg is modeled using standard **Denavit–Hartenberg (D–H) parameters**.  
Transformations are computed using screw operations:

$$
^{i-1}T_i = \text{Screw}_z(\theta_i, d_i)\,\text{Screw}_x(\alpha_i, a_i)
$$

From these transforms, the global position of each link is computed:

$$
U^iT = U^0T \cdot \prod_j \ ^{j-1}T_j
$$

The FK solver:

- Computes hip, knee, and foot positions  
- Plots the resulting leg configuration  
- Validates correctness across a wide set of joint angles  

---

## 1.2 Forward Kinematics of Full Quadruped with Torso Orientation

The torso serves as a floating base with roll–pitch–yaw angles \((\alpha, \beta, \gamma)\):

$$
R = R_z(\gamma)\,R_y(\beta)\,R_x(\alpha)
$$

Each leg’s hip is offset from the torso center.  
The FK system computes **17 total key points** (torso + 4 legs × 4 joints).

The full FK module supports:

- Body rotations  
- Arbitrary joint angle sets for all four legs  
- Visualization of the complete 3D stance configuration  

---

## 1.3 Inverse Kinematics

IK solves for joint angles \((\theta_1, \theta_2, \theta_3)\) from a desired foot position \((p_x, p_y, p_z)\).

Closed-form nonlinear equations:

$$
x(\theta_1,\theta_2,\theta_3) = p_x,\quad
y(\theta_1,\theta_2,\theta_3) = p_y,\quad
z(\theta_1,\theta_2,\theta_3) = p_z
$$

The solver produces **up to four valid IK branches**, corresponding to different feasible physical configurations.


# 🚶‍♂️ 2. Trajectory Generation

Trajectory generation explores three major curves:
- **Cubic polynomial**
- **Quintic polynomial**
- **Cycloidal / Half-sine**

Simulations compare their:
- Smoothness  
- Velocity continuity  
- Acceleration peaks  
- Feasibility for legged locomotion  

---

## 2.1 Cubic Polynomial Trajectories

General cubic:

$$
x(t)=c_0+c_1 t + c_2 t^2 + c_3 t^3
$$

Used for:
- Swing phase motion  
- Rise/fall in Z direction  

Pros:
- Smooth position/velocity  
Cons:
- Acceleration discontinuous  

---

## 2.2 Quintic Polynomial Trajectories

General form:

$$
x(t)=c_0+c_1 t + c_2 t^2 + c_3 t^3 + c_4 t^4 + c_5 t^5
$$

Constraints enforced on:
- Position  
- Velocity  
- Acceleration  

Produces **very smooth** curve ideal for dynamic gaits.

---

## 2.3 Half-Sine / Composite Cycloidal Trajectories

Based on a half sine curve:

$$
x(t) = A\sin(\omega t) + B
$$

Used for:
- Natural foot-swing arcs  
- Smooth landing and lift-off  

Advantages:
- Simple closed form  
- Smooth acceleration profile  

---

# 🐾 3. Gait Generation

A complete trot gait engine with adjustable **duty factor (D)** is implemented.

Definitions:
- **Stride length (S)**  
- **Step length (L = S/2)**  
- **Cycle time (T)**  
- **Velocity (V = S/T)**  

---

## 3.1 Balanced Trot Gait (D = 0.5)

Diagonal legs move together:
- LF + RH in swing  
- RF + LH in swing

No swing overlap → maximally stable trot.

---

## 3.2 Running Trot Gait (D < 0.5)

- Swing phase becomes longer  
- Reduced stance time  
- Faster forward motion  
- Simulates dynamic running trot  

---

## 3.3 Walking Trot Gait (D > 0.5)

- Longer stance time  
- Increased stability  
- Suitable for slow precision walking  

---



## **Cubic Trajectory**

$$
x(t) = at^3 + bt^2 + ct + d
$$

$$
\dot{x}(t) = 3at^2 + 2bt + c
$$

$$
\ddot{x}(t) = 6at + 2b
$$

### **Boundary–Condition Coefficients**

$$
c_0 = x_0
$$

$$
c_1 = 0
$$

$$
c_2 = \frac{3(x_f - x_0)}{T^2}
$$

$$
c_3 = -\frac{2(x_f - x_0)}{T^3}
$$


---

## **Quintic Trajectory**

$$
x(t) = at^5 + bt^4 + ct^3 + dt^2 + et + f
$$

$$
\dot{x}(t) = 5at^4 + 4bt^3 + 3ct^2 + 2dt + e
$$

$$
\ddot{x}(t) = 20at^3 + 12bt^2 + 6ct + 2d
$$

### **Boundary Conditions**

$$
x(0)=x_i,\quad x(T)=x_f,\quad
\dot{x}(0)=v_i,\quad \dot{x}(T)=v_f,\quad
\ddot{x}(0)=a_i,\quad \ddot{x}(T)=a_f
$$


### **General Coefficient Solution**

$$
c_0 = x_i
$$

$$
c_1 = v_i
$$

$$
c_2 = \frac{1}{2} a_i
$$

$$
c_3 =
\frac{
20(x_f - x_i) - (8v_f + 12v_i)T - (3a_i - a_f)T^2
}{2T^3}
$$

$$
c_4 =
\frac{
-30(x_f - x_i) + (14v_f + 16v_i)T + (3a_i - 2a_f)T^2
}{2T^4}
$$

$$
c_5 =
\frac{
12(x_f - x_i) - 6(v_f + v_i)T - (a_i - a_f)T^2
}{2T^5}
$$


---

## **Composite Cycloid / Half-Sine Trajectory**

### **General Sine Form**

$$
x(t) = A\sin(\omega t) + B
$$

$$
\ddot{x}(t) = -A\omega^2 \sin(\omega t)
$$


---

## **X–Direction (Swing Cycloid)**

$$
t_n = \frac{t}{T}
$$

$$
k = \frac{2\pi S_0}{T^2}
$$

$$
\ddot{x}(t) = k \sin(2\pi t_n)
$$

$$
x(t) = \frac{kT}{2\pi}\left( t_n - \frac{\sin(2\pi t_n)}{2\pi} \right)
$$


---

## **Z–Direction (Rise Phase)**

$$
k = \frac{8\pi H_0}{T^2}
$$

$$
\ddot{z}(t) = k \sin\left(4\pi \frac{t}{T}\right)
$$

$$
z(t) =
\frac{kT}{4\pi}
\left(
T - \frac{T}{4\pi}\sin\left(4\pi \frac{t}{T}\right)
\right)
$$


---

## **Z–Direction (Fall Phase)**

$$
\ddot{z}(t) = -k \sin\left(4\pi \frac{t}{T}\right)
$$

$$
z(t) =
H_0 -
\frac{kT}{4\pi}
\left(
T - \frac{T}{4\pi}\sin\left(4\pi \frac{t}{T}\right)
\right)
$$


---

## **Duty Factor / Gait Equations**

$$
D = \frac{T_s}{T_c}
$$

$$
V = \frac{S}{T}
$$
