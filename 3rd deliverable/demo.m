function demo()
    load vaseinterp.mat;
    cv = [ -500 -700 400 ]';
    cK = [ -5 20 -30 ]'; % cK are actually the coordinates of the point K.
    cu = [ 0 0 1 ]';
    H = 1/2;
    W = 2/3;
    w = 1.8;
    bC = [ 0.75 0.75 0.75 ]';
    Q = F(:,2:4) + 1; % Matlab does not use 0 as a pointer of an array.
    T = r;
    C = C / 255; % devide by 255 to match the [0,1] range of the colors.
    
    M = 480;
    N = 640;

    Im = discreteCamera( w, cv, cK, cu, bC, M, N, H, W, Q, T, C );
    imshow( Im );
end