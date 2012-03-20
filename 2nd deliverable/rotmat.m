function R = rotmat(u,a)
%ROTMAT Summary of this function goes here
%   Detailed explanation goes here

%Αρχικοποίηση
ux=u(1,1);
uy=u(2,1);
uz=u(3,1);

r=u*u';

k=[0 -uz uy;
   uz 0 -ux;
  -uy ux 0];

x=cos(a);
y=sin(a);

%κατακερματισμός υπολογισμών
A1=(1-x)*r;

A2=x*eye(3,3);

A3=y*k;

%υπολογισμός του R
R=A1+A2+A3;
end

