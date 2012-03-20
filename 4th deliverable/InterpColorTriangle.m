function [ Y ] = InterpColorTriangle( X, P, C )
    % Given a canvas, three points and their color, InterpColorTriangle
    % draws the triangle on the canvas.
    % Author: Theodosis Sourgkounis
    
    %l: ids of combined points
    l = [ 1, 2; 2, 3; 1, 3 ];
    
    %m: diference for each line
    %m == [ dx, dr, dg, db; ... ]
    m = zeros( 3, 4 );
    
    %mm: ids of points for each line
    %mm == [ xmin, xmax, ymin, ymax; ... ]
    mm = zeros( 3, 4 );
    
    %calculate arrays mm and m
    for i = 1:3
        %xmin
        [ ~, index ] = min( [ P( l(i,1),1), P(l(i,2),1) ] );
        mm(i,1) = l(i,index);
        %xmax
        [ ~, index ] = max( [ P( l(i,1),1), P(l(i,2),1) ] );
        mm(i,2) = l(i,index);
        %ymin
        [ ~, index ] = min( [ P( l(i,1),2), P(l(i,2),2) ] );
        mm(i,3) = l(i,index);
        %ymax
        [ ~, index ] = max( [ P( l(i,1),2), P(l(i,2),2) ] );
        mm(i,4) = l(i,index);
        
        dx = P( l(i,1), 1 ) - P( l(i,2), 1 );
        dy = P( l(i,1), 2 ) - P( l(i,2), 2 );
        dc = C( l(i,1), : ) - C( l(i,2), : );
        if( dy ~= 0 )
            m(i,1) = dx / dy;
            m(i,2:4) = dc / dy;
        end
    end

    ymin = min( P(:,2) );
    ymax = max( P(:,2) );
    %al: ids of active lines
    al = zeros(3,1);
    
    %ap: active points
    %ap: [x,y,r,g,b; ...]
    ap = zeros(3,5);
    
    % scan each line
    for y = ymin:ymax-1
        % Only two lines will be active for every scan-line. If there is a
        % horizotal line, it will be added and removed in the same step.
        % If it's in the top it will be painted from the active points of
        % the other two lines.
        % If it's in the bottom, there are not any marked active lines, and
        % we sould set active points manually.
        hor = 0;
        for i = 1:3
            %increse active points by their m
            if al( i )
                ap( i,: ) = ap( i,: ) + [ m( i,1 ), 1, m(i,2:4) ];
            end
            
            %add new active lines and points
            if P( mm( i, 3 ), 2 ) == y
                al(i) = 1;
                ap(i,:) = [ P( mm(i,3), : ), C( mm( i,3 ), : ) ];
            end
            %remove finished lines and points
            if P( mm(i,4), 2 ) == y
                ap( i, : ) = zeros( 1, 5 );
                al( i ) = 0;
            end
            if( P( mm( i, 4 ), 1 ) == P( mm( i, 3 ), 1 ) )
                hor = i;
            end
        end

        if( sum( al ) == 0 && hor )
            % we are on a horizontial line, which is in the bottom of our
            % triangle. We will set manually the points, as they are the
            % min and the max of that line. We allready saved that line to
            % hor.
            a1 = [ P( mm( hor, 1 ) ), y, C( mm( hor, 1 ), : ) ];
            a2 = [ P( mm( hor, 2 ) ), y, C( mm( hor, 2 ), : ) ];
        else
            %sorting rows, so that the 'deleted' ap goes to top. n(2,:) and
            %n(3,:) now have our two active points
            n = sortrows( ap, 1 );
            a1 = n( 2, : );
            a2 = n( 3, : );
        end
        
        a1c = a1( 3:5 );
        a2c = a2( 3:5 );

        %mc is the color to add on every step
        mc = ( a1c - a2c ) / ( a1( 1 ) -a2( 1 ) );
        
        % scan the current line
        for x = floor(a1(1)):a2(1) - 1
            % paint the color specified by a1c, and increase a1c by mc. 
            % In the last step, a1c sould be the same as a2c
            X(y,x,:) = a1c;
            a1c = a1c + mc;
        end
    end
    Y = X;
end