function [ T ] = InterpColorShape( Q, T, C, M, N )
    %preallocate a blank image.
    image = zeros( M, N, 3 );
    %draw each triangle seperately
    for i = 1:size( Q, 1 )
        points = [ T( Q( i, 1 ), : ); T( Q( i, 2 ), : ); T( Q( i, 3 ), : ) ];
        colors = [ C( Q( i, 1 ), : ); C( Q( i, 2 ), : ); C( Q( i, 3 ), : ) ];
        image = InterpColorTriangleWopacity( image, points, colors );
    end
    %flip y dimention, so that y = 0 is at the bottom.
    T = flipdim( image, 1 );
end

