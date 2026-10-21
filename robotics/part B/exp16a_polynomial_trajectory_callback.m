%% Exp 16 (a): Trajectory generation using RST - Polynomial trajectory
% Callback code (from the lab manual).
%
% Polynomial Trajectory block settings shown in the manual:
%   Waypoint source              : Internal
%   Waypoints                    : [0 0 pi/2 pi/2; 0 0 -2*pi -2*pi]
%   Time points                  : [0 2 8 10]
%   Method                       : Cubic Polynomial
%   Velocity boundary conditions : [0 0 0 0; 0 0 0 0]
% Forward Kinematics block: Source = body3, Target = Base.

[TwoR_armTree, TwoR_armInfo] = importrobot('ExpS1a_TwoR_armModel.slx');
