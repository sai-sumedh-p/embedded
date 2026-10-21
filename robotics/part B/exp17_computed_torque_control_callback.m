%% Exp 17: Computed Torque Control (CTC) - callback code
% (from the lab manual, copied as printed)
% NOTE: the manual's CTC callback has no t1 / vp1 lines. If the trajectory
% block uses them, copy these two lines from exp17_pid_callback.m:
%   t1 = [0 1 2 8 10];
%   vp1 = [ 0.1 0.1 22.5 0.1; 0.1 0.1 90 0.1]*pi/180;

[TwoR_armTree, TwoR_armInfo] = importrobot('ExpS1a_TwoR_armModel.slx');
%t = [0 1 4 ];
q1 = [0 0 0 90 90]*pi/180;
q2 = [0 0 0 -360 -360]*pi/180;%[360 360 360 0 0]*pi/180;
v1 = [ 0 15 15 0; 0 60 60 0]; %
%Waypoints set 1
wp1 = [q1;q2];
