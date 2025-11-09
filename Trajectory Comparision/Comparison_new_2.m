% Comparision of quintic, cubic and Half-sine ( composite cycloid)

% We require basic input to compute the trajectories in both cases, these
% are: length of footstep, height of footstep and Time duration of step

% Creating a variable S to store length of footstep
S=input('Enter the length of footstep here : ');

% Creating a variable H to store heigth of footstep
H=input('Enter the heigth of footstep here : ');

% Creating a variable T to store total time duration
T=input('Enter the total time duration of a single step : ');

% As per our assumptions
Ty=T/2;
Tr=T/2;

% Using a time function to create all required time arrays 
[X_time,tx1,tx2,tx3,tnx2,Z_time,tz1,tz2,tz3,tz4,tnz2,tnz3,tnx1,tnx3]=time_function(T,Ty);

% Cubic Curve 

% Using a function to create all X motion arrays
[cx_pos,cvx,cax]=cubic_x_cal(S,T,tx1,tx2,tx3);
% Using a function to create all Z motion arrays
[cz_pos,cvz,caz]=cubic_z_cal(H,tz2,tz3,T);

% Analysing Composite Cycloid (Half-Sine) Curve

% Using a function to create all X motion arrays
[sx_pos,svx,sax]=sin_x_cal(S,T,tx1,tnx2,tx3,Ty,tnx1,tnx3);
% Using a function to create all Z motion arrays
[sz_pos,svz,saz]=sin_z_cal(H,Ty,tnz2,tnz3);

% Quintic curve

% Using a function to create all X motion arrays
[qx_pos,qvx,qax]=quintic_x_cal(S,T,tz1,tz2,tz3,tz4);
% Using a function to create all Z motion arrays
[qz_pos,qvz,qaz]=quintic_z_cal(H,tz2,tz3,T);



disp('To analyse cubic trajectory enter : 1');
disp('To analyse half-sine trajectory enter : 2');
disp('To analyse quintic trajectory enter : 3');
i=input('Enter choice : ');

if i==1
    % Cubic Curve X motion

    % X position
    X=cx_pos;
    
    % X velocity
    xv=cvx;

    % X acceleration
    xa=cax;
    
    % Z position
    Z=cz_pos;
    
    % Z velocity
    zv=cvz;
    
    % Z acceleration
    za=caz;
    
elseif i==2
    % Composite Cycloid (Half-Sine) Curve X motion

    % X position
    X=sx_pos;
    
    % X velocity
    xv=svx;

    % X acceleration
    xa=sax;
   
    % Z position
    Z=sz_pos;
    
    % Z velocity
    zv=svz;
    
    % Z acceleration
    za=saz;
    
elseif i==3
    % Quintic Curve X motion

    % X position
    X=qx_pos;
    
    % X velocity
    xv=qvx;

    % X acceleration
    xa=qax;
    
    % Z position
    Z=qz_pos;
    
    % Z velocity
    zv=qvz;
    
    % Z acceleration
    za=qaz;
    
end

% X position
figure;
plot(X_time,X)
xlabel('Time in seconds')
ylabel('X Coordinate')
title('X vs t graph ')
grid on;

% X velocity
figure;
plot(X_time,xv)
xlabel('Time in seconds')
ylabel('X Velocity')
title('X velocity vs t graph ')
grid on;

% X acceleration
figure;
plot(X_time,xa)
xlabel('Time in seconds')
ylabel('X Acceleration ')
title('X acceleration vs t graph ')
grid on;

% Z position
figure;
plot(Z_time,Z)
xlabel('Time in seconds')
ylabel('Z Coordinate')
title('Z vs t graph ')
grid on;

% Z velocity
figure;
plot(Z_time,zv)
xlabel('Time in seconds')
ylabel('Z Velocity')
title('Z velocity vs t graph ')
grid on;

% Z acceleration
figure;
plot(Z_time,za)
xlabel('Time in seconds')
ylabel('Z Acceleration ')
title('Z acceleration vs t graph ')
grid on;

% X vs Z position
figure;
plot(X,Z)
xlabel('X coordinate')
ylabel('Z coordinate')
title('X coordinate vs Z coordinate graph ')
grid on;
