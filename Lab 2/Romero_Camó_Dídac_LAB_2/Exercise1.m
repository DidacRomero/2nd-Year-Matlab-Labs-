%Exercise 1
% Create and test a function that given euler axis/angle information
% returns the rotation matrix.
% Do the next verifications:
%   - Calculate the determinant
%   - Ensure that the transpose operation is equivalent to the inverse
%   - Observe what happens to a vector parallel to the axis direction
%   - Observe what happens to a vector perpendicular to the axis direction

%Calculate the rotation using Rodrigues
R = AxisAngleToRotMatrix([1 0 0],90);
%Make the necessary tests
vecForTest = [1 0 0];
testFlag = ex1Tests(R,vecForTest,[1 0 0],90);
