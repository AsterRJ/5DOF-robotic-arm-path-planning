function [xe,ze,xp,zp,x,y,z]=forwardkin_first3DOF(a,b,c,d,l1,l2) 


%coords for the 3rd robotic joint
x=(l2*cos(b-c)-l1*sin(b)+d).*cos(a);

y=(l2*cos(b-c)-l1*sin(b)+d).*sin(a);

z=l2*sin(c-b)+l1*cos(b);
         
%robotic joint coords in the azimuthal plane, i.e. if a1 was constant
xp=l2*cos(b-c)-l1*sin(b)+d;
zp=l2*sin(c-b)+l1*cos(b);

%'elbow' movements. Potential for building into a joint-angle-exclusion
%zone
xe=l1*sin(b);
ze=l1*cos(b);


end