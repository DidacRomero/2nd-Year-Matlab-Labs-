function rot_vec = vecQuatRot(vec_to_rot, quat)
%Function to rotate a vector using quaternion encoding
error=0;

% Controlling possible input errors
if (nargin < 2)
    disp('Not enough parameters passed.');
    error = 1;
end

if (size(vec_to_rot) ~= 3)
    disp('vec_to_ret size incorrect.');
    error = 1;
end
if (size(vec_to_rot) < 3)
     disp('Quaternion size incorrect.');
    error = 1;
end

if (error ==0)
%The quaternion as a unit quaternion
quat = quat/(sqrt(quat(:,1)^2 + quat(:,2)^2 + quat(:,3)^2 + quat(:,4)^2 )); 
%Vector as pure quaternion
vec_quat = [0 vec_to_rot];

conj_quat_vec = [-quat(2) -quat(3) -quat(4)];
conj_quat = [quat(:,1) conj_quat_vec];

%Calculate the vector that will be RETURNED
rot_vec_quat = quatMultiplication(quatMultiplication(quat,vec_quat),conj_quat);
rot_vec = [rot_vec_quat(:,2) rot_vec_quat(:,3) rot_vec_quat(:,4)];
end
end