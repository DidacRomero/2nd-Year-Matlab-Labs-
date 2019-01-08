function  [euler_axis, angle] = rotationVectorToEulerAxisAngle(rot_vec)
%Return the euler axis and angle (in radians) of a rotation vector

angle = sqrt(rot_vec(1,1)^2 + rot_vec(1,2)^2 + rot_vec(1,3)^2);
euler_axis = rot_vec / angle;


end