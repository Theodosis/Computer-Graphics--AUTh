function [ d ] = systemtrans( L, c0, c )
    % systemtrans transforms the base of the vectors. It
    % applies the reverse transformation to the coordinates of the points.
    % L: the transformation array.
    % c: the coordinates of the points, with the old base.
    % d: the coordinates of the points, with the new base.
    d = zeros( size( c ) );
    for i = 1:size( c, 2 )
        d( :, i ) = L \ c( :, i )- c0;
    end
end