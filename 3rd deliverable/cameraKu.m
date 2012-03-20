function [ P ] = cameraKu( w, cv, cK, cu, p )
    % This function is responsible to translate the "direction-up vector"
    % expression of the base of the camera to the coordinates of the base
    % vectors, call the function 'camera' with these vectors and return the
    % results.
    cz = ( cK - cv ) / norm( cK - cv );
    t = cu - cu' * cz * cz;
    cy = t / norm( t );
    cx = cross( cy, cz );
    P = camera( w, cv, cx, cy, p );
end

