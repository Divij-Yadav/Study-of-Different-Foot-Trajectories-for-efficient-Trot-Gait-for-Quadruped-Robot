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

---

### Note:
- Trajectory modelling methodology is explained in the document: `TRAJECTORY GENERATION METHODOLOGY AND MODELLING`
- Trot gait generation is explained in the document: `GAIT GENERATION`
- All output plots obtained are stored in the file: `Output Plots`
