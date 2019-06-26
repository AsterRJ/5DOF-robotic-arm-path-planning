function [path]=generating_the_path(func,time_axis)
%preferably input a paramteric function with a given time-scale (pref with units of time aligned to either the 4ms or 12ms cycle rate of the robot) to return
%the path brick-by-brick in real time.
%if you want to deifne a pw function with a given velocity and acceleration controls on each segment,
%a small change would return the appropriate postioning for the time-scale.
[~,c]=size(time_axis);
path=zeros(1,time_axis);
for k=1:c
   path(1,k)=subs(func,time_axis(1,k)); 
end
end