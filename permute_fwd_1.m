function [li]=permute_fwd_1(liszt)
[r,k]=size(liszt);
li=zeros(r,k);

for l=2:k
    li(:,l)=liszt(:,l-1);
end
li(:,1)=liszt(:,k);

end