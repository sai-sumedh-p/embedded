%% Exp 10: Work Envelope and Configuration of a 2R Robotic Arm
% Study 1: trace of the end effector for 30 < th1 < 75 deg, 45 < th2 < 90 deg
% Study 2: work envelope for -45 < th1 < 45 deg, -170 < th2 < 170 deg
clc; clear all; close all;

l1 = 0.5; %length of link1 in m
l2 = 0.3; %length of link2 in m

%% Study 1: trace of the end effector
th1 = 30:2.5:75; %angle in degrees
th2 = 45:2.5:90; %angle in degrees
n = length(th1);

figure(1)
for i = 1:n
    t1 = th1(i)*pi/180; %degrees to radians
    t2 = th2(i)*pi/180;
    x0 = 0; y0 = 0; %base
    x1 = l1*cos(t1); %joint 2
    y1 = l1*sin(t1);
    plot([x0 x1], [y0 y1], 'b', 'LineWidth', 1.5) %link1
    hold on
    x2 = x1 + l2*cos(t1 + t2); %end effector
    y2 = y1 + l2*sin(t1 + t2);
    plot([x1 x2], [y1 y2], 'r', 'LineWidth', 1.5) %link2
    plot(x2, y2, 'k.', 'MarkerSize', 12) %trace of end effector
    pause(0.3);
    axis equal
    axis([-0.2 0.8 -0.2 0.8])
end
xlabel('X (m)'); ylabel('Y (m)');
title('Exp 10 Study 1: Trace of the end effector of 2R arm');
grid on

%% Study 2: work envelope (all combinations of th1 and th2)
th1 = -45:15:45; %angle in degrees
th2 = -170:20:170; %angle in degrees

figure(2)
for i = 1:length(th1)
    for j = 1:length(th2)
        t1 = th1(i)*pi/180;
        t2 = th2(j)*pi/180;
        x0 = 0; y0 = 0;
        x1 = l1*cos(t1);
        y1 = l1*sin(t1);
        plot([x0 x1], [y0 y1], 'b', 'LineWidth', 1) %link1
        hold on
        x2 = x1 + l2*cos(t1 + t2);
        y2 = y1 + l2*sin(t1 + t2);
        plot([x1 x2], [y1 y2], 'r', 'LineWidth', 1) %link2
        plot(x2, y2, 'k.', 'MarkerSize', 8) %end effector
        pause(0.05);
        axis equal
        axis([-0.9 0.9 -0.9 0.9])
    end
end
xlabel('X (m)'); ylabel('Y (m)');
title('Exp 10 Study 2: Work envelope of 2R arm');
grid on
