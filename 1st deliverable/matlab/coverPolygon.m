C = rand( 100, 3 );
Q = randi( 100, 40, 3 );
T = randi( 1000, 100, 2 );
image = InterpColorShape( Q, T, C, 1000, 1000 );
imshow( image );
