function Clight = lightObject( r, F, S, V, ka, kd, ks, ncoeff, Ia, I0 )
    % lightObject calculates the light of the model, based on the light
    % sources and the attributes of the model. 
    % It calculates the vector N for every point, as the average of the 
    % normal vectors of the triangles it participates.
    % The final color is calculated using the ambient, the diffuse and the 
    % specular light for every point.

    % calculate normal vectors of the triangles, as the cross product of
    % their vectors.
    normals = cross( r( :,F(:,2) ) - r( :,F(:,1) ), r( :,F(:,3) ) - r( :,F(:,2) ) );
    temp = sqrt( sum( normals .^ 2, 1 ) );
    normals = normals ./ [ temp; temp; temp ];
    
    % summing up all normal vectors for every point. No need to devide with
    % their number, since we will use the normalized versions
    % TODO: optimize this loop?
    N = zeros( size( r ) );
    for i = 1:size(F,1)
        N(:,F(i,:)) = N(:,F(i,:)) + stretch( normals( :, i ), 3 );
    end
    
    % calculate the color of each corner of our model, as the sum of the
    % ambient, the diffuse and the specular light.
    I = zeros( size( r, 2 ), 3 );
    for i = 1:size( r, 2 )
        I(i,:) = ambientLight( r(:,i)', ka(i,:), Ia' ) + diffuseLight( r(:,i), N(:,i), kd(i,:), S, I0 ) + specularLight( V, r(:,i), N(:,i), ks(i,:), ncoeff, S, I0 );
    end
    
    Clight = I;
end
