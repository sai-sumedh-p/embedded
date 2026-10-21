# Robotics & Control Lab – Part B codes

Codes for Part B (Exp 10–17) of the *Robotics & Control Lab Manual Part A/B*.

## Files

| Exp | Experiment | File | Type |
|---|---|---|---|
| 10 | Work envelope and configuration of a 2R arm | `exp10_work_envelope_2R.m` | Script (run it) |
| 11 | Inverse kinematics of a 2R arm | `exp11_inverse_kinematics_2R.m` | Script |
| 12 a | Forward kinematics of a 3R arm | `exp12a_forward_kinematics_3R.m` | Script |
| 12 b | Inverse kinematics of a 3R arm – straight line | `exp12b_inverse_kinematics_3R_line.m` | Script |
| 12 c | Inverse kinematics of a 3R arm – circle | `exp12c_inverse_kinematics_3R_circle.m` | Script |
| 13 | Introduction to RST, import robot as rigidBodyTree | `exp13_rst_intro_import_robot.m` | Script |
| 14 | FK and IK using RST | `exp14_fk_ik_rst_callback.m` | Callback code |
| 15 | Forward and inverse dynamics using RST | `exp15_dynamics_rst_callback.m` | Callback code |
| 16 a | Polynomial trajectory | `exp16a_polynomial_trajectory_callback.m` | Callback code |
| 16 b | Trapezoidal velocity profile | `exp16b_trapezoidal_trajectory_callback.m` | Callback code |
| 17 | Open loop system | `exp17_open_loop_callback.m` | Callback code |
| 17 | PID control | `exp17_pid_callback.m` | Callback code |
| 17 | Computed torque control | `exp17_computed_torque_control_callback.m` | Callback code |
| 17 | PID trajectory tracking (m-script) | `exp17_pid_trajectory_tracking.m` | Script |

The Simulink models are one folder up, in `robotics/`: `FK_lab.slx`, `IK_lab.slx`, `model.slx`, `Open_loop.slx`, `pid_lab.slx`, `poly_Traj_lab.slx`, `Trajec_gene_lab.slx`.

**Where the code came from:**
- **Exp 10–12:** the manual only gives fill-in-the-blank sample programs. These files are completed versions that follow the manual's procedure, link lengths and angle ranges.
- **Exp 13–17 callbacks:** copied as printed in the manual. Notes inside each file point out lines the manual leaves out (`t1` in 16 b, `t1`/`vp1` in CTC).
- **Exp 17 m-script:** uses the manual's equations. The manual leaves the numbers blank, so the link lengths, masses, path and PID gains are our choice. The manual writes θ1 with tan⁻¹(x/y); the script uses `atan2(y, x)`, which is the standard form and gives the correct quadrant.

## How to connect a code to the Callback Button

The RST blocks (Forward/Inverse Kinematics, Inverse/Forward Dynamics) need `TwoR_armTree` in the MATLAB workspace. The trajectory blocks need `wp1`, `t1`, `v1` and so on. The callback code creates these variables before the simulation runs.

### Step 0 – file name in the callback

The callback imports `ExpS1a_TwoR_armModel.slx` (the manual's name). Change it to the name of **your** Simscape arm model, for example `model.slx`. That model must be in the same folder as the lab model, or on the MATLAB path.

### Method 1 – Callback Button block (as in the manual)

1. Open your lab model (for example `pid_lab.slx`).
2. In the **Library Browser**, go to **Simulink → Dashboard** and drag a **Callback Button** onto the model.
   (Shortcut: click on an empty part of the canvas, type `Callback Button`, press Enter.)
3. **Double-click** the Callback Button to open its parameters.
4. Optionally, in **Button text**, type a label such as `Load robot`.
5. Paste the callback code into the **ClickFcn** box (or **PressFcn**: ClickFcn runs when you click and release).
   For example, paste the whole of `exp17_pid_callback.m`.
6. Click **OK** and save the model.
7. **Click the button once.** The variables (`TwoR_armTree`, `wp1`, `t1`, ...) appear in the Workspace.
8. Open each RST block. Set **Rigid body tree** to `TwoR_armTree` and pick the end effector (`body3`). In the trajectory block, set Waypoints = `wp1`, Time points = `t1`, Velocity boundary conditions = `v1`.
9. Press **Run**.

> If clicking only selects the button and the variables do not appear in the Workspace, use Method 2 or Method 3 below. They load the same code.

### Method 2 – Model callback (runs automatically)

Use this if you don't want to click a button every time.

1. In the model, go to the **Modeling** tab → **Model Settings** drop-down → **Model Properties**.
2. Open the **Callbacks** tab.
3. Select **PreLoadFcn** (runs when the model opens) or **InitFcn** (runs every time you press Run).
4. Paste the same callback code into the box on the right, click **OK**, and save.

### Method 3 – Run the .m file first

Open the callback file (for example `exp17_pid_callback.m`) in MATLAB, press **Run**, and then run the Simulink model. The variables stay in the workspace until you clear them.

### Common errors

| Error | Fix |
|---|---|
| `Unrecognized function or variable 'TwoR_armTree'` | The callback did not run. Click the button (Method 1) or use InitFcn (Method 2). |
| `importrobot: file not found` | Change `ExpS1a_TwoR_armModel.slx` to your model name and keep it in the same folder. |
| `t1` / `vp1` undefined | Add the missing line noted at the top of that callback file. |
| `importrobot` not found | The Robotics System Toolbox and Simscape Multibody must be installed. |
