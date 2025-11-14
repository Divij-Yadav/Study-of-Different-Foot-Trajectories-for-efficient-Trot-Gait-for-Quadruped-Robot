# Study-of-Different-Foot-Trajectories-for-efficient-Trot-Gait-for-Quadruped-Robot

This repository contains the full modeling, simulation, and validation pipeline for a quadruped robot’s locomotion system. All components are derived analytically from first principles and validated through visualizations and simulation.

## 🦿 **1. Overview**

This project provides:

### ✔ Forward Kinematics (FK)
- FK for a **single leg** using D-H parameters and screw operations  
- FK for **all four legs** relative to a floating torso  
- FK with **body orientation (roll–pitch–yaw)** included  
- 3D plotting of link positions and full quadruped configuration  

### ✔ Inverse Kinematics (IK)
- Analytical IK solution for the 3-DOF quadruped leg  
- Solves for all possible sets of (θ₁, θ₂, θ₃)  
- Validated with numerical examples  

### ✔ Trajectory Generation
Implemented for foot motion in **Cartesian space**, using:
- **Cubic polynomial trajectories**  
- **Half-sine (cycloidal) trajectories**  
- **Quintic polynomial trajectories**  

Each trajectory section includes:
- X(t), Z(t) motion  
- Velocity and acceleration profiles  
- X–Z foot path visualization  
- Full derivations (see PDF)  

### ✔ Gait Generation (Trot Gait)
- Balanced trot gait (D = 0.5)  
- Walking trot gait (D > 0.5)  
- Includes step timing, leg-pair phasing, stride definitions  
- Torso + foot motion visualization  
---

## 📂 **2. Description of Main Scripts**

### 🔹 **Quadruped_robot_forward_kinematics_with_torso_line_plot/**
Plots all 4 legs of the quadruped using:
- D-H transform matrices  
- Composite rotation matrix (roll–pitch–yaw)  
- 3D visualization of torso + legs  

---

### 🔹 **Single_leg_forward_kinematics_line_plot/**
- Computes transformations step-by-step  
- Plots the configuration of a **single leg**  
- Uses D-H parameters and screw operators  

---

### 🔹 **Inverse_kinematics_single_leg.py**
- Computes IK for a single 3-DOF leg  
- Solves for all valid angle sets  
- Outputs solutions in radians  

---

### 🔹 **Coeff Cal Quintic.py**
- Computes coefficients of quintic trajectory  
- Uses boundary conditions for position / velocity / acceleration  

---

### 🔹 **Trajectory_Comparision/**
Compares:
- **Cubic trajectories**  
- **Half-sine trajectories**  
- **Quintic trajectories**  

Plots for each:
- X vs Time  
- Z vs Time  
- Velocity  
- Acceleration  
- Combined X–Z trajectory  

---

### 🔹 **Trot_new/**
- Implements trot gait cycle using predefined stride parameters  
- Uses quintic trajectories for foot swing  
- Handles leg phasing  
- Plots all four legs over time  

---

### 🔹 **Variable_velocity_trot_4/**
- Extends trot gait simulation to **variable forward velocity**  
- Supports dynamic stepping  
- Torso velocity parameters included  


# Trajectory Equations

This section summarizes the mathematical models used to generate smooth swing trajectories, stance motion, and trot-gait timing for the quadruped robot. Only the essential forms are included here, while detailed derivations appear in the project documentation.

## 1. Polynomial Trajectory Models

### **Cubic Trajectory**

Used for simple point-to-point motion when initial and final velocities are zero.

$$
x(t) = c_0 + c_1 t + c_2 t^2 + c_3 t^3
$$

Boundary-condition coefficients:

$$
c_0 = x_0, \qquad
c_1 = 0, \qquad
c_2 = \frac{3(x_f - x_0)}{T^2}, \qquad
c_3 = -\frac{2(x_f - x_0)}{T^3}
$$

---

### **Quintic Trajectory**

Ensures smooth position, velocity, and acceleration.

$$
x(t) = c_0 + c_1 t + c_2 t^2 + c_3 t^3 + c_4 t^4 + c_5 t^5
$$

Coefficients:

$$
c_0 = x_i, \qquad
c_1 = v_i, \qquad
c_2 = \frac{1}{2} a_i
$$

$$
c_3 = 
\frac{
20\Delta x - (8v_f + 12v_i)T - (3a_i - a_f)T^2
}{
2T^3
}
$$

$$
c_4 =
\frac{
-30\Delta x + (14v_f + 16v_i)T + (3a_i - 2a_f)T^2
}{
2T^4
}
$$

$$
c_5 =
\frac{
12\Delta x - 6(v_f + v_i)T - (a_i - a_f)T^2
}{
2T^5
}
$$

with:

$$
\Delta x = x_f - x_i
$$

---

## 2. Swing Trajectory (Composite Cycloid / Half-Sine)

Normalized swing time:

$$
t_n = \frac{t}{T_y}
$$

### **X-Direction (Forward Swing)**

$$
x(t) = S_0 \left( t_n - \frac{\sin(2\pi t_n)}{2\pi} \right)
$$

**Placeholder — X vs Time Plot**

![X Swing Trajectory](path/to/x_swing_plot.png)

---

### **Z-Direction (Swing Foot Height)**

$$
z(t) = H_0 \left( t_n - \frac{\sin(4\pi t_n)}{4\pi} \right)
$$

Fall phase:

$$
z_{\text{fall}}(t) = H_0 - z_{\text{rise}}(t)
$$

**Placeholder — Z vs Time Plot**

![Z Swing Trajectory](path/to/z_swing_plot.png)

---

# Trot Gait

## 1. Stance Motion

During stance, the foot remains on the ground:

$$
z(t) = 0, \qquad
x(t) = x_0 + Vt, \qquad
V = \frac{S}{T}
$$

**Placeholder — Stance Motion Plot**

![Stance Motion](path/to/stance_plot.png)

---

## 2. Duty Factor & Trot Gait Timing

Duty factor:

$$
D = \frac{T_s}{T_c}
$$

- \(D = 0.5\): balanced trot    
- \(D > 0.5\): walking trot  

Diagonal leg pairs alternate swing and stance with a half-cycle phase shift.

**Placeholder — Gait Timing Diagram**

![Gait Timing](path/to/gait_timing_plot.png)

---
