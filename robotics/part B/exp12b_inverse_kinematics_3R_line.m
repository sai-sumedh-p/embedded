%% Exp 12 (b): Inverse Kinematics of a 3R Robotic Arm - straight line
% End effector keeps orientation phi = 60 deg and travels on a straight line
% from (0.8, 0.1) to (0.8, 0.7).
clc; clf; clear all; close all;

l1 = 0.5;
l2 = 0.3;
l3 = 0.2;
x = 0.8;
y = (0.1:0.05:0.7);
theta3 = 60;            % end-effector orientation phi in degrees
phi = theta3*pi/180;

figure(1)
for i = 1:length(y)
    r = [x, y(i)];                          % end effector target
    w = r - l3*[cos(phi), sin(phi)];        % wrist point (joint 3)
    c2 = (w(1)^2 + w(2)^2 - l1^2 - l2^2)/(2*l1*l2);
    if abs(c2) <= 1
        th2 = acos(c2);
        th1 = atan2(w(2), w(1)) - atan2(l2*sin(th2), l1 + l2*cos(th2));
        th3 = phi - th1 - th2;              % third joint keeps the orientation
        r1 = [l1*cos(th1), l1*sin(th1)];    % joint 2
        l1x = [0, r1(1), w(1), r(1)];
        l1y = [0, r1(2), w(2), r(2)];
        axis equal
        axis([-0.2 1.0 -0.4 0.9])
        plot(l1x, l1y, '--g', 'LineWidth', 1)
        hold on;
        plot(r(1), r(2), 'r.', 'MarkerSize', 14)
        pause(0.3)
        fprintf('(%.2f, %.2f): th1 = %.1f, th2 = %.1f, th3 = %.1f deg\n', ...
            r(1), r(2), th1*180/pi, th2*180/pi, th3*180/pi);
    else
        plot(r(1), r(2), 'or', 'LineWidth', 2); % only the point
        hold on;
        fprintf('(%.2f, %.2f) is not reachable\n', r(1), r(2));
    end
end
xlabel('X (m)'); ylabel('Y (m)');
title('IK of 3R arm on a straight line, \phi = 60^o');
grid on
