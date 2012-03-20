function [ d ] = systemtrans( L, c0, c )
    % systemtrans transforms the base of the vectors. It
    % applies the reverse transformation to the coordinates of the points.
    % L: the transformation array.
    % c: the coordinates of the points, with the old base.
    % d: the coordinates of the points, with the new base.
    R = [ L^(-1) -L^(-1)*c0 ];
    R(4,:) = zeros( 1, 4 );
    R(4,4) = 1;
    
    c(4, : ) = ones( 1, size( c, 2 ) );
    d = R * c;
    
    d = d( 1:3, : );
end