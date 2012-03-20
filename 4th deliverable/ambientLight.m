function I = ambientLight( ~, ka, Ia )
    % ambientLight calculates the color of a point, based on the level of
    % the light and the color of the point. No knowledge of the point's
    % position is required.
    I = Ia .* ka;
    I = ( I >= 0 & I <= 1 ) .* I + ( I > 1 );
end