function [ d ] = vectrans( L, c )
    % vectrans transforms vectors using the transformation array L.
    % L: the transformation array.
    % c: the input vectors.
    % d: the output vectors.
    d = zeros( size( c ) );
    for i = 1:size( c, 2 )
        d( :, i ) = L * c( :, i );
    end
end