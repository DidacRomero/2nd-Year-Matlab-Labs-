function testFlag=ex1Tests(rotMat,vecToTest,axisVec,testAngle)
% Do the next verifications:
%   - Calculate the determinant
%   - Ensure that the transpose operation is equivalent to the inverse
%   - Observe what happens to a vector parallel to the axis direction
%   - Observe what happens to a vector perpendicular to the axis direction
disp('Results of the comprovations (Tests):');
testFlag = 0;

if (testFlag==0)
    %   - Calculate the determinant
    if(det(rotMat)~=1)
        testFlag = -1;
        disp("ERROR: Determinant diferent than 1");
    end
    
    %   - Ensure that the transpose operation is equivalent to the inverse
    auxTransMat = rotMat';
    if (auxTransMat ~= inv(rotMat))
         testFlag = -1;
         disp("ERROR: Transpose of the RotationMatrix is different than the inverse");
    end
    
    %   - Observe what happens to a vector parallel to the axis direction
    Rotator = AxisAngleToRotMatrix(axisVec,testAngle);
    auxRotatedVec = vecToTest *Rotator;
    
    % Check if parallel
    if (auxRotatedVec == vecToTest)
        disp('The vector (vecToTest) is PARALLEL to the axis');
    %Check if Perpendicular
    elseif (dot(auxRotatedVec,vecToTest)==0)
         disp('The vector (vecToTest) is PERPENDICULAR to the axis');
    else
        disp('The vector (vecToTest) is neither Parallel nor Perpendicular to the axis');
    end
end

    return
end


