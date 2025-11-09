% Trot Gait

CC=input('Enter the number of walking cycles :');
C=CC;

% Taking input values to get the initial coordinates of the robots torso
disp('Enter all coordinates in meters ')
x=input('Enter the x coordinate of the torso : ');
y=input('Enter the y coordinate of the torso : ');
z=input('Enter the z coordinate of the torso : ');

% Entering the dimensions of the quadruped
A=0.505; % length of quadruped
B=0.36;  % breadth of quadruped
c=-0.4;  % heigth of quadruped

a=A/2;
b=B/2;

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
CCCC=0;

% Taking input values required for Gait generation
D=input('Enter the value of the Duty factor :');
%D=0.5;
H=input('Enter the absolute max heigth the foot rises to during swing motion: ');
Vx=input('Enter the value of velocity in x direction in the middle of swing : ');
%Vx=0;
Vz=input('Enter the value of velocity in z direction in the middle of swing : ');
%Vz=0;
S=0.1; % stride length of each foot

T=0.5; % absolute time duration of motion of each pair in trot gait

while CC>0
    
    % Giving output based on duty factor
    if D == 0.5
        % Return Balanced Trot
        [X1,X2,X3,X4,Z1,Z2,Z3,Z4,Y1,Y2,Y3,Y4]=Balanced_trot(S,T,x1,x2,x3,x4,z1,z2,z3,z4,y1,y2,y3,y4,C,CC,Vx,Vz,H);
        title('Balanced Trot Gait');
    else
        % Return Slow Trot
        [X1,X2,X3,X4,Z1,Z2,Z3,Z4,Y1,Y2,Y3,Y4]=Slow_trot(S,T,x1,x2,x3,x4,z1,z2,z3,z4,y1,y2,y3,y4,C,CC,Vx,Vz,H,D);
        title('Slow Trot Gait');
    end
    
    

    % Plotting output graph
    
    i=1;
    % j is length of array
    j=160;
    while i<=j
        grid on;
        hold on;
        pause(0.00000002);
        plot3(X1(i),Y1(i),Z1(i),'.','Color','blue'); % Plotting leg 1
        xlabel('X coordinate'); 
        ylabel('Y coordinate');
        zlabel('Z coordinate');
        %title('Trot Gait');
        plot3(X2(i),Y2(i),Z2(i),'.','Color','red'); % Plotting leg 2
        plot3(X3(i),Y3(i),Z3(i),'.','Color','green'); % Plotting leg 3
        plot3(X4(i),Y4(i),Z4(i),'.','Color','magenta'); % Plotting leg 4
        legend('LF', 'RH', 'RF','LH');
        view(3);
        i=i+1;
    end
    
    
    if CCCC==0
        x=x+(S/2);
    else
        x1=x1+(S/2);
        x2=x2+(S/2);
        x3=x3+(S/2);
        x4=x4+(S/2);
    end
    CCCC=CCCC+1;
    
    CC=CC-1;
end

