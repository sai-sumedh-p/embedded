%% Exp 12 (c): Inverse Kinematics of a 3R Robotic Arm - circular path
% Circle of radius 0.2 m centred at (0, 0.2). The end-effector orientation
% changes linearly from 0 to 360 deg as it goes once round the circle.
clc; clf; clear all; close all;

l1 = 0.5;
l2 = 0.3;
l3 = 0.2;
rc = 0.2;               % radius of the circle
xc = 0; yc = 0.2;       % centre of the circle
N = 37;                 % number of points on the circle
t = linspace(0, 2*pi, N);
xp = xc + rc*cos(t);    % parametric equations of the circle
yp = yc + rc*sin(t);
phi = linspace(0, 2*pi, N); % orientation goes 0 to 360 deg

figure(1)
plot(xp, yp, 'k:', 'LineWidth', 1); hold on;  % desired path
for i = 1:N
    r = [xp(i), yp(i)];
    w = r - l3*[cos(phi(i)), sin(phi(i))];   % wrist point
    c2 = (w(1)^2 + w(2)^2 - l1^2 - l2^2)/(2*l1*l2);
    % Here r = l3, so the wrist stays at (0, 0.2) with links 1 and 2 folded
    % (c2 = -1). The small tolerance stops round-off making it "unreachable".
    if abs(c2) <= 1 + 1e-9
        c2 = max(min(c2, 1), -1);
        th2 = acos(c2);
        th1 = atan2(w(2), w(1)) - atan2(l2*sin(th2), l1 + l2*cos(th2));
        th3 = phi(i) - th1 - th2;
        r1 = [l1*cos(th1), l1*sin(th1)];
        plot([0 r1(1)], [0 r1(2)], 'b', 'LineWidth', 1);
        plot([r1(1) w(1)], [r1(2) w(2)], 'r', 'LineWidth', 1);
        plot([w(1) r(1)], [w(2) r(2)], 'g', 'LineWidth', 1);
        plot(r(1), r(2), 'r.', 'MarkerSize', 14);
        axis equal
        axis([-0.8 0.8 -0.4 0.9])
        pause(0.2)
    else
        plot(r(1), r(2), 'or', 'LineWidth', 2);
        fprintf('(%.2f, %.2f) is not reachable\n', r(1), r(2));
    end
end
xlabel('X (m)'); ylabel('Y (m)');
title('IK of 3R arm on a circular path');
grid on
