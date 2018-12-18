%% Exercise 3
% Create a function that implements the quaternion multiplication.
% Create a function that given a vector and a quaternion, return the vector
% rotated by the attitude encoded in the quaternion using quaternion
% multiplications.
% Test it an argument/demonstrate why your function is well implemented.
M = [    -1  -1 1;   %Node 1
    -1   1 1;   %Node 2
    1   1 1;   %Node 3
    1  -1 1;   %Node 4
    -1  -1 -1;  %Node 5
    -1   1 -1;  %Node 6
    1   1 -1;  %Node 7
    1  -1 -1]'; %Node 8

quat_1 = [1 0 1 0];
vec_1 = [1 0 1];

vec_rotated = vecQuatRot(vec_1,quat_1);
vec_rotated = [0 vec_rotated];

[euler_axis_1,angle_1] = quaternionToEulerAxisAngle(vec_rotated);
Rot_Matrix_1 = AxisAngleToRotMatrix(euler_axis_1,rad2deg(angle_1));
%We plot the base cube and the rotation after that
Cubeplot(M');
N = Rot_Matrix_1 * M;
Cubeplot(N');


%The multiplication function works properly because the vector is rotated,
%as it should, this would be impossible if the quaternion multiplication function didn't work as it should.
%Also, the result of multiplying 2 quaternions is diferent for quaternion1 * quaternion2
%and quaternion2 * quaternion1 (you can check it if you want)

%The Rotation function is well implemented because if we use the vector
%returned by the vectorQuaternion multiplication as a quaternion and we
%extract the axis and the angle we can construct the rotation matrix. 
%With said matrix we can see that the cube is rotated as in the vector
%passed in the multiplication.

