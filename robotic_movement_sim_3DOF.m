%the model I've built doesn't really take into account the height
%difference between RobRoot and the first axis- whoops! but the base length
%is the x-y distance between RobRoot and joint 2. first and second arms are
%the arm segments. 
%The time axis data cn be used to define piecewise functions and for continuous single-motions. 
%It should be simple to build in acceleration and velocity control ramps for a future model. 
%The applied signal noise is using awgn with a pre-defined SNR and a gaussian
%error-spike with a slight delay (that i will experimentally determine)
%that is based on zero-speed points in the joint-axis.
%RobRoot is defined as (x,y,z)=0.


base_length=;
first_arm_length=;
second_arm_length=;
time_axis=;
parametric_function=;



[path]=generating_the_path(parametric_function,time_axis);
[xx,yy,zz,x_hat,a1,a2,a3]=angles_out(path,base_length,first_arm_length,second_arm_length);
[x_elbow,z_elbow,x_az,z_az,x_o,y_o,z_o]=forwardkin_first3DOF(a1,a2,a3,base_length,first_arm_length,second_arm_length);
[a1m,a2m,a3m]=modded_angles(a1,a2,a3);

[~,~,~,~,x_m,y_m,z_m]=forwardkin_first3DOF(a1m,a2m,a3m,base_length,first_arm_length,second_arm_length);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%ORIGINAL COORDS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot(time_axis,a1)
hold on
plot(time_axis,a2)
hold on
plot(time_axis,a3)
hold off
title('original angles')
xlabel('time')
ylabel('angle')
legend('a1','a2','a3')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%MODDED COORDS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot(time_axis,a1m)
hold on
plot(time_axis,a2m)
hold on
plot(time_axis,a3m)
hold off
title('modified angles')
xlabel('time')
ylabel('angle')
legend('a1','a2','a3')

plot3(x_m,y_m,z_m)
hold on
plot3(x_o,y_o,z_o)
hold off
title('cartesian')
legend('white noise modified','original')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ABSOLUTE POSITIONAL ERROR%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
q=(abs(x_m-x_o).^2+abs(y_m-y_o).^2+abs(z_m-z_o).^2).^0.5;
plot(x_axis,q)
hold off
title('positional error against time')
ylabel('Absolute error mm')
xlabel('time')




