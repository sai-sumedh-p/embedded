%% Exp 12 (a): Forward Kinematics of a 3R Robotic Arm
% Ranges: 30 < th1 < 60 deg, 45 < th2 < 90 deg, 40 < th3 < 160 deg
clc; clf; clear all; close all;

l1 = 0.5;
l2 = 0.3;
l3 = 0.2;
theta1_range = 30:10:60; % degrees
theta2_range = 45:15:90;
theta3_range = 40:20:160;

figure(1)
for t1 = theta1_range
    for t2 = theta2_range
        for t3 = theta3_range
            th1 = t1*pi/180; th2 = t2*pi/180; th3 = t3*pi/180;
            x1 = l1*cos(th1);                   % joint 2
            y1 = l1*sin(th1);
            x2 = x1 + l2*cos(th1 + th2);        % joint 3
            y2 = y1 + l2*sin(th1 + th2);
            x3 = x2 + l3*cos(th1 + th2 + th3);  % end effector
            y3 = y2 + l3*sin(th1 + th2 + th3);
            plot([0,x1],[0,y1],'b',LineWidth=1);
            hold on;
            plot([x1 x2],[y1,y2],'r',LineWidth=1);
            plot([x2 x3],[y2,y3],'g',LineWidth=1);
            plot(x3, y3, 'r.', 'MarkerSize', 12); % end effector
            axis equal
            axis([-0.6 0.8 -0.2 1.1])
            xlabel('X');
            ylabel('Y');
            grid on
            title('Forward kinematics of 3R')
            pause(0.05)
        end
    end
end
