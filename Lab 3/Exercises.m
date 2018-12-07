
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


%
%% Exercise 1
% Create functions that:
testMat = AxisAngleToRotMatrix([0 0 1],90);
%
% *  Given a rotation matrix, returns the Euler rotation angles.
[roll,pitch,yaw] = matRotToEulerAngles(testMat);
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
Cubeplot(M');
RM =  AxisAngleToRotMatrix(euler_axis,rad2deg(angle));
M = RM*M;
Cubeplot(M');

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
[ex2Test_rot_mat,ex2Test_roll,ex2Test_pitch,ex2Test_yaw,ex2Test_euler_axis,ex2Test_angle,ex2Test_quat,ex2Test_rot_vec] = exercise2(quatTest3);
