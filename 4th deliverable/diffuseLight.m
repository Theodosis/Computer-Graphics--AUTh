function I = diffuseLight( P, N, kd, S, I0 )
    % diffuseLight calculates the color of a point, based on the light
    % sources and the point's attributes.
    
    % L is the array of vectors from the point P to the light sources. We
    % use matlab array operations as an optimization.
    L = S - stretch( P, size( S, 2 ) );
    
    
    % normalization of vectors L and N
    temp = sqrt( sum( L .^ 2, 1 ) );
    L = L ./ [ temp; temp; temp ];
    N = N / norm( N );
    
    % internal product of N with every L. size: number of the light sources
    
    NL = dot( L, stretch( N, size( L, 2 ) ), 1 );
    
    % { I * k * dot( N, L ) }, written for multiple sources.
    I = I0 .* stretch( kd', size( I0, 2 ) ) .* [ NL; NL; NL ];
    
    % limit the light between 0 and 1. This is important, as some negative
    % values do occure as a result of the internal product of N with L.
    I = ( I >= 0 & I <= 1 ) .* I + ( I > 1 );
    
    % summing up the light from all light sources.
    I = sum( I, 2 )';
    
end

