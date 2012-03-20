function [ d ] = pointtrans( L, c0, c )
    % pointtrans transforms points using the transformation
    % array L.
    % L: the transformation array.
    % c: the coordinates of the input points.
    % d: the coordinates of the output points.
    d = zeros( size( c ) );
    for i = 1:size( c, 2 )
        d( :, i ) = L * c( :, i ) + c0;
    end
end