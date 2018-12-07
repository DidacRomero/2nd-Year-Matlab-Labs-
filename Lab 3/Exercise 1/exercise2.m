function [rot_mat,roll,pitch,yaw,euler_axis,angle,quaternion,rot_vec] = exercise2(varargin)
% *  Given {a rotation matrix or Euler rotation angles
%    or principal Euler axis/angle or quaternion or rotation vector},
%    returns {a rotation matrix and Euler rotation angles
%    and principal Euler axis/angle and quaternion and rotation vector}

%first default returns
rot_mat = [1 0 0; 0 1 0; 0 0 1];
roll = 0;
pitch = 0;
yaw = 0;
euler_axis = [0 0 0];
angle = 0;
quaternion = [0 0 0 0];
rot_vec = [0 0 0];
%Lets check what are we receiving in order to to the appropriate functions
if(nargin == 1)
    %We are either receiving a rotation matrix, or a quaternion or a
    %rotation vector, let's check them
    if(length(varargin{1}) == 4)
        quaternion = varargin{1};
    end
    
elseif(nargin == 2)
    %We are receiving an euler axis and an angle    

 
        
        
elseif(nargin == 3)
 %We are receiving 3 euler angles roll,pitch and yaw  

        
end

    
end