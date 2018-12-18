
% From Lab 2 we have two functions:
%
% *  Given principal Euler axis/angle, returns the rotation matrix.
% *  Given a set of Euler angles, returns the rotation matrix.
%
% We used the past functions and the function Cubeplot/Cubeplot2 to transform the
% orientation of the cube given by M
%

M = [    -1  -1 1;   %Node 1
    -1   1 1;   %Node 2
    1   1 1;   %Node 3
    1  -1 1;   %Node 4
    -1  -1 -1;  %Node 5
    -1   1 -1;  %Node 6
    1   1 -1;  %Node 7
    1  -1 -1]'; %Node 8

%
% Now it is time to complete all the transformations, 
% adding also the quaternions representation
%
% If not completed in Lab 2:
%
%% Exercise 0
% Create a function that implements the quaternion multiplication.
% Create a function that given a vector and a quaternion, returns the vector
% rotated by the attitude encoded in the quaternion using quaternion
% multiplications.
% Test it an argument/demonstrate why your function is well implemented.
disp('Exercise 0:')
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
disp('Plotted Exercise 0 demonstration cubes.')


%The multiplication function works properly because the vector is rotated,
%as it should, this would be impossible if the quaternion multiplication function didn't work as it should.
%Also, the result of multiplying 2 quaternions is diferent for quaternion1 * quaternion2
%and quaternion2 * quaternion1 (you can check it if you want)

%The Rotation function is well implemented because if we use the vector
%returned by the vectorQuaternion multiplication as a quaternion and we
%extract the axis and the angle we can construct the rotation matrix. 
%With said matrix we can see that the cube is rotated as in the vector
%passed in the multiplication.


%
%% Exercise 1
disp('Exercise 1');
% Create functions that:
testMat = AxisAngleToRotMatrix([0 0 1],90);
%
% *  Given a rotation matrix, returns the Euler rotation angles.
[pitch,roll,yaw] = matRotToEulerAngles(testMat);
% *  Given a rotation matrix, returns the principal Euler axis/angle.
[euler_axis,angle] = rotMatToEulerAxisAngle(testMat);
% *  Given principal Euler axis/angle, returns the quaternion.
quatTest3 = eulerAxisAngleToQuaternion(euler_axis,angle);
% *  Given a quaternion, returns the principal Euler axis/angle.
[test_euler_axis,test_angle] = quaternionToEulerAxisAngle(quatTest3);
% *  Given principal Euler axis/angle, returns the rotation vector.
rotationVector = eulerAxisAngleToRotationVector(euler_axis,angle);
% *  Given the rotation vector, returns principal Euler axis/angle.
[lastTestAxis,lastTestAngle] = rotationVectorToEulerAxisAngle(rotationVector);

% Check the past functions and the function Cubeplot/Cubeplot2 to transform the
% orientation of the cube given by M
% Cubeplot(M');
% RM =  AxisAngleToRotMatrix(euler_axis,rad2deg(angle));
% M = RM*M;
% Cubeplot(M');

%
%% Exercise 2
% Create a function that:
%
% *  Given {a rotation matrix or Euler rotation angles
%    or principal Euler axis/angle or quaternion or rotation vector},
%    returns {a rotation matrix and Euler rotation angles
%    and principal Euler axis/angle and quaternion and rotation vector}
%
% Hint: use a letter 'r,e,p,q,v' to inform the function which are the
%       input arguments. 
%


disp('Exercise 2:');
disp('---------------------');
disp('---------------------');

%We use some previous data to run the tests for the functions.

%You can read the help of the function to use it for different tests. A
%basic test is provided and the others are commented, uncomment just 1 case
%to see it, if more than 1 case is uncommented you will only see the
%displays for the last uncommented test

%Rotation Matrix
[rot_mat,ex2_pitch,ex2_roll,ex2_yaw,euler_axis,angle,quaternion,rot_vec] = exercise2(testMat);
%Quaternion
%[rot_mat,ex2_pitch,ex2_roll,ex2_yaw,euler_axis,angle,quaternion,rot_vec] = exercise2(quatTest3);
%Rotation vecttor
%[rot_mat,ex2_pitch,ex2_roll,ex2_yaw,euler_axis,angle,quaternion,rot_vec] = exercise2(rotationVector);
%EulerAxis/Angle
%[rot_mat,ex2_pitch,ex2_roll,ex2_yaw,euler_axis,angle,quaternion,rot_vec] = exercise2(test_euler_axis,test_angle);
%Euler Angles pitch roll yaw
%[rot_mat,ex2_pitch,ex2_roll,ex2_yaw,euler_axis,angle,quaternion,rot_vec] = exercise2(pitch,roll,yaw);


disp('Exercise 2 function returned:');
disp('Rotation Matrix (rot_mat):');
disp(rot_mat);
disp('---------------------');

disp('Euler Axis (euler_axis):');
disp(euler_axis);
disp('Angle (angle):');
disp(angle);
disp('---------------------');

disp('Pitch (ex2_pitch):');
disp(ex2_pitch);
disp('Roll (ex2_roll):');
disp(ex2_roll);
disp('Yaw (ex_2yaw):');
disp(ex2_yaw);
disp('---------------------');

disp('Quaternion (quaternion):');
disp(quaternion);
disp('---------------------');

disp('Rotation vector (rot_vec):');
disp(rot_vec);
disp('---------------------');


