%% Exercise 4
clear all; clc;
%The columns of the next matrix, represents the coordinates od 4 points
%defined in a world frame.

A = load('AEx4.mat');
A = A.A;

%From this 4 points, two segments are defined. The segment one, goes from
% the point defined by the first column to the point defined by the second
% column. The second segment is defined by the other two points.

% A camera frame is seeing the scene. The origin of the world frame seen
% from the camera frame is given by the vector

wc = [4.665;3.735;-0.5395];


%And the orientation of the camera frame is obtained after rotating the
%world frame -170 degs about the direction
u = [0.01;-.2;1];

%Rotation matrix from world to camera and viceversa
ex4_RotMat_WC = AxisAngleToRotMatrix(u,-170);
ex4_RotMat_CW = ex4_RotMat_WC';

A_inCamera = ex4_RotMat_WC * A +wc;

%Translation from World to Camera and viceversa xorld position in its frames is [0 0 0]
oW= [0 0 0]';
t_WC = -(ex4_RotMat_WC * oW) - wc; %%%%%RECHECK THIS


% With the data provided determine:
%

%Vector 1 POINTS in world reference, so we don't change them
p1_w = [A(1,1) A(2,1) A(3,1)]';
p2_w = [A(1,2) A(2,2) A(3,2)]';

p3_w = [A(1,3) A(2,3) A(3,3)]';
p4_w = [A(1,4) A(2,4) A(3,4)]';

vec1_w = p2_w - p1_w;

vec2_w = p4_w - p3_w;


% 4.1 The minimum angle that both segments forms (hint, they intersect)
%

angle = acos( dot(vec1_w,vec2_w) / (norm(vec1_w) * norm(vec2_w)) );

disp('Angle: ');
disp(rad2deg(angle));

% 4.2 The angle that both segments forms in the image plane
%
%%%%%%%%WE WILL USE THE FOCAL DISTANCE OF THE PREVIOUS EXERCISE Ex3
%If the camera has a focal length of 1/34 m:
f = 1/34;

toPlot_3 = cameraproj(1,f,vec1_w);
toPlot_4 = cameraproj(1,f,vec2_w);

angle = acos( dot(toPlot_3,toPlot_4) / (norm(toPlot_3) * norm(toPlot_4)) );

disp('Projected into camera Angle:');
disp(rad2deg(angle));

% 4.3 Deliver a 3D representation of the scene with all the coordinates
% refered to the world frame
%

figure;
plot3([A(1,1) A(1,2)],[A(2,1) A(2,2)],[A(3,1) A(3,2)],'r');
hold on;
plot3([A(1,3) A(1,4)],[A(2,3) A(2,4)],[A(3,3) A(3,4)],'g');
title('Exercise 4.3 3D Plot');


% 4.4 Deliver the 3D scene representations but with all the coordinates
% refered to the camera frame
figure;
plot3([A_inCamera(1,1) A_inCamera(1,2)],[A_inCamera(2,1) A_inCamera(2,2)],[A_inCamera(3,1) A_inCamera(3,2)],'r');
hold on;
plot3([A_inCamera(1,3) A_inCamera(1,4)],[A_inCamera(2,3) A_inCamera(2,4)],[A_inCamera(3,3) A_inCamera(3,4)],'g');
title('Exercise 4.4 3D Plot');
