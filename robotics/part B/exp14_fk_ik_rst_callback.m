%% Exp 14: Forward and Inverse Kinematics of robotic arm using RST
% Callback code (from the lab manual). Put this in the model's callback
% (see README.md) so TwoR_armTree is in the workspace before the
% Forward Kinematics (Get Transform) and Inverse Kinematics blocks run.
%
% Block settings from the manual:
%   Forward Kinematics block: Rigid body tree = TwoR_armTree, Source = body3, Target = Base
%   Gain before the robot model: pi/180 (FK study), 1 (IK study)
%   Inverse Kinematics block: Rigid body tree = TwoR_armTree, End effector = body3
%   IK Signal Builder (time, X, Y, Z):
%     0 0.1 0.1 0.275 | 1 0.2 0.1 | 2 0.8 0.1 | 3 0.8 0.7 | 4 0.2 0.7 | 5 0.2 0.1 | 10 0.2 0.1 0.275
%     (Z must match the end-effector height of your model)

[TwoR_armTree, TwoR_armInfo] = importrobot('ExpS1a_TwoR_armModel.slx');
