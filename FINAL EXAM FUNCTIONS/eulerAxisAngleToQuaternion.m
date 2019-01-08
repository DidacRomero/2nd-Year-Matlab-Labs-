function ret_quat = eulerAxisAngleToQuaternion(euler_axis,angle)
%This function returns the quaternion given an euler axis and an angle in
%DEGREES

angle = deg2rad(angle);

flag = 0;
if(length(euler_axis) ~= 3)
        disp('The axis is not valid, vector must be 3 dimension!')
        flag = 1;
end

if(flag == 0)
euler_axis = euler_axis / norm(euler_axis);
end

%Calculate the quaternion
scalar = cos(angle/2);
vec1 = euler_axis*sin(angle/2);
ret_quat = [scalar vec1]; 

end 