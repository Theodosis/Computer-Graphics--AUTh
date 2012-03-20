function draw( points, triangles )
    hold on;
    for i = 1:size( triangles, 2 )
        p1 = points( :, triangles( 1, i ) );
        p2 = points( :, triangles( 2, i ) );
        p3 = points( :, triangles( 3, i ) );
        plot3(  [ p1( 1 ) p2( 1 ) p3( 1 ) p1( 1 ) ], [ p1( 2 ) p2( 2 ) p3( 2 ) p1( 2 ) ], [ p1( 3 ) p2( 3 ) p3( 3 ) p1( 3 )] );
    end
    hold off;
    axis equal;
end