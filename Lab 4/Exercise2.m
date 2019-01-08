%% Exercise 2
clear all; clc;
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


%We get the rotation matrix A TO B
rot_matAB = eulerAnglesToRotMat(deg2rad(eta(2)),deg2rad(eta(3)),deg2rad(eta(1)));
rot_matBA = rot_matAB';


trans_BA = -rot_matBA * oAB;

%Assumptions
%We will assume axis A is
A_axis = [1 0 0; 0 1 0; 0 0 1];

oB = [0 0 0]';
oC = [0 0 0]';



%       - The quaternion
q = 1/7*[-sqrt(3)*3.5;3;-1;-1.5];
%         will allows to express in {B} a vector defined in {C}, if {C} and {B}
%         had the same origin

%   -Let in addition v1 and v2 to be points which coordinates are known in
%   {C}.
v1_C = [0;2;0];
v2_C = [0;2;5];

[q_axis,q_angle] = quaternionToEulerAxisAngle(q');

%We obtain the Rotation Matrix and translation from C To B
rot_matCB = AxisAngleToRotMatrix(q_axis,rad2deg(q_angle));

transCB = -rot_matCB * oBC;

%We also obtain the points in all references in order to be used afterwards
%So that the exercises are as clean as possible
v1_B=  rot_matCB * v1_C + transCB;
v2_B= rot_matCB * v2_C + transCB;

v1_A =  rot_matBA * v1_B + trans_BA;
v2_A =  rot_matBA * v2_B + trans_BA;

% With the information provided above determine:
%
%   2.1- The affine expression (no matrix here!) that allows to relate a vector originally given
%       in {C} to {B}.
disp('Exercise 2.1:');
disp('Affine expression:');

disp('vec_b'' = A* vec_b');
disp(' ');
disp('Which develops into:');
disp (' vector_b ,1 = [Rotation Matrix, translation; 0 1] * vector_b');
disp('This way we would obtain the Affine Transformation matrix ([Rotation Matrix, translation; 0 1]):');

disp(' C to B Rotation Matrix:');
disp(rot_matCB);
disp(' C to B Translation:');
disp(transCB);

disp('And although not required, the Affine transformation C to B matrix would be this:')
affine_example = [rot_matCB transCB; 0 0 0 1];
disp(affine_example);



%   2.2 The affine matrix that allows to express a vector originally given
%       in {C} to {A}.
%
disp('Exercise 2.2:');
%Extract rot_matCA & transCA (C to A)
rot_matCA = rot_matBA * rot_matCB;

transAC = v1_C- rot_matCA' * v1_A;

transCA = -rot_matCA * transAC;

%Calculate the affine matrix

AffineCA = [rot_matCA  transCA; 0 0 0 1];

disp('Affine Matrix from C to A:');
disp(AffineCA);

%   2.3 The vectors v1_C and v2_C forms a segment. Make a 3d plot (plot3() in
%   matlab), representing how the segment is seen on {A} in red, on {B} in
%   blue and on {C} in green.

%we will need the vector in augmented form to perform the multiplication
%eith the matrix of size 4x4
augmentedv1_c= [v1_C; 1];
augmentedv2_c= [v2_C; 1];

v1_A = AffineCA * [v1_C; 1];
v2_A = AffineCA * [v2_C; 1];


figure;

plot3([v1_A(1,1) v2_A(1,1)],[v1_A(2,1) v2_A(2,1)],[v1_A(3,1) v2_A(3,1)],'r');
hold on;
plot3([v1_B(1,1) v2_B(1,1)],[v1_B(2,1) v2_B(2,1)],[v1_B(3,1) v2_B(3,1)],'b');
plot3([v1_C(1,1) v2_C(1,1)],[v1_C(2,1) v2_C(2,1)],[v1_C(3,1) v2_C(3,1)],'g');

title('Exercise 2.3 ');
legend('v1_A','v1_B','v1_C');

% Make use of the provided function quatmult to multiply quaternions.

