function rot_mat = eulerAnglesToRotMat(pitch,roll,yaw)
%This funtion receives pitch,roll,yaw and returns a rotation matrix

r11= (cos(pitch)*cos(yaw));
r12= ((cos(yaw)*sin(pitch)*sin(roll))-(cos(roll)*sin(yaw)));
r13= ((cos(yaw)*cos(yaw)*sin(pitch))+(sin(yaw)*sin(roll)));

r21= (cos(pitch)*sin(yaw));
r22= ((sin(yaw)*sin(pitch)*sin(roll))+(cos(roll)*cos(yaw)));
r23= ((sin(yaw)*sin(yaw)*cos(pitch))-(cos(yaw)*sin(roll)));

r31= -sin(pitch);
r32= cos(pitch)*sin(roll);
r33= cos(pitch)*cos(roll);

rot_mat = [r11 r12 r13; r21 r22 r23; r31 r32 r33];

end