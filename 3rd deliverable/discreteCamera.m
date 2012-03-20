function [ Im ] = discreteCamera( w, cv, cK, cu, bC, M, N, H, W, Q, T, C )
    % This function is responsible to show a model ( T, C, Q ), as a
    % projection of the defined camera ( cv, cK, cu ).
    
    % get the exact projection of the model, as it projects on a surface w
    % away from the camera, vertical to vector cK - cv.
    % The results are measured in inches.
    P = cameraKu( w, cv, cK, cu, T );
    
    % calculate the dencity of the pixels, in dpi. Dencity does not need to
    % be the same vertically and horizontally.
    dpi = [ M / H N / W ];
    
    % multiply with the dencity, to get the points in pixels.
    P = [ P(1,:) * dpi(1); P(2,:) * dpi(2) ];
    
    % add half of with and height to x and y, so that our image begins from
    % pixel 0x0 and ends on MxN
    P(1,:) = P(1,:) + M / 2 + 1;
    P(2,:) = P(2,:) + N / 2 + 1;
    
    % round the coordinates of the image, as a discrete camera dictates.
    P = round( P );

    % find the points that are outside our boundaries.
    [~,a] = find( P <= 0 );
    [~,b] = find( P(1,:) >= N | P(2,:) >= M  );
    
    % find the triangles that contain illegal points, and remove them.
    [r,~] = find( ismember( Q, [ a' b ] ) );
    Q( r,: ) = [];
    
    % We need the triangles to be sorted by the distance of their weight
    % center with the center of the camera, so that we can use the
    % painter's method to fill them.
    
    % The vector dist contains the depth of the points.
    
    % CW is an array with the size of Q, containing the distance of the
    % weight center of every triangle from the center of the camera.
    
    % We sort Q by the CW column, and keep only the first three columns.
    
    dist = power( ( cv(1) - T(1,:) ), 2 ) + power( ( cv(2) - T(2,:) ), 2 ) + power( ( cv(3) - T(3,:) ), 2 );
    CW = sum( dist( Q ), 2 );
    Q = sortrows( [Q CW], 4 );
    Q = flipud( Q );
    Q = Q( :, 1:3 );
    
    % At this point, we are ready to paint the shape.
    Im = InterpColorShape( Q, P', C, M, N, bC );
end