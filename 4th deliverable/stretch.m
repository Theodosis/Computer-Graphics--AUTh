function A = stretch( a, s )
    % streches array a horizontically, to the number s.
    temp = ones( 3, s );
    pointers = [ temp(1,:); temp(2,:)*2;temp(3,:)*3 ];
    % pointers look like: [ 1 1; 2 2; 3 3 ], for s == 2.
    A = a( pointers );
end
