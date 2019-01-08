function rotMat = angleTo2dRotMat(angle)
%This function receives an angle in DEGREES

angle = deg2rad(angle);
rotMat = [cos(angle) -sin(angle); sin(angle) cos(angle)];

%Remember in translation

%1st
%Ap = ArB * Bp +AtB
%2nd
%BrA = (ArB)' 
%3rd
%BtA = -(BrA) * AtB
end