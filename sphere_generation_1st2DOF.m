function [x]=sphere_generation_1st2DOF(pos,l_w2f)
syms alpha beta

R=[cos(beta) 0 sin(beta);-sin(alpha)*sin(beta) cos(alpha) cos(beta)*sin(alpha);-sin(beta)*cos(alpha) -sin(alpha) cos(alpha)*cos(beta)];
e1=[1;0;0];
x=pos+R*e1+l_w2f;
end