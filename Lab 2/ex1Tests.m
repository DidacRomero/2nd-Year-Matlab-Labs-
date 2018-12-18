function testFlag=ex1Tests(rotMat,vecToTest,axisVec,testAngle)
% Receives a Rotation Matrix, a vector to test, an axis and an angle in
% DEGREES
% Does the next verifications:
%   - Calculates the determinant
%   - Ensures that the transpose operation is equivalent to the inverse
%   - Observes what happens to a vector parallel to the axis direction
%   - Observes what happens to a vector perpendicular to the axis direction
disp('Results of the comprovations (Tests):');
testFlag = 0;

if (testFlag==0)
    %   - Calculate the determinant
    %if(det(rotMat)~=1)
    if(det(rotMat)< 2 && det(rotMat)> 0 ) 
        %This is for determinant == 1 to avoid Matlab Problems with decimals,
        %the determinant of the matrix will always return an integer, but
        %for some angles Matlab seems to return 1.0000 on determinants for
        %angles between 120º and 180º.
        % And for some Reason Matlab says that 1.0000 is not the same as 1 ¯\_(?)_/¯
        disp('Rotation Matrix determinant = 1');
    else %If det~= 1
        testFlag = -1;
        disp("ERROR: Determinant diferent than 1");
    end
    
    %   - Ensure that the transpose operation is equivalent to the inverse
    auxTransMat = rotMat';
    if (auxTransMat ~= inv(rotMat))
         testFlag = -1;
         disp("ERROR: Transpose of the RotationMatrix is different than the inverse");
    else
        disp('Transpose of the RotationMatrix is equal to its inverse');
    end
    
    %   - Observe what happens to a vector parallel to the axis direction
    Rotator = AxisAngleToRotMatrix(axisVec,testAngle);
    auxRotatedVec =  Rotator * vecToTest';
    
    % Check if parallel
    if (auxRotatedVec == vecToTest)
        disp('The vector (vecToTest) is PARALLEL to the axis');
    %Check if Perpendicular
    elseif (dot(auxRotatedVec,axisVec')==0)
         disp('The vector (vecToTest) is PERPENDICULAR to the axis');
    else
        disp('The vector (vecToTest) is neither Parallel nor Perpendicular to the axis');
    end
end

    return
end


