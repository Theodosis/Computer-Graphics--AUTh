function robot()
    load points.data;
    R = rotmat( [ 1 0 0 ], pi / 2 );
    p = systemtrans( R, zeros( 3, 1 ), points' )';
    
    figure( 5 );
    set( 5, 'Name', 'full' );
    hold on;
    drawPoints( p, 'co' );
    
    figure( 6 );
    set( 6, 'Name', 'splitted' );
   [ c, i ] = kmeans( p, 6 );
    count = ones(6);
    for j = 1:size(p,1)
        switch c(j) 
            case 1
                g1(count(1),:) = p(j,:);
            case 2
                g2(count(2),:) = p(j,:);
            case 3
                g3(count(3),:) = p(j,:);
            case 4
                g4(count(4),:) = p(j,:);
            case 5
                g5(count(5),:) = p(j,:);
            case 6
                g6(count(6),:) = p(j,:);
        end
        count(c(j)) = count(c(j)) + 1;
    end
    
    g1 = pointtrans( eye(3), i(1,:)', g1' );
    g2 = pointtrans( eye(3), i(2,:)', g2' );
    g3 = pointtrans( eye(3), i(3,:)', g3' );
    g4 = pointtrans( eye(3), i(4,:)', g4' );
    g5 = pointtrans( eye(3), i(5,:)', g5' );
    g6 = pointtrans( eye(3), i(6,:)', g6' );
    
    hold on;
    drawPoints( g1', 'ro' );
    drawPoints( g2', 'bo' );
    drawPoints( g3', 'go' );
    drawPoints( g4', 'mo' );
    drawPoints( g5', 'ko' );
    drawPoints( g6', 'co' );
end