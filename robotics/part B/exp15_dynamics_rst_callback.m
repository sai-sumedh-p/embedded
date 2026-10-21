%% Exp 15: Forward and Inverse Dynamics of robotic arm using RST
% Callback code. The manual does not print a separate callback for Exp 15,
% but the Inverse Dynamics and Forward Dynamics blocks need the same
% rigid body tree, so it is the same import as Exp 14.
% Select TwoR_armTree in BOTH the Inverse Dynamics and Forward Dynamics blocks.

[TwoR_armTree, TwoR_armInfo] = importrobot('ExpS1a_TwoR_armModel.slx');
