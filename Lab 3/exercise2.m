function [rot_mat,pitch,roll,yaw,euler_axis,angle,quaternion,rot_vec] = exercise2(varargin)
% *  Given {a rotation matrix or Euler rotation angles
%    or principal Euler axis/angle or quaternion or rotation vector},
%    returns {a rotation matrix and Euler rotation angles
%    and principal Euler axis/angle and quaternion and rotation vector}
%---------INSTRUCTIONS OF USE-------------
%When passing more than one argument
%If you're passing a Rotation Matrix [3x3], a Quaternion[1x4] or a Rotation Vector[1x3] by
%passing just that argument the function will work.
%If passing the euler axis [1x3] and angle pass them in this
%order exercise2(axis,angle).
%If you want to pass the 3 euler angles pass them in the following order exercise2(pitch,roll,yaw)
%It is critically important to pass the parameters as described before, or
%you'll affect the function functionality.

%default assignation for comparison
rot_mat = [0 0 0; 0 0 0; 0 0 0];
pitch = 0;
roll = 0;
yaw = 0;
euler_axis = [0 0 0];
angle = 0;
quaternion = [0 0 0 0];
rot_vec = [0 0 0];


error = 0;
if (nargin < 1 | nargin > 4)
    error = 1;
%Lets check what are we receiving in order to to the appropriate functions
elseif(nargin == 1)
    %We are either receiving a rotation matrix, or a quaternion or a
    %rotation vector, let's check them
    size_compare = size(varargin{1});
    
    %-------------Quaternion case---------------------
    %Check if the dimensions of the input are correct
    if(size_compare == size(quaternion))
        quaternion = varargin{1};
    
    [euler_axis,angle] = quaternionToEulerAxisAngle(quaternion);
    rot_mat = AxisAngleToRotMatrix(euler_axis,angle);
  
    %-------------Rotation Matrix case----------------
    %Check if the dimensions of the input are correct
elseif(size_compare == size(rot_mat))
        rot_mat = varargin{1};
        
    [euler_axis,angle] = rotMatToEulerAxisAngle(rot_mat);
    %-------------Rotation Vector case----------------   
    %Check if the dimensions of the input are correct
elseif (size_compare == size(rot_vec))
        rot_vec = varargin{1};
        
    [euler_axis,angle] = rotationVectorToEulerAxisAngle(rot_vec);
    rot_mat = AxisAngleToRotMatrix(euler_axis,angle);
    else
        error = 1;
        
    end
if (error == 0)
%Apply the functions common for all cases
    quaternion = eulerAxisAngleToQuaternion(euler_axis,angle);
    rot_vec = eulerAxisAngleToRotationVector(euler_axis,angle);
    [pitch,roll,yaw] = matRotToEulerAngles(rot_mat);
end
    
elseif(nargin == 2)
    %We are receiving an euler axis and an angle    
    size_compare_1 = size(varargin{1});
    size_compare_2 = size(varargin{2});
    %Check if the dimensions of the input are correct
    if(size_compare_1 == size(euler_axis))
        euler_axis = varargin{1};
    else
        error = 1;
    end
   if (size_compare_2 == size(angle))
       angle = varargin{2};
   else
       error = 1;
   end
   
if (error == 0)
    %Apply the functions to get the values
    rot_mat = AxisAngleToRotMatrix(euler_axis,angle);
    quaternion = eulerAxisAngleToQuaternion(euler_axis,angle);
    rot_vec = eulerAxisAngleToRotationVector(euler_axis,angle);
    [pitch,roll,yaw] = matRotToEulerAngles(rot_mat);
end
        
 
elseif(nargin == 3)
 %We are receiving 3 euler angles roll,pitch and yaw  
    
 if(size(varargin{1}) == size(pitch))
        pitch = varargin{1};
    else
        error = 1;
 end
    
 if(size(varargin{2}) == size(roll))
        roll = varargin{2};
    else
        error = 1;
 end
    
 if(size(varargin{3}) == size(yaw))
        yaw = varargin{3};
    else
        error = 1;
 end
        
 rot_mat = eulerAnglesToRotMat(pitch,roll,yaw);
 [euler_axis,angle] = rotMatToEulerAxisAngle(rot_mat);
 quaternion = eulerAxisAngleToQuaternion(euler_axis,angle);
 rot_vec = eulerAxisAngleToRotationVector(euler_axis,angle);

end

if (error == 1)
    disp('exercise2: A parameter assignation error ocurred, please, check the HELP of this function to understant what the error is');
%error returns
rot_mat = [1 0 0; 0 1 0; 0 0 1];
roll = 0;
pitch = 0;
yaw = 0;
euler_axis = [0 0 0];
angle = 0;
quaternion = [0 0 0 0];
rot_vec = [0 0 0];
end

    
end