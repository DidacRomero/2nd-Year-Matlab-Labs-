function [euler_axis,angle] = quaternionToEulerAxisAngle(quat)
%This function returns the Euler Axis and the Euler Angle from a given
%quaternion

angle = 2*acos(quat(1,1));

quat_vec = [quat(1,2) quat(1,3) quat(1,4)];
euler_axis = quat_vec / (sin(angle/2));
end