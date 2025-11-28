# 🎛️ Linear Inverted Pendulum Control – MATLAB & Simulink

This folder contains my REE 310 Control Systems final project, where we modeled, analyzed, and stabilized a **linear inverted pendulum** using MATLAB, Simulink, transfer functions, and a PID controller designed using the **Root Locus** technique.

## 📌 Course

- Course: REE 310 – Control Systems  
- University: University of Science and Technology – Zewail City  
- Supervisor: **Dr. Mohamed Lotfi Eid Shaltout**  
- Students: Aya Atya, Beshoy Bahaa, Marwa Elbadry, **Phelopater Ramsis**, Shrouk Emara, Yara Abdullah  
:contentReference[oaicite:0]{index=0}

---

## 🧾 Project Overview

The goal of this project was to:

- Derive the **nonlinear equations of motion** for the inverted pendulum  
- Linearize the system using small-angle assumptions  
- Build the model in **MATLAB & Simulink**  
- Obtain the **open-loop transfer function**  
- Investigate system **stability**  
- Design and tune a **PID controller** using the Root Locus method  
- Simulate and verify closed-loop performance  

The inverted pendulum is a classical **unstable** system, making it a perfect example for modern control design.  
:contentReference[oaicite:1]{index=1}

---

## ⚙️ 1. System Modeling & Equations of Motion

Using Newton’s laws on both the **cart** and **pendulum**, we derived:

- Cart equation:  
  \( u(t) = \mu \dot{x} + (M+m)\ddot{x} - m l \ddot{\theta} \)
- Pendulum equation:  
  \( l m \ddot{x} + m g l \theta = (I + m l^2)\ddot{\theta} \)

After applying the **small-angle approximation** (sinθ ≈ θ, cosθ ≈ 1), the equations simplify and become suitable for linear modeling.  
Detailed derivation steps appear on **pages 5–7** of the report.  
:contentReference[oaicite:2]{index=2}

### 🧩 System Parameters (Page 7)

| Parameter | Value |
|----------|--------|
| Cart mass M | 2 kg |
| Pendulum mass m | 0.5 kg |
| Rod length l | 0.78 m |
| Friction coefficient μ | 0.88 |
| Inertia I | 6 kg·m² |
| Gravity g | 9.81 m/s² |

---

## 🖥️ 2. Simulink Modeling

A full Simulink model was built to represent the two differential equations.

- MATLAB script block sets parameters automatically  
- Two subsystems represent θ̈ and ẍ equations  
- System is linearized using **Simulink Linearization Tool**  
:contentReference[oaicite:3]{index=3}

The step response (page 9) clearly shows that **the open-loop system is unstable**, with the output blowing up to infinity.

---

## 📐 3. Transfer Function Derivation

Both approaches were used:

### ✔️ Simulink Linearization  
Generated TF is shown in Fig(9) (page 10).

### ✔️ Manual Laplace Transform  
After algebraic manipulation, the transfer function is:

\[
\frac{\theta(s)}{U(s)} = 
\frac{0.09995\, s}{s^3 + 0.4069 s^2 - 2.451 s - 0.8628}
\]

This exactly matches the Simulink result, confirming correctness.  
:contentReference[oaicite:4]{index=4}

---

## 🚨 4. Stability Analysis

Using the open-loop transfer function and MATLAB root locus:

- One pole lies in the **right-half plane**  
- Therefore, the system is **unstable**  
- Has infinite steady-state error for step / ramp / parabolic inputs  

Root locus diagram (page 12) shows divergence to the right.  
:contentReference[oaicite:5]{index=5}

---

## 🎯 5. Control Design Objectives

Since the system is unstable, the open-loop response cannot satisfy:

- Rise time  
- Settling time  
- Steady-state error  

Closed-loop system must achieve:

- Zero steady-state error for step input  
- Faster response  
- Damping to avoid oscillation  
:contentReference[oaicite:6]{index=6}

---

## 🎛️ 6. PID Controller (Root Locus Design)

We iteratively improved the controller by adding zeros & poles.

### First Attempt  
- ζ = 0.5  
- Ts = 0.4 s  
- Initial zeros: [0, –2]  
- Initial poles: [1.5, –3.49, –1.6]  
:contentReference[oaicite:7]{index=7}

### Second Attempt  
Added additional zeros & poles to improve damping and reduce overshoot.

### Final PID  
- Zeros: [0, –2, –3, –2.5]  
- Poles: [1.5, –3.49, –1.6, 0.01, 0.02]  

This produced a **stable** and **well-damped** closed-loop response (page 16).  
:contentReference[oaicite:8]{index=8}

---

## 🧪 7. Final SIMULINK System

The final Simulink system includes:

- PID block  
- Plant transfer function  
- Feedback loop  

Step response shows good stability and acceptable settling time (page 17).  
:contentReference[oaicite:9]{index=9}

---

## 🧠 Conclusion

- The inverted pendulum **open-loop** is unstable  
- Mathematical modeling and Simulink linearization matched perfectly  
- A stable closed-loop system was achieved using a carefully tuned **PID controller**  
- Root Locus helped determine proper poles/zeros for desired performance  
- PID implementation in Simulink verified successful stabilization  
:contentReference[oaicite:10]{index=10}

---

## 🗂️ Files in This Folder

- `Control Project.pdf` — full report with derivations, figures, and Simulink diagrams  
- `README.md` — this summary file  


