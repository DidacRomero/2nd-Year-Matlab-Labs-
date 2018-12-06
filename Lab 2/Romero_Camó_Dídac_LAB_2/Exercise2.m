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



%CASE 1
%    - The green face points in the positive z direction and the orange
%    face in the -y direction
disp('Case 1 Rotation:');
vecForTest = [1 0 0];
R1 = AxisAngleToRotMatrix([0 1 0],90);
case1Flag = ex1Tests(R1,vecForTest,[0 1 0],90);

%Check if the Rotation should be done
if (case1Flag == 0)
N = R1 * M;
% Call to Cubeplot
Cubeplot(N');
disp('Success, the cube will be plotted');
else
    disp('An error ocurred, the rotation will not be applied')
end



%CASE 2
%    - The orange face points in the -z direction and the blue face into
%    the +y direction
disp('Case 2 Rotation:');

R2 = AxisAngleToRotMatrix([1 0 0],90);
R3 = AxisAngleToRotMatrix([0 1 0],90);
R2 = R2 * R3;
case2Flag = ex1Tests(R2,vecForTest,[1 0 0],90);

%Check if the Rotation should be done
if (case1Flag == 0)
N = R2 * M;
% Call to Cubeplot
Cubeplot(N');
disp('Success, the cube will be plotted');
else
    disp('An error ocurred, the rotation will not be applied')
end





%CASE 3
%    - The red face points on the -x direction and the blue face into 
%    the -y direction.
R4 = AxisAngleToRotMatrix([1 0 0],180);
R5 = AxisAngleToRotMatrix([0 0 1],90);
R4 = R4 * R5;
case3Flag = ex1Tests(R4,vecForTest,[1 0 0],90);

%Check if the Rotation should be done
if (case3Flag == 0)
N = R4 * M;
% Call to Cubeplot
Cubeplot(N');
disp('Success, the cube will be plotted');
else
    disp('An error ocurred, the rotation will not be applied')
end