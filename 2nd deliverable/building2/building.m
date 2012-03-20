function building()
    load building/building.triangles.data;
    load building/building.points.data;
    p = building_points';
    t = building_triangles(:,2:4)' + 1;
    c = zeros( 3, 1 );

    figure( 1 );
    set( 1, 'Name', 'top' );
    R = rotmat( [ 0 0 1 ], pi );
    p = systemtrans( R, c, p );
    draw( p, t );

    figure( 2 );
    set( 2, 'Name', 'front' );
    R = rotmat( [ 1 0 0 ], pi / 2 );
    p = systemtrans( R, c, p );
    draw( p, t );

    figure( 3 );
    set( 3, 'Name', 'side' );
    R = rotmat( [ 0 1 0 ], - pi / 2 );
    p = systemtrans( R, c, p );
    draw( p, t );

    figure( 4 );
    set( 4, 'Name', 'prespective' );
    R1 = rotmat( [ 0 1 0 ],  4 * pi / 9 );
    R2 = rotmat( [ 1 0 0 ], - pi / 4 );
    R = R1 * R2;
    p = systemtrans( R, c, p );
    draw( p, t );
end