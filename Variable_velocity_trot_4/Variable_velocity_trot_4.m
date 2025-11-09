% Variable_velocity_trot_4

tic;

Cycle_time=0.4;
Walking_cycles=2;

h=0.24;
Vx_mid=0.4;
Vz_mid=0.06;

% Torso initial
x=0;
y=0;
z=0;


% Entering the dimensions of the quadruped
A=0.505; % length of quadruped
B=0.36;  % breadth of quadruped
c=-0.4;  % heigth of quadruped

a=A/2; % reduction for simplicity
b=B/2; % reduction for simplicity

% Leg 1: LF
% Leg 2: RF
% Leg 3: LH
% Leg 4: RH

% Initializing the leg coordinates

x1=x+a;
x2=x+a;
x3=x-a;
x4=x-a;
y1=y+b;
y2=y-b;
y3=y+b;
y4=y-b;
z1=z-0.4;
z2=z-0.4;
z3=z-0.4;
z4=z-0.4;

% creating empty arrays to store velocity values
vel_arr_x=[];

% creating control variable for the while loop
control_1=Walking_cycles;

% creating a local variable to count cycles
loc_var_1=1;

while control_1>0
fprintf('For walking cycle %d\n', loc_var_1);

%creating variable to take x velocity input for x velocity array elements
vel_in_x=input('Please enter the required X velocity at start of the cycle : ');
% adding element to array
vel_arr_x=[vel_arr_x vel_in_x];

loc_var_1=loc_var_1+1;
control_1=control_1-1;
end

% Torso coordinates
[x_torso,y_torso,z_torso,v_torso,graph_time]=torso_motion(Cycle_time,Walking_cycles,x,y,z,vel_arr_x);

% Leg coordinates
[xl1,yl1,zl1,xl2,yl2,zl2,xl3,yl3,zl3,xl4,yl4,zl4,v_leg]=trot_vary_velocity(Walking_cycles,vel_arr_x,Cycle_time,Vx_mid,Vz_mid,h,x1,y1,z1,x2,y2,z2,x3,y3,z3,x4,y4,z4);

j=length(xl1);
i=1;
    
while i<j
    grid on;
    hold on;
    pause(0.00000002);
    plot3(x_torso(i),y_torso(i),z_torso(i),'.','Color','black'); % Plotting torso
    xlabel('X coordinate (m)'); 
    ylabel('Y coordinate (m)');
    zlabel('Z coordinate (m)');
    title('Trot Gait with varying velocity');
    plot3(xl1(i),yl1(i),zl1(i),'.','Color','blue'); % Plotting leg 1
    plot3(xl2(i),yl2(i),zl2(i),'.','Color','red'); % Plotting leg 2
    plot3(xl3(i),yl3(i),zl3(i),'.','Color','green'); % Plotting leg 3
    plot3(xl4(i),yl4(i),zl4(i),'.','Color','magenta'); % Plotting leg 4
    legend('Torso','LF', 'RF', 'LH','RH');
    view(3);
    i=i+1;
    hold off;
end

figure;
plot(graph_time,v_torso);
grid on;
xlabel('Time (seconds)');
ylabel('Torso X Velocity (m/s)');
title('Variation of Torso Velocity for walking cycles');

figure;
plot(graph_time,v_leg);
grid on;
xlabel('Time (seconds)');
ylabel('Leg X Velocity (m/s)');
title('Variation of Leg Velocity for walking cycles');


toc;