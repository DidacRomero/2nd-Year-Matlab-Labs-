function rotation_vec = eulerAxisAngleToRotationVector(euler_axis, angle)
%This function returns a rotation vector given an euler axis and angle in
%radians

rotation_vec = euler_axis * angle;
end