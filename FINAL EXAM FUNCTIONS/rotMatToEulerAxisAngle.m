function [euler_axis,angle] = rotMatToEulerAxisAngle(rot_mat)
%This function returns the euler axis and the angle of a rotation matrix
mat_trace = trace(rot_mat);

angle = acos((mat_trace-1)/2);
euler_ux = (rot_mat-(rot_mat'))/(2*sin(angle));
euler_axis=[euler_ux(3,2) euler_ux(1,3) euler_ux(2,1)];

end