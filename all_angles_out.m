function [t1,t2,t3,t4,t5]=all_angles_out(pos,res,l1,l2,b,wrist2flange_length,yay_or_nay,normals)

if yay_or_nay==1
    [pos_sphere]=sphere_generation_1st2DOF(pos,wrist2flange_length);
    alp=0:res:2*pi;bet=0:res:2*pi;
    [gam]=size(alp);

    vec_f2w=zeros(3,gam);vec_e2w=zeros(3,gam);
    for l=1:gam
        pos_s=subs(pos_sphere,{alpha,beta},{alp,bet});
        vec_f2w(:,l)=pos-pos_s;
    end
end

if yay_or_nay==0
    [pos_s]=wrist_by_normal(path,normal,wrist2flange_length);
    vec_w2f=normals*wrist2flange_length;
end

[~,~,~,~,t1,t2,t3]=angles_out(pos_s,b,l1,l2);
[xe,ze,~,~,x,y,z]=forwardkin_first3DOF(t1,t2,t3,b,l1,l2);
for l=1:gam
   pos_elbow=[cos(t1(l)) sin(t1(l)) 0;-sin(t1(l)) cos(t1(l)) 0;0 0 1]*[xe+b;0;ze];
   vec_e2w(:,l)=[x;y;z]-pos_elbow;
end
[t5,t4]=last2angles(t1,vec_e2w,vec_w2f);
end