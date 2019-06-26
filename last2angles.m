function [a5,a4]=last2angles(a1,a,b)
[~,bricks]=size(a1);
a4=zeros(1,bricks);a5=zeros(1,bricks);
for g=1:bricks
    e_thi=[sin(a1(g));-cos(a1(g));0];
    aa=a(3,g);bb=b(3,g);
    mag_a=abs(dot(aa,aa))^0.5;mag_b=abs(dot(bb,bb))^0.5;
    a5(g)=acos(dot(e_thi,bb)/mag_b);
    e_pi=cross(aa,e_thi)/(mag_a*mag_b);
    a4(g)=acos(dot(e_pi,bb));
end

end