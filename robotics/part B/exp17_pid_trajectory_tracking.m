%% Exp 17: PID based Trajectory Tracking Control of a 2R Robotic Arm (m-script)
% Inverse kinematics -> PID controller -> simplified robot dynamics -> forward
% kinematics, using the equations given in the lab manual.
% The manual leaves the numbers blank, so the values below are our choice:
% link lengths, masses, inertias, path and gains can be changed freely.
clc; clear all; close all;

%% Parameters
l1 = 1; l2 = 1;         % link lengths (m)
m1 = 1; m2 = 1;         % link masses (kg)
I1 = 0.1; I2 = 0.1;     % link inertias (kg m^2)
Ts = 0.001;             % sample time (s)
T  = 6;                 % time for one lap of the path (s)
Kp = 200; Ki = 20; Kd = 30; % PID gains (same for both joints)

t = 0:Ts:T;
N = length(t);

%% Desired trajectory of the end effector (circle)
xd = 0.85 + 0.25*cos(2*pi*t/T);
yd = 0.25*sin(2*pi*t/T);

%% a. Inverse kinematics: desired joint angles
th2d = acos((xd.^2 + yd.^2 - l1^2 - l2^2)/(2*l1*l2));
th1d = atan2(yd, xd) - atan2(l2*sin(th2d), l1 + l2*cos(th2d));

%% Simulation
th1 = zeros(1,N); th2 = zeros(1,N);   % actual joint angles
w1 = zeros(1,N);  w2 = zeros(1,N);    % joint velocities
tau1 = zeros(1,N); tau2 = zeros(1,N); % joint torques
th1(1) = th1d(1); th2(1) = th2d(1);   % start on the path
ie1 = 0; ie2 = 0;                     % integral of error
e1_old = 0; e2_old = 0;

for k = 2:N
    % b. PID controller
    e1 = th1d(k) - th1(k-1);
    e2 = th2d(k) - th2(k-1);
    ie1 = ie1 + e1*Ts;
    ie2 = ie2 + e2*Ts;
    if k == 2
        de1 = 0; de2 = 0;
    else
        de1 = (e1 - e1_old)/Ts;
        de2 = (e2 - e2_old)/Ts;
    end
    e1_old = e1; e2_old = e2;
    tau1(k) = Kp*e1 + Ki*ie1 + Kd*de1;
    tau2(k) = Kp*e2 + Ki*ie2 + Kd*de2;

    % c. Simplified robot dynamics
    a1 = (tau1(k) - m2*l1*l2*sin(th2(k-1))*w2(k-1)^2 ...
                  - m1*l1^2*sin(th1(k-1))*w1(k-1)^2) / (I1 + m2*l1^2 + m1*l1^2);
    a2 = (tau2(k) - m2*l1*l2*sin(th2(k-1))*w1(k-1)^2) / (I2 + m2*l1^2);
    w1(k) = w1(k-1) + Ts*a1;
    w2(k) = w2(k-1) + Ts*a2;
    th1(k) = th1(k-1) + Ts*w1(k-1);
    th2(k) = th2(k-1) + Ts*w2(k-1);
end

%% d. Forward kinematics: actual end-effector path
x = l1*cos(th1) + l2*cos(th1 + th2);
y = l1*sin(th1) + l2*sin(th1 + th2);
fprintf('Maximum path error = %.4f m\n', max(hypot(x - xd, y - yd)));

%% Plots
figure(1)
subplot(2,2,1)
plot(t, th1d, 'r', t, th1, 'b'); grid on
xlabel('Time(s)'); ylabel('Joint Angle (rad)'); title('Joint Angles Over Time');
legend('Theta1 Desired', 'Theta1');
subplot(2,2,3)
plot(t, th2d, 'r', t, th2, 'b'); grid on
xlabel('Time(s)'); ylabel('Joint Angle (rad)'); title('Joint Angles Over Time');
legend('Theta2 Desired', 'Theta2');
subplot(2,2,[2 4])
plot(xd, yd, 'k--', x, y, 'b'); grid on; axis equal
xlabel('x(m)'); ylabel('y(m)'); title('End-Effector Trajectory');
legend('Desired Path', 'Robot Arm Path');

figure(2)
plot(t, tau1, t, tau2); grid on
xlabel('Time(s)'); ylabel('Torque (Nm)'); title('Control torques');
legend('\tau_1', '\tau_2');
