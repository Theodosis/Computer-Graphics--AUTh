function [ R ] = rotmat( u, a )
    % rotmat creates a rotation transformation array.
    % u: the axis of rotation.
    % a: the angle in rads.
    ux = u( 1 );
    uy = u( 2 );
    uz = u( 3 );
    ca = cos( a );
    ca2 = 1 - cos( a );
    sa = sin( a );
    R = [ ca2 * ux * ux + ca,      ca2 * ux * uy - sa * uz, ca2 * ux * uz + sa * uy;
          ca2 * uy * ux + sa * uz, ca2 * uy * uy + ca,      ca2 * uy * uz - sa * ux;
          ca2 * uz * ux - sa * uy, ca2 * uz * uy + sa * ux, ca2 * uz * uz + ca ];
end