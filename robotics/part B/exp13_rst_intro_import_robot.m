%% Exp 13: Introduction to the Robotics Systems Toolbox (RST) in MATLAB
% Imports the Simscape Multibody model of the 2R arm as a rigidBodyTree.
% Keep this script in the same folder as the model file.
% Our model file in this repo is ../model.slx (the manual's is ExpS1a_TwoR_armModel.slx).

[robotTree, Info] = importrobot('model.slx')

showdetails(robotTree)   % list bodies, joints and parents
show(robotTree);          % 3-D view of the robot in its home configuration
