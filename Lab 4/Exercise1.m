%% Exercise 1
clear all; clc; 
% The point p has coordinates
p_A = [3, 4]';
% on a frame A and coordinates
p_B = [-2.5, 0.5]';
% on a frame B

disp('Exercise 1:');
%WE ASSUME
ex1_o_A = [0 0]';

%It is known that the angle between x axis of frame {A} and the y axes from
%Frame{B} is 30 deg counterclockwise.
ex1_rotMat_A_to_B = angleTo2dRotMat(300);
ex1_rotMat_B_to_A = ex1_rotMat_A_to_B';

%We isolate the translation
ex_1_t_B_to_A = p_A - ex1_rotMat_B_to_A * p_B;
ex_1_t_A_to_B = p_B - ex1_rotMat_A_to_B * p_A;

% 1.1 Which are the coordinates of the origin of A seen from B?
ex1_oBA = ex1_rotMat_A_to_B * ex1_o_A + ex_1_t_A_to_B;

% 1.2 Which are the coordinates of the origin of B seen from A? 
%ASSUMINg the result above is ok
ex1_oAB = ex1_rotMat_B_to_A * ex1_o_A + ex_1_t_B_to_A;

% 1.3 Which are the coordinates of a point q expressed in A if
q_B = [3,1]'; %?
ex_1_q_A = ex1_rotMat_B_to_A * q_B + ex_1_t_B_to_A;

disp('Coordinates of A origin seen from B');
disp(ex1_oBA);
disp('Coordinates of B origin seen from A');
disp(ex1_oAB);
disp('Coordinates of q in A');
disp(ex_1_q_A);

