function I = specularLight( V, P, N, ks, ncoeff, S, I0 )
    % specularLight calculates the specular reflection for the point P, the
    % sources S and the watcher V. 
    
    % L is the array of vectors from the point P to the light sources.
    L = S - stretch( P, size( S, 2 ) );
    
    % calculate the vector V, as the vector from point P to point V.
    V = V - P;
    
    % normalization of vectors L, N and V.
    temp = sqrt( sum( L .^ 2, 1 ) );
    L = L ./ [ temp; temp; temp ];
    N = N / norm( N );
    V = V / norm( V );
    
    % we are about to calculate the expression 
    % I * k * ( ( 2N( N * L ) - L ) * V ) ^ ncoeff
    % for multiple sources at once, for optimization reasons. We will do 
    % that in steps, to keep it as simple as it can be.
    
    
    % STEP 1: internal product of N with every L. size: number of the 
    % light sources
    NL = dot( L, stretch( N, size( L, 2 ) ), 1 );
    
    % STEP 2: stretch NL vertically.
    % we need to multiply the internal product of N and L with every
    % dimention of the color, R, G, B.
    NL = [ NL; NL; NL ];
    
    % STEP 3: calculating the inner parenthesis. Again, we stretch the
    % vector N to meet the dimention of L
    c1 = 2 * stretch( N, size( NL, 2 ) ) .* NL - L;
    
    % STEP 4: calculating the outter parenthesis and the power.
    c = dot( c1, stretch( V, size( c1, 2 ) ), 1 ) .^ ncoeff;
    % at this point, c sould be between -1 and 1, as it corresponds to the
    % cosine of the angle between the vector R and the vector V, when R is
    % the vector L mirrored around N.
    
    
    % STEP 5: calculate the rest of the equation. ks is being stretched
    % horizontically, to meet the dimentions of I0.
    % We also need to multiply the outter parenthesys for every dimention, 
    % as we did before for the NL (line 30), so we stretch it vertically.
    I = I0 .* stretch( ks', size( I0, 2 ) ) .* [ c; c; c ];
    
    % at this point, the array I sould contain the light of the point for
    % every light source. We limit it between 0 and 1, and then sum up the
    % light sources.
    I = ( I >= 0 & I <= 1 ) .* I + ( I > 1 );
    I = sum( I, 2 )';
end

