%% Exercise 3.
clear all; clc;
% The points described by the columns of the matrix A
 
A = load('AEx3.mat');
A = A.A;

% are points contained into a circle, and they are defined in a world frame W.

% A camera is situated at point

cc = [1; 6; 1];

% defined in the world frame. Moreover the orientation of this camera frame
% is achieved by rotating the world frame -90 degs about its y axis followed by -20
% degrees about the resulting z axis.
auxRotMat_1 = AxisAngleToRotMatrix([0 1 0],-90);
auxRotMat_2 = AxisAngleToRotMatrix([0 0 1],-20);

resultant_Rotation_1 = auxRotMat_1 * A;
resultant_A = auxRotMat_2 * resultant_Rotation_1;
%rotMat_CW = rotMat_WC';
t_WC = cc;

%If the camera has a focal length of 1/34 m:
f = 1/34;
% 3.1 Make a plot with the view of the points of the circle projected into the camera plane.

%Pass the points from world to camera
points = resultant_A + t_WC;

figure;
toPlot_C = cameraproj(1,f,points);
plot(toPlot_C(1,:),toPlot_C(2,:));
title('Exercise 3.1 A projected into camera plane');
legend('A');

% 3.2 Make also a 3D plot where all the scene is drawn in the world
% coordinates. The scene must contain the 2 reference frames (2 orthogonal sets of vectors)
% and the circle points. You can use the provided function cameraproj.


figure;
plot3(A(1,:),A(2,:),A(3,:));
hold on;
plot3(points(1,:),points(2,:),points(3,:));
title('Exercise 3.2 3D Plot of Circle Points in both references');
legend('A in 1st Frame ','A in 2nd Frame');



