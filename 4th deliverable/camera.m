function [ P ] = camera( w, cv, cx, cy, p )
    % Given a set of points, the camera's system and the screen's distance,
    % 'camera' projects the points on the screen, and returns the
    % projection.
    
    cz = cross( cx, cy );
    
    % change the base of the points to the base of the camera.
    R = [ cx cy cz ];
    p = systemtrans( R, cv, p );
    
    % project the points to the screen.
    xq = w * p( 1, : ) ./ p( 3, : );
    yq = w * p( 2, : ) ./ p( 3, : );
    
    P = [ xq; yq ];
end