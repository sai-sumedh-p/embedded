%% Exp 17: PID control - callback code
% (from the lab manual, copied as printed; angles here are in radians)

[TwoR_armTree, TwoR_armInfo] = importrobot('ExpS1a_TwoR_armModel.slx');
%t = [0 1 4 ];
q1 = [0 0 0 90 90]*pi/180;
q2 = [0 0 0 -360 -360]*pi/180;;%[360 360 360 0 0]*pi/180;
t1 = [0 1 2 8 10];
vp1 = [ 0.1 0.1 22.5 0.1; 0.1 0.1 90 0.1]*pi/180; %peak velocity
acct = [0.1 0.1; 0.1 0.1; 0.1 0.1]; % acceleration time
acc = [0.1 9; 0.1 9; 0.1 9];
%[ 0.2 1 1 1 1;0.2 1 1 1 1; 0.2 1 1 1 1]; %peak velocity
%t1 = t;
v1 = [ 0 15 15 0; 0 60 60 0]; %
%Waypoints set 1
wp1 = [q1;q2];
