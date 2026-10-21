%% Exp 17: Open loop system - callback code
% (from the lab manual, copied as printed)
% Model: Trapezoidal Velocity Profile Trajectory -> D2R -> Inverse Dynamics
%        -> Robot model + Forward Dynamics (see ../Open_loop.slx)

[TwoR_armTree, TwoR_armInfo] = importrobot('ExpS1a_TwoR_armModel.slx');
%t = [0 1 4 ];
q1 = [0 0 0 90 90];
q2 = [0 0 0 -360 -360];%[360 360 360 0 0];
t1 = [0 1 2 8 10];
vp = [ 0.1 0.1 22.5 0.1; 0.1 0.1 90 0.1]; %peak velocity
acct = [0.1 0.1; 0.1 0.1; 0.1 0.1]; % acceleration time
acc = [0.1 9; 0.1 9; 0.1 9];
%[ 0.2 1 1 1 1;0.2 1 1 1 1; 0.2 1 1 1 1]; %peak velocity
%t1 = t;
v1 = [ 0 15 15 0; 0 60 60 0]; %
%Waypoints set 1
wp1 = [q1;q2];
