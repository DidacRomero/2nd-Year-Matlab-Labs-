%% Exercise 1
% Create and test a function that given euler axis/angle information
% returns the rotation matrix.
% Do the next verifications:
%   - Calculate the determinant
%   - Ensure that the transpose operation is equivalent to the inverse
%   - Observe what happens to a vector parallel to the axis direction
%   - Observe what happens to a vector perpendicular to the axis direction
 %A = AxisAngleToMatrix([1 2 3], (pi / 2));
%% Exercise 2
% Use the past function and the function Cubeplot/Cubeplot2 to transform the
% orientation of the cube given by M
% Find the rotation vectors that makes:
%    - The green face points in the positive z direction and the orange
%    face in the -y direction
%    - The orange face points in the -z direction and the blue face into
%    the +y direction
%    - The red face points on the -x direction and the blue face into 
%    the -y direction.


M = [    -1  -1 1;   %Node 1
    -1   1 1;   %Node 2
    1   1 1;   %Node 3
    1  -1 1;   %Node 4
    -1  -1 -1;  %Node 5
    -1   1 -1;  %Node 6
    1   1 -1;  %Node 7
    1  -1 -1]'; %Node 8
R = AxisAngleToRotMatrix([1 0 0],90);
N = R * M;
% Call to Cubeplot
Cubeplot(N');

%% Exercise 3
% Create a function that implements the quaternion multiplication.
% Create a function that given a vector and a quaternion, return the vector
% rotated by the attitude encoded in the quaternion using quaternion
% multiplications.
% Test it an argument/demonstrate why your function is well implemented.


%% Exercise 4
% Create a large set of rotation matrices (at least 100) for which the euler axis may be 
% random (not necessarily random, but not the same) and the euler angle in
% increasing order form 0 to 6 pi. (Use a FOR LOOP)
% Make a plot of the trace of this matrices with the value of the angle in
% the x axis i.e. Trace(R(phi,e)) vs. \phi . Explain what you observe.

%% Exercise 5
% Create a function that given a set of euler angles, return its respective
% rotation matrix.
% Create also a function that given a rotation matrix return the
% respective rotation angles.
% 	-Ensure that the case for which theta = pi/2 + k*pi with k=1,2,.. is
% 	   well implemented

