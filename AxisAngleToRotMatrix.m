function RotMatrix = AxisAngleToRotMatrix(axis_u,angle)
    %This function receives an axis and an angle provided in RADIANS and
    %returns the ROTATION MATRIX
    %   -Basically this function uses the Rodrigues Formula to return the
    %   Rotation matrix


if nargin<1
    axis_u = [1 0 0];
    angle = pi/2;
    disp('Not enough parameters passed!');
else if nargin<2
        disp('Provide an angle please');
        angle = pi/2;
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


axis_u = reshape(axis_u / norm(axis_u), [3,1]);






    
    
    
    
    
    Rotmatrix = 1;
end