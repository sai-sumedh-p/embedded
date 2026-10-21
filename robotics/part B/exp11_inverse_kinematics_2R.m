%% Exp 11: Inverse Kinematics of a 2R Robotic Arm
% Study 1: end effector travels on a straight line from (0.1, 0.1) to (0.6, 0.6)
% Study 2: end effector travels on a horizontal line from (0.6, 0.6) to (-0.6, 0.6)
% Both IK solutions are plotted: solution 1 in solid blue, solution 2 in dashed green.
% Unreachable points are plotted as isolated red dots.
clf; clc; clear all; close all;

l1 = 0.5; % length of link 1
l2 = 0.3; % length of link 2

%% Study 1: straight line from (0.1, 0.1) to (0.6, 0.6)
x = 0.1:0.05:0.6;
y = 0.1:0.05:0.6;
figure(1)
ik_2R_path(x, y, l1, l2);
title('Exp 11 Study 1: IK of 2R arm on a straight line');

%% Study 2: horizontal line from (0.6, 0.6) to (-0.6, 0.6)
x = 0.6:-0.1:-0.6;
y = 0.6*ones(size(x));
figure(2)
ik_2R_path(x, y, l1, l2);
title('Exp 11 Study 2: IK of 2R arm on a horizontal line');

%% Local function
function ik_2R_path(x, y, l1, l2)
for i = 1:length(x)
    r = [x(i), y(i)]; % target point
    c2 = (x(i)^2 + y(i)^2 - l1^2 - l2^2)/(2*l1*l2); % cosine rule
    if (abs(c2) <= 1)
        % Solution 1 (elbow down)
        th2 = acos(c2);
        th1 = atan2(y(i), x(i)) - atan2(l2*sin(th2), l1 + l2*cos(th2));
        r1 = [l1*cos(th1), l1*sin(th1)]; % joint 2 position
        l1x = [0, r1(1), r(1)];
        l1y = [0, r1(2), r(2)];
        plot(r(1), r(2), 'or', 'LineWidth', 2)
        hold on
        axis equal
        axis([-0.9 0.9 -0.9 0.9])
        plot(l1x, l1y, '-b', 'LineWidth', 1)
        hold on;
        % Solution 2 (elbow up)
        th2 = -acos(c2);
        th1 = atan2(y(i), x(i)) - atan2(l2*sin(th2), l1 + l2*cos(th2));
        r1 = [l1*cos(th1), l1*sin(th1)];
        l1x = [0, r1(1), r(1)];
        l1y = [0, r1(2), r(2)];
        plot(r(1), r(2), 'or', 'LineWidth', 1)
        hold on
        axis equal
        axis([-0.9 0.9 -0.9 0.9])
        plot(l1x, l1y, '--g', 'LineWidth', 1)
        pause(0.3)
        fprintf('(%.2f, %.2f): th1 = %.1f deg, th2 = %.1f deg (and the mirror solution)\n', ...
            x(i), y(i), th1*180/pi, th2*180/pi);
    else
        plot(x(i), y(i), 'or', 'LineWidth', 2); % unreachable point
        hold on
        fprintf('(%.2f, %.2f) is not reachable\n', x(i), y(i));
    end
end
xlabel('X (m)'); ylabel('Y (m)');
grid on
end
