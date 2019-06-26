function [a2,a3]=a2na3_from_az0_path(x_hat,l1,l2)
%takes the path in the main axis projection (i.e. just x-y radial path) and turns this into a path for a2 and a3


[~,bricks]=size(x_hat);

r=zeros(2,bricks);
xhat_sqd=x_hat(2,:).^2+x_hat(1,:).^2;
gamma=(l2^2-l1^2-xhat_sqd)/(2*l1);
for k=1:bricks
    
    a=xhat_sqd(k);
    b=2*gamma(k)*x_hat(2,k);
    c=gamma(k)^2-x_hat(1,k)^2;
    
    p=[a b c];
    r(:,k)=roots(p);
    
    ind=ge(1,abs(r(:,k))); %can probably be removed. this part solves a quadratic from intersecting circles and returns a set of coords for the elbow that is then transfo'd into joint coords
    %this is simply to check which of the two returnes sensible coords-generally unnecessary with the line specified with an *.
    r(:,k)=ind.*r(:,k);
    
end

a2_pot=acos(r);
for l=1:2
   a3_pot(l,:)=a2_pot(l,:)+asin((x_hat(2,:)-l1*r(l,:))/l2);
end

a2ind=abs(sign(a2_pot).*a2_pot-abs(a2_pot));
for kk=1:bricks
   ind1=gt(a2ind(:,kk),0); 
   if ind1(1)==1
       a2=a2_pot(2,:);
       a3=a3_pot(2,:);
   else
      if ind1(2)==1
        a2=a2_pot(1,:); 
        a3=a3_pot(1,:);
      else
         a2=zeros(1,bricks);a3=zeros(1,bricks); 
      end
   end
end
%can have double vector for possible positions, but i cba rn
end
