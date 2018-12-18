%% Exercise 5
% Create a function that given a set of euler angles, return its respective
% rotation matrix.
% Create also a function that given a rotation matrix return the
% respective rotation angles.
% 	-Ensure that the case for which theta = pi/2 + k*pi with k=1,2,.. is
% 	   well implemented
clear all;
clc;
%Create a rotation matrix
RotMat = AxisAngleToRotMatrix([1 0 0], 90);
[matTest_pitch,matTest_roll,matTest_yaw] = matRotToEulerAngles(RotMat);

disp('Exercise 5 Rotation matrix to euler angles:')
disp('The matrix RotMat:');
disp(RotMat);
disp('Returned (radians):');
disp('pitch:');
disp(matTest_pitch);
disp('roll:');
disp(matTest_roll);
disp('yaw:');
disp(matTest_yaw);
disp('----------------------');

%Case for euler angles to Rotation matrix
pitch = 0;
roll = deg2rad(90);
yaw = 0;

test_rotMat = eulerAnglesToRotMat(pitch,roll,yaw);

disp('Exercise 5 euler angles to Rotation Matrix:')
disp('The Angles (radians):');
disp('pitch:');
disp(pitch);
disp('roll:');
disp(roll);
disp('yaw:');
disp(yaw);

disp('The Rotation Matrix:');
disp(test_rotMat);
disp('----------------------');


