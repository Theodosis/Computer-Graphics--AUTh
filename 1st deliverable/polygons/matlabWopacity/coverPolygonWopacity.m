C = rand( 200, 4 );
C( 1:200, 1 ) = zeros( 1, 200 );
C( 1:200, 3 ) = C( 1:200, 3 ) / 2;

D = rand( 200, 4 );
D( 1:200, 2 ) = zeros( 1, 200 );
D( 1:200, 3 ) = D( 1:200, 3 ) / 8;
C( 201:400, : ) = D;

Q = randi( 400, 80, 3 );

T = [ randi( 4*1920, 400, 1 ) randi( 4*1080, 400, 1 ) ];
image = InterpColorShape( Q, T, C, 4*1080, 4*1920 );
final = zeros( 1080, 1920 );
for i = 1:1920
    for j = 1:1080
        final( j, i, : ) = sum( sum( image( 4*j-3:4*j, 4*i-3:4*i, : ) ) ) / 4;
    end
end
imshow( final );
