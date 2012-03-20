function [ d ] = axistrans( L, c )
    % axistrans transforms the base of the vectors. It applies 
    % the reverse transformation to the coordinates of the vectors.
    % L: the transformation array.
    % c: the coordinates of the vectors, with the old base.
    % d: the coordinates of the vectors, with the new base.
    d = zeros( size( c ) );
    for i = 1:size( c, 2 )
        d( :, i ) = L \ c( :, i );
    end
end