function [a1m,a2m,a3m]=modded_angles(a1,a2,a3)



v1=a1-permute_fwd_1(a1);
v2=a2-permute_fwd_1(a2);
v3=a3-permute_fwd_1(a3);

ac1=v1-permute_fwd_1(v1);
ac2=v2-permute_fwd_1(v2);
ac3=v3-permute_fwd_1(v3);

ac1(1,1)=ac1(1,2);ac2(1,1)=ac2(1,2);ac3(1,1)=ac3(1,2);

[~,doob]=size(a1);
res=1/(doob-1);
x=0:res:1;

ind1=gt(10^(-4),abs(v1));ind2=gt(10^(-4),abs(v2));ind3=gt(10^(-4),abs(v3));

v12=ind1.*v1;v22=ind2.*v2;v32=ind3.*v3;
mod1=zeros(1,doob);mod2=zeros(1,doob);mod3=zeros(1,doob);
for ll=1:doob
    beta1=sum(normpdf(x,x(ll),abs(v12(ll))*10^(2)));beta2=sum(normpdf(x,x(ll),abs(v22(ll))*10^(2)));beta3=sum(normpdf(x,x(ll),abs(v32(ll))*10^(2)));
    if isnan(beta1)
        mod1=mod1;
    else
        mod1=mod1+sign(v12(ll))*2*10^(-6)*normpdf(x,x(ll),abs(v12(ll))*10^(4));
    end
    if isnan(beta2)
        mod2=mod2;
    else
        mod2=mod2+sign(v22(ll))*2*10^(-6)*normpdf(x,x(ll),abs(v22(ll))*10^(4));
    end
    if isnan(beta3)
        mod3=mod3;
    else
        mod3=mod3+sign(v32(ll))*2*10^(-6)*normpdf(x,x(ll),abs(v32(ll))*10^(4));
    end
    
end


a1m=awgn(a1,90,'measured');
a2m=awgn(a2,90,'measured');
a3m= awgn(a3,90,'measured');


a1m=a1m+mod1;
a2m=a2m+mod2;
a3m=a3m+mod3;



end