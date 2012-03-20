function [ T ] = InterpColorShape( Q, T, C, M, N, bg )
    % Given a set of points, their connections and their colors,
    % InterpColorShape creates a canvas and draws the shape on it.
    
    %preallocate a blank image.
    image = zeros( M, N, 3 );
    image( 1, :, 1 ) = bg( 1 ) / 2;
    image( 1, :, 2 ) = bg( 2 ) / 2;
    image( 1, :, 3 ) = bg( 3 ) / 2;
    for i = 2:M
        image( i, :, 1 ) = image( i-1, :, 1 ) + bg( 1 ) / M / 2;
        image( i, :, 2 ) = image( i-1, :, 2 ) + bg( 2 ) / M / 2;
        image( i, :, 3 ) = image( i-1, :, 3 ) + bg( 3 ) / M / 2;
    end
    
    %draw each triangle seperately
    for i = 1:size( Q, 1 )
        points = [ T( Q( i, 1 ), : ); T( Q( i, 2 ), : ); T( Q( i, 3 ), : ) ];
        colors = [ C( Q( i, 1 ), : ); C( Q( i, 2 ), : ); C( Q( i, 3 ), : ) ];
        image = InterpColorTriangle( image, points, colors );
    end
    %flip y dimention, so that y = 0 is at the bottom.
    T = flipdim( image, 1 );
end

