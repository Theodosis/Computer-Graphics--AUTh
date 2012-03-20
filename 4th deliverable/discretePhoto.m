function Im = discretePhoto( w, cv, cK, cu, bC, M, N, H, W, r, F, S, ka, kd, ks, ncoeff, Ia, I0 )
    % discretePhoto calculates and displays the model, using the light
    % sources and the attributes of the model.
    
    L = lightObject( r, F, S, cv, ka, kd, ks, ncoeff, Ia, I0 );
    
    Im = discreteCamera( w, cv, cK, cu, bC, M, N, H, W, F, r, L );
end