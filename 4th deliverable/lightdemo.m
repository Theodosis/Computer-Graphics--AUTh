function lightdemo()
    load vaseinterp.mat;
    Q = F(:,2:4) + 1;
    T = r;
    C = C / 255;
    ka = 0.3 * C;
    kd = 0.6 * C;
    ks = 0.8 * C;
    ncoeff = 3;
    
    Ia = [ 1 1 1 ]';
    S = [ 100 -600 900; 200 600 500 ]';
    I0 = [ 0.8 0.8 0.8; 0.7 0.7 0.7 ]';
    
    w = 1.8;
    cv = [ -500; -700; 400 ];
    cK = [ -5; 20; -30 ];
    cu = [ 0; 0; 1 ];
    bC = [ 0; 0; 0 ]; % we use black background
    M = 480;
    N = 640;
    H = 1/2;
    W = 2/3;
    
    
    Im = discretePhoto( w, cv, cK, cu, bC, M, N, H, W, T, Q, S, ka, kd, ks, ncoeff, Ia, I0 );
    
    imshow( Im );
end

