function [xx,yy,zz,x_hat,a1,a2,a3]=angles_out(path,b,l1,l2)
%finds the three angles by taking an xy-polar coordinate representation,
%removing the y axis through a rotation and then finding the remaining two
%in the x-z plane

[~,cobbles]=size(path);

a1=atan(path(2,:)./path(1,:));
xx=zeros(1,cobbles);yy=zeros(1,cobbles);zz=zeros(1,cobbles);
for k=1:cobbles
   R=[cos(a1(k)) sin(a1(k)) 0; -sin(a1(k)) cos(a1(k)) 0; 0 0 1];
   vec=R*path(:,k);
   xx(k)=vec(1)-b;yy(k)=vec(2);zz(k)=vec(3);
end

x_hat=[xx;zz];

[a2,a3]=a2na3_from_az0_path(x_hat,l1,l2);

end