function [projection] = Vector_Projection_over_Direction(vec_to_proj,uwu_direction)
%HELPO
% vec_to_proj = vector to project
% uwu_direction = u direction or vector to which we project
projection = (vec_to_proj'* uwu_direction) * uwu_direction/(norm(uwu_direction)^2);


end