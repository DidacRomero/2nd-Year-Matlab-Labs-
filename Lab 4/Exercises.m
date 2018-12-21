clear all;
clc;
%% Exercise 1
% The point p has coordinates
p_A = [3, 4]';
% on a frame A and coordinates
p_B = [-2.5, 0.5]';
% on a frame B

disp('Exercise 1:');
%WE ASSUME
ex1_o_A = [0 0]';

%It is known that the angle between x axis of frame {A} and the y axes from
%Frame{B} is 30 deg counterclockwise.
ex1_rotMat_A_to_B = angleTo2dRotMat(300);
ex1_rotMat_B_to_A = ex1_rotMat_A_to_B';

%We isolate the translation
ex_1_t_B_to_A = p_A - ex1_rotMat_B_to_A * p_B;
ex_1_t_A_to_B = p_B - ex1_rotMat_A_to_B * p_A;

% 1.1 Which are the coordinates of the origin of A seen from B?
ex1_oBA = ex1_rotMat_A_to_B * ex1_o_A + ex_1_t_A_to_B;

% 1.2 Which are the coordinates of the origin of B seen from A? 
%ASSUMINg the result above is ok
ex1_oAB = ex1_rotMat_B_to_A * ex1_o_A + ex_1_t_B_to_A;

% 1.3 Which are the coordinates of a point q expressed in A if
q_B = [3,1]'; %?
ex_1_q_A = ex1_rotMat_B_to_A * q_B + ex_1_t_B_to_A;

disp('Coordinates of A origin seen from B');
disp(ex1_oBA);
disp('Coordinates of B origin seen from A');
disp(ex1_oAB);
disp('Coordinates of q in A');
disp(ex_1_q_A);


%% Exercise 2

% Let {A}, {B} and {C}, be 3 different reference frames. From them we know
% that:
%      - The origin of B with respect A is
oAB = [3,1,-2]';
%      - The origin of C with respect B is
oBC = [-3, 1,-2]';

% The three frames has different orientations in space.
% In fact:
%       -The set of Euler angles stored in eta as eta = (psi,theta,phi)
eta = [25;145;30]; % Expressed in degrees
%            represents 3 consecutive rotations about z, y, and x
%            respectively that allows to transform from {A} to {B}
%
%       - The quaternion
q = 1/7*[-sqrt(3)*3.5;3;-1;-1.5];
%         will allows to express in {B} a vector defined in {C}, if {C} and {B}
%         had the same origin

%   -Let in addition v1 and v2 to be points which coordinates are known in
%   {C}.
v1_C = [0;2;0];
v2_C = [0;2;5];

% With the information provided above determine:
%
%   2.1- The affine expression (no matrix here!) that allows to relate a vector originally given
%       in {C} to {B}.
%
%   2.2 The affine matrix that allows to express a vector originally given
%       in {C} to {A}.
%
%   2.3 The vectors v1_C and v2_C forms a segment. Make a 3d plot (plot3() in
%   matlab), representing how the segment is seen on {A} in red, on {B} in
%   blue and on {C} in green.

% Make use of the provided function quatmult to multiply quaternions.


%% Exercise 3.

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

rotMat_WC = auxRotMat_1 * auxRotMat_2;
%rotMat_CW = rotMat_WC';
t_WC = cc;

%If the camera has a focal length of 1/34 m:
f = 1/34;
% 3.1 Make a plot with the view of the points of the circle projected into the camera plane.

%Pass the points from world to camera
points = rotMat_WC * A + t_WC;

% 3.2 Make also a 3D plot where all the scene is drawn in the world
% coordinates. The scene must contain the 2 reference frames (2 orthogonal sets of vectors)
% and the circle points. You can use the provided function cameraproj.
toPlot = cameraproj(1,f,A);
toPlot_C = cameraproj(1,f,points);

plot(toPlot(1,:),toPlot(2,:));
hold on;
plot(toPlot_C(1,:),toPlot_C(2,:));



%% Exercise 4

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

%Translation from World to Camera and viceversa xorld position in its frames is [0 0 0]
oW= [0 0 0]';
t_WC = -(ex4_RotMat_WC * oW) - wc; %%%%%RECHECK THIS


% With the data provided determine:
%

%Vector 1 POINTS in world reference, so we don't change them
p1_w = [A(1,1) A(2,1) A(3,1)];
p2_w = [A(1,2) A(2,2) A(3,2)];

p3_w = [A(1,3) A(2,3) A(3,3)];
p4_w = [A(1,4) A(2,4) A(3,4)];

vec1_w = p2_w - p1_w;

vec2_w = p4_w - p3_w;


% 4.1 The minimum angle that both segments forms (hint, they intersect)
%

vecMult = vec1_w.* vec2_w;

angle = acos( sum(vecMult) / sqrt(sum(vec1_w.^2)) * sqrt(sum(vec2_w.^2)) );

disp('Angle: ');
disp(rad2deg(angle));
% 4.2 The angle that both segments forms in the image plane
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%MUST FINISH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%THIS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

angle = acos( sum(vecMult_2) / sqrt(sum(vec1_w.^2)) * sqrt(sum(vec2_w.^2)) );


% 4.3 Deliver a 3D representation of the scene with all the coordinates
% refered to the world frame
%
toPlot_3 = cameraproj(1,f,vec1_w');
toPlot_4 = cameraproj(1,f,vec2_w');
plot(toPlot_3);
hold on;
plot(toPlot_4);

% 4.4 Deliver the 3D scene representations but with all the coordinates
% refered to the camera frame

p1_c = ex4_RotMat_WC * p1_w + t_WC;
p2_c = ex4_RotMat_WC * p2_w + t_WC;
p3_c = ex4_RotMat_WC * p3_w + t_WC;
p4_c = ex4_RotMat_WC * p4_w + t_WC;

vec1_c = p2_c - p1_c;

vec2_c = p4_c - p3_c;
