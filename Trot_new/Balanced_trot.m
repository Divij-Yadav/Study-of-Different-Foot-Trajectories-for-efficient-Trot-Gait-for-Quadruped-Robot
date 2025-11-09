% When duty factor is 0.5

function[X1,X2,X3,X4,Z1,Z2,Z3,Z4,Y1,Y2,Y3,Y4]=Balanced_trot(S,T,x1,x2,x3,x4,z1,z2,z3,z4,y1,y2,y3,y4,C,CC,Vx,Vz,H)
    % V=(5*S)/T;
    V0=(-5*S)/T;
    ttt=ones(1,160);
    Y1=y1*ttt;
    Y2=y2*ttt;
    Y3=y3*ttt;
    Y4=y4*ttt;
    if CC==C
          tt=ones(1,80); % still phase
          t1=linspace(0,0.1*T,20); % start phase
          t2=linspace(0.1*T,0.2*T,20); % swing rise
          t3=linspace(0.2*T,0.3*T,20); % swing fall
          t4=linspace(0,0.2*T,20); % stance phase

          % Pair 1

          % LF leg (1)
          xl1_1=x1+V0*t1; % start
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0.1*T,0.2*T,xl1_1(end),xl1_1(end)+(0.5*S),V0,Vx,0,0);
          xl1_2=C0+C1*(t2)+C2*(t2.^2)+C3*(t2.^3)+C4*(t2.^4)+C5*(t2.^5); % swing rise
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0.2*T,0.3*T,xl1_1(end)+(0.5*S),xl1_1(end)+(S),Vx,V0,0,0);
          xl1_3=C0+C1*(t3)+C2*(t3.^2)+C3*(t3.^3)+C4*(t3.^4)+C5*(t3.^5); % swing fall
          xl1_4=(xl1_3(end))+V0*t4; % stance
          xl1_5=(xl1_4(end))*tt; % still
          X1=[xl1_1,xl1_2,xl1_3,xl1_4,xl1_5];

          zl1_1=z1*ones(1,20); % start
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0.1*T,0.2*T,z1,z1+H,0,Vz,0,0);
          zl1_2=C0+C1*(t2)+C2*(t2.^2)+C3*(t2.^3)+C4*(t2.^4)+C5*(t2.^5); % swing rise
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0.2*T,0.3*T,z1+H,z1,Vz,0,0,0);
          zl1_3=C0+C1*(t3)+C2*(t3.^2)+C3*(t3.^3)+C4*(t3.^4)+C5*(t3.^5); % swing fall
          zl1_4=(zl1_3(end))*ones(1,20); % stance
          zl1_5=(zl1_4(end))*tt; % still
          Z1=[zl1_1,zl1_2,zl1_3,zl1_4,zl1_5];

          

          % RH leg (4)
          xl4_1=x4+V0*t1; % start
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0.1*T,0.2*T,xl4_1(end),xl4_1(end)+(0.5*S),V0,Vx,0,0);
          xl4_2=C0+C1*(t2)+C2*(t2.^2)+C3*(t2.^3)+C4*(t2.^4)+C5*(t2.^5); % swing rise
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0.2*T,0.3*T,xl4_1(end)+(0.5*S),xl4_1(end)+(S),Vx,V0,0,0);
          xl4_3=C0+C1*(t3)+C2*(t3.^2)+C3*(t3.^3)+C4*(t3.^4)+C5*(t3.^5); % swing fall
          xl4_4=(xl4_3(end))+V0*t4; % stance
          xl4_5=(xl4_4(end))*tt; % still
          X4=[xl4_1,xl4_2,xl4_3,xl4_4,xl4_5];


          zl4_1=z4*ones(1,20); % start
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0.1*T,0.2*T,z4,z4+H,0,Vz,0,0);
          zl4_2=C0+C1*(t2)+C2*(t2.^2)+C3*(t2.^3)+C4*(t2.^4)+C5*(t2.^5); % swing rise
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0.2*T,0.3*T,z4+H,z4,Vz,0,0,0);
          zl4_3=C0+C1*(t3)+C2*(t3.^2)+C3*(t3.^3)+C4*(t3.^4)+C5*(t3.^5); % swing fall
          zl4_4=(zl4_3(end))*ones(1,20); % stance
          zl4_5=(zl4_4(end))*tt; % still
          Z4=[zl4_1,zl4_2,zl4_3,zl4_4,zl4_5];

          
        
          % Pair 2

          % RF leg (2)
          xl2_1=x2*tt; % still
          xl2_2=x2+V0*t1; % start
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0.1*T,0.2*T,xl2_2(end),xl2_2(end)+(0.5*S),V0,Vx,0,0);
          xl2_3=C0+C1*(t2)+C2*(t2.^2)+C3*(t2.^3)+C4*(t2.^4)+C5*(t2.^5); % swing rise
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0.2*T,0.3*T,xl2_2(end)+(0.5*S),xl2_2(end)+(S),Vx,V0,0,0);
          xl2_4=C0+C1*(t3)+C2*(t3.^2)+C3*(t3.^3)+C4*(t3.^4)+C5*(t3.^5); % swing fall
          xl2_5=(xl2_4(end))+V0*t4; % stance
          X2=[xl2_1,xl2_2,xl2_3,xl2_4,xl2_5];

          zl2_1=z2*tt; % still
          zl2_2=(zl2_1(end))*ones(1,20); % start
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0.1*T,0.2*T,z2,z2+H,0,Vz,0,0);
          zl2_3=C0+C1*(t2)+C2*(t2.^2)+C3*(t2.^3)+C4*(t2.^4)+C5*(t2.^5); % swing rise
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0.2*T,0.3*T,z2+H,z2,Vz,0,0,0);
          zl2_4=C0+C1*(t3)+C2*(t3.^2)+C3*(t3.^3)+C4*(t3.^4)+C5*(t3.^5); % swing fall
          zl2_5=(zl2_4(end))*ones(1,20); % stance
          Z2=[zl2_1,zl2_2,zl2_3,zl2_4,zl2_5];

          

          % LH leg (3)
          xl3_1=x3*tt; % still
          xl3_2=x3+V0*t1; % start
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0.1*T,0.2*T,xl3_2(end),xl3_2(end)+(0.5*S),V0,Vx,0,0);
          xl3_3=C0+C1*(t2)+C2*(t2.^2)+C3*(t2.^3)+C4*(t2.^4)+C5*(t2.^5); % swing rise
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0.2*T,0.3*T,xl3_2(end)+(0.5*S),xl3_2(end)+(S),Vx,V0,0,0);
          xl3_4=C0+C1*(t3)+C2*(t3.^2)+C3*(t3.^3)+C4*(t3.^4)+C5*(t3.^5); % swing fall
          xl3_5=(xl3_4(end))+V0*t4; % stance
          X3=[xl3_1,xl3_2,xl3_3,xl3_4,xl3_5];


          zl3_1=z3*tt; % still
          zl3_2=(zl3_1(end))*ones(1,20); % start
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0.1*T,0.2*T,z3,z3+H,0,Vz,0,0);
          zl3_3=C0+C1*(t2)+C2*(t2.^2)+C3*(t2.^3)+C4*(t2.^4)+C5*(t2.^5); % swing rise
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0.2*T,0.3*T,z3+H,z3,Vz,0,0,0);
          zl3_4=C0+C1*(t3)+C2*(t3.^2)+C3*(t3.^3)+C4*(t3.^4)+C5*(t3.^5); % swing fall
          zl3_5=(zl3_4(end))*ones(1,20); % stance
          Z3=[zl3_1,zl3_2,zl3_3,zl3_4,zl3_5];

        

    else
          
          tt=ones(1,80); % still phase
          t5=linspace(0,0.15*T,30); % swing rise
          t6=linspace(0.15*T,0.3*T,30); % swing fall
          t7=linspace(0,0.2*T,20); % stance phase

          % Pair 1

          % LF leg (1)
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0,0.15*T,x1,x1+(0.5*S),0,Vx,0,0);
          xl1_1=C0+C1*(t5)+C2*(t5.^2)+C3*(t5.^3)+C4*(t5.^4)+C5*(t5.^5); % swing rise
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0.15*T,0.3*T,x1+(0.5*S),x1+(S),Vx,V0,0,0);
          xl1_2=C0+C1*(t6)+C2*(t6.^2)+C3*(t6.^3)+C4*(t6.^4)+C5*(t6.^5); % swing fall
          xl1_3=(xl1_2(end))+V0*t7; % stance
          xl1_4=(xl1_3(end))*tt; % still
          X1=[xl1_1,xl1_2,xl1_3,xl1_4];

          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0,0.15*T,z1,z1+H,0,Vz,0,0);
          zl1_1=C0+C1*(t5)+C2*(t5.^2)+C3*(t5.^3)+C4*(t5.^4)+C5*(t5.^5); % swing rise
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0.15*T,0.3*T,z1+H,z1,Vz,0,0,0);
          zl1_2=C0+C1*(t6)+C2*(t6.^2)+C3*(t6.^3)+C4*(t6.^4)+C5*(t6.^5); % swing fall
          zl1_3=(zl1_2(end))*ones(1,20); % stance
          zl1_4=(zl1_3(end))*tt; % still
          Z1=[zl1_1,zl1_2,zl1_3,zl1_4];

          % RH leg (4)
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0,0.15*T,x4,x4+(0.5*S),0,Vx,0,0);
          xl4_1=C0+C1*(t5)+C2*(t5.^2)+C3*(t5.^3)+C4*(t5.^4)+C5*(t5.^5); % swing rise
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0.15*T,0.3*T,x4+(0.5*S),x4+(S),Vx,V0,0,0);
          xl4_2=C0+C1*(t6)+C2*(t6.^2)+C3*(t6.^3)+C4*(t6.^4)+C5*(t6.^5); % swing fall
          xl4_3=(xl4_2(end))+V0*t7; % stance
          xl4_4=(xl4_3(end))*tt; % still
          X4=[xl4_1,xl4_2,xl4_3,xl4_4];

          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0,0.15*T,z4,z4+H,0,Vz,0,0);
          zl4_1=C0+C1*(t5)+C2*(t5.^2)+C3*(t5.^3)+C4*(t5.^4)+C5*(t5.^5); % swing rise
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0.15*T,0.3*T,z4+H,z4,Vz,0,0,0);
          zl4_2=C0+C1*(t6)+C2*(t6.^2)+C3*(t6.^3)+C4*(t6.^4)+C5*(t6.^5); % swing fall
          zl4_3=(zl4_2(end))*ones(1,20); % stance
          zl4_4=(zl4_3(end))*tt; % still
          Z4=[zl4_1,zl4_2,zl4_3,zl4_4];
        
          % Pair 2

          % RF leg (2)
          xl2_1=x2*tt; % still
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0,0.15*T,x2,x2+(0.5*S),0,Vx,0,0);
          xl2_2=C0+C1*(t5)+C2*(t5.^2)+C3*(t5.^3)+C4*(t5.^4)+C5*(t5.^5); % swing rise
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0.15*T,0.3*T,x2+(0.5*S),x2+(S),Vx,V0,0,0);
          xl2_3=C0+C1*(t6)+C2*(t6.^2)+C3*(t6.^3)+C4*(t6.^4)+C5*(t6.^5); % swing fall
          xl2_4=(xl2_3(end))+V0*t7; % stance
          X2=[xl2_1,xl2_2,xl2_3,xl2_4];
          
          zl2_1=z2*tt; % still
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0,0.15*T,z2,z2+H,0,Vz,0,0);
          zl2_2=C0+C1*(t5)+C2*(t5.^2)+C3*(t5.^3)+C4*(t5.^4)+C5*(t5.^5); % swing rise
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0.15*T,0.3*T,z2+H,z2,Vz,0,0,0);
          zl2_3=C0+C1*(t6)+C2*(t6.^2)+C3*(t6.^3)+C4*(t6.^4)+C5*(t6.^5); % swing fall
          zl2_4=(zl2_3(end))*ones(1,20); % stance
          Z2=[zl2_1,zl2_2,zl2_3,zl2_4];

          % LH leg (3)
          xl3_1=x3*tt; % still
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0,0.15*T,x3,x3+(0.5*S),0,Vx,0,0);
          xl3_2=C0+C1*(t5)+C2*(t5.^2)+C3*(t5.^3)+C4*(t5.^4)+C5*(t5.^5); % swing rise
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0.15*T,0.3*T,x3+(0.5*S),x3+(S),Vx,V0,0,0);
          xl3_3=C0+C1*(t6)+C2*(t6.^2)+C3*(t6.^3)+C4*(t6.^4)+C5*(t6.^5); % swing fall
          xl3_4=(xl3_3(end))+V0*t7; % stance
          X3=[xl3_1,xl3_2,xl3_3,xl3_4];

          zl3_1=z3*tt; % still
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0,0.15*T,z3,z3+H,0,Vz,0,0);
          zl3_2=C0+C1*(t5)+C2*(t5.^2)+C3*(t5.^3)+C4*(t5.^4)+C5*(t5.^5); % swing rise
          [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(0.15*T,0.3*T,z3+H,z3,Vz,0,0,0);
          zl3_3=C0+C1*(t6)+C2*(t6.^2)+C3*(t6.^3)+C4*(t6.^4)+C5*(t6.^5); % swing fall
          zl3_4=(zl3_3(end))*ones(1,20); % stance
          Z3=[zl3_1,zl3_2,zl3_3,zl3_4];

    end

end