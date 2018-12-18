function Exercise4()
%Function for exercise 4, written response and exercise enunctiationafter
%the function end.
%This function plots a graphic of the relation of the trace and angle of 100 random rotation matrices
traces = zeros(1,100);
angles = zeros(1,100);

randNums = randi([0 30],1,300);
for n = 1:100
    angle =  (6*pi / 100) * n;
    angles(:,n) = angle;
    
    testAxis = [randNums(:,n) randNums(:,n + 100) randNums(:,n +200)];
    
    RotMatrix = AxisAngleToRotMatrix(testAxis,rad2deg(angle));
  
    traces(:,n) = trace(RotMatrix);

end


plot(angles,traces);
xlabel('Angle (radians)');
ylabel('Trace');
title('Exercise 4 comparison');

end
%% Exercise 4
% Create a large set of rotation matrices (at least 100) for which the euler axis may be 
% random (not necessarily random, but not the same) and the euler angle in
% increasing order form 0 to 6 pi. (Use a FOR LOOP)
% Make a plot of the trace of this matrices with the value of the angle in
% the x axis i.e. Trace(R(phi,e)) vs. \phi . Explain what you observe.

%From the plot we can observe that we obtain a sinusoidal graph,wich cycles
%depending on the angle, resseting in 360º.
%What we also observed is that the lowest trace (-1) is reached at a pi rotation
%(180º) whereas the trace is higher when the angle is 0 (0º) (0º, 360º,720º)