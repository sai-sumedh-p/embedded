%% Exp 16 (b): Trajectory generation using RST - Trapezoidal velocity profile
% Callback code (from the lab manual, copied as printed).
%
% Block settings shown in the manual: Waypoints = wp1, Time points = t1,
% Velocity boundary conditions = v1.
% NOTE: t1 is used by the block but the manual only has it commented out
% (%t = [0 1 4 ];). If Simulink says t1 is undefined, add a line such as
% t1 = [0 1 4];

[TwoR_armTree, TwoR_armInfo] = importrobot('ExpS1a_TwoR_armModel.slx');
%t = [0 1 4 ];
Xt = [0.1 0.2 0.5];
Yt = [0.1 0.1 0.1 ];
Zt = ones(1,3)*0.275;
vp = [ 0.15 0.8 ; 0.15 0.8 ; 0.15 0.8]; %peak velocity
acct = [0.1 0.1; 0.1 0.1; 0.1 0.1]; % acceleration time
v1 = vp;
%Waypoints set 1
wp1 = [Xt;Yt;Zt];
