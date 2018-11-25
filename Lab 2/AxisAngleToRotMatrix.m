function RotMatrix = AxisAngleToRotMatrix(axis_u,angle)
    %This function receives an axis and an angle provided in DEGREES and
    %returns the ROTATION MATRIX
    %   -Basically this function uses the Rodrigues Formula to return the
    %   Rotation matrix

angle = deg2rad(angle);

if nargin<1
    axis_u = [1 0 0];
    angle = deg2rad(90);
    disp('Not enough parameters passed! axis_u =[1 0 0] and angle 90º will be passed by default');
else if nargin<2
        disp('Provide an angle please, 90º degrees will be provided by default');
        angle = deg2rad(90);
else
    flag = 0;
    
    if(length(axis_u) ~= 3)
        disp('The axis is not valid, vector must be 3 dimension!')
        flag = 1;
    end
    
    if(angle > 2*angle)
        disp('Warning you must provide the angle in RADIANS use degtorad from Matlab if you want'); 
    end
    end

if flag == 0
    axis_u = reshape(axis_u / norm(axis_u), [3,1]);
    axis_ux = [0             -axis_u(3,1)   axis_u(2,1);
               axis_u(3,1)         0       -axis_u(1,1);
               -axis_u(2,1)   axis_u(1,1)       0;] 
     RotMatrix = eye(3)*cos(angle)+((1-cos(angle))*(axis_u * axis_u'))+ axis_ux*sin(angle);
end
end