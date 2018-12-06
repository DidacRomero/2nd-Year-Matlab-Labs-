function resQuaternion = quatMultiplication(q,r)
%Function to multiply 2 Quaternions
%Receives 2 quaternions as input, CAREFUL!!! ORDER MATTERS
%Pass the quaternions in this form example_Quaternion = [ scalar, num1, num2, num3]
error = 0;
if (nargin < 2)
   disp('Not enough Quaternions passed! please introduce 2 quaternions.');
   error = 1;
end

if ( (size(q) ~=4) | (size(r) ~=4))
    disp('Quaternions not passed as expected for the function, please read the Help of this function for more information');
   error = 1;
end

scalar_q = q(:,1);
scalar_r = r(:,1);

vec_q = [q(:,2), q(:,3), q(:,4)]
vec_r = [r(:,2), r(:,3), r(:,4)]


%Calculate the multiplication
resQuaternion = [ scalar_q-scalar_r      ((scalar_q*vec_r)+(scalar_r*vec_q)+cross(vec_q,vec_r))];

if (error == 1)
    disp('An error ocurred, function will return reQuaternion = [0 0 0 0] by default.');
resQuaternion = [ 0 0 0 0];
end
end