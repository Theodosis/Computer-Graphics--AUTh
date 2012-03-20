function demo()
    % demo demonstrates the functions, using a static input.
    % i
    p1 = [ 1; -2; 3 ];
    p2 = [ 1; 1; -1 ];
    p3 = [ 3; 2; 1 ];
    disp( 'The set of points.' );
    p = [ p1 p2 p3 ]

    % ii: we use an identity matrix as a rotation matrix, because we do not
    % need any rotation at all, and the array [ -2, 2, 3 ] as a constant
    % relocation vector.
    disp( 'First step: Move by [ -2; 2; 3 ].' );
    t = [ -2; 2; 3 ];
    L = eye( 3 );
    p = pointtrans( L, t, p )

    % iii: we move our base by K, create the rotation transformation array,
    % rotate the points and then move back the base, by -K.
    disp( 'Second step. Rotate around vector [ -1, 2, 1 ], base [ 2, 1, 2 ] by 2 rads.' );
    K = [ 2; 1; 2 ];
    p = systemtrans( L, K, p );

    u = [ -1; 2; 1 ];
    u = u / norm( u ); % normalize the vector u.
    a = 2;
    R = rotmat( u, a )
    c = zeros( 3, 1 );
    
    p = pointtrans( R, c, p )

    p = systemtrans( L, -K, p )


    %iv: move the points by t.
    disp( 'Third step. Move the points by [ -2, 2, -3 ].' );
    t = [ -2; 2; -3 ];
    L = eye( 3 );
    p = pointtrans( L, t, p )
end