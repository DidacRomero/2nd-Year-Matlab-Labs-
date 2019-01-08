function [pitch,roll,yaw] = matRotToEulerAngles(rot_mat)
%This function returns the euler rotation Angles found
%in a rotation matrix.

%First look for the pitch
pitch = asin(-rot_mat(3,1));
roll = atan2(rot_mat(3,2)/cos(pitch),rot_mat(3,3)/cos(pitch));
yaw = atan2(rot_mat(2,1)/cos(pitch),rot_mat(1,1)/cos(pitch));

% %Display in degrees
roll_disp = rad2deg(roll);
pitch_disp = rad2deg(pitch);
yaw_disp = rad2deg(yaw);

% %Display in Degrees
disp('Pitch: ');
disp(pitch_disp);
disp('Roll: ');
disp(roll_disp);
disp('Yaw: ');
disp(yaw_disp);
end



