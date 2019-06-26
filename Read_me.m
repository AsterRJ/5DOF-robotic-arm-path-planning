%%%%%%%%%%%%%READ ME%%%%%%%%%%%%%%%
%for each point in space, this calculates firstly the wrist-sphere around
%the point, then for each of those points (specified by the angular
%reoslution of the model) it takes ech point on the sphere to a projection
%along a1=0 and thn finds the resultant angles through intersecting
%circles.
%i would like to time it as it is not a method that relies on
%Newton_raphson at all
%If a normal vec is specified at each, then this can be easily modified for a full
%path and returns < 2 configs for each point on the path.
%This can be used to build a probabilistic model for the error progagated
%along the angular path of the arm, or predict what the given error will be with a give movement.


pos=; %the point of interest
res=; %the angular resolution of the target spherical space
l1=; %first arm length 
l2=; %blah
b=; %base horizontal distance- not vertical since I am fundamentally lazy
wrist2flange_length=; %says it all on the tin
normals=[];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%DIVYING UP%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%for calculating the angular positions that can reach a single point;
[t1,t2,t3,t4,t5]=all_angles_out(pos,res,l1,l2,b,wrist2flange_length,1,[]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%for calculating the path with a given normal vector at each point, where
%the Flange 2 Wrist orientation (ignoring angle 6) is determined by the normal vector

[tt1,tt2,tt3,tt4,tt5]=all_angles_out(pos,res,l1,l2,b,wrist2flange_length,0,normals);








