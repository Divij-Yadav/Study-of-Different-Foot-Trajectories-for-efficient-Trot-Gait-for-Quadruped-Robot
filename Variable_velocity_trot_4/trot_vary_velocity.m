function[xl1,yl1,zl1,xl2,yl2,zl2,xl3,yl3,zl3,xl4,yl4,zl4,v_leg]=trot_vary_velocity(Walking_cycles,vel_arr_x,Cycle_time,Vx_mid,Vz_mid,h,x1,y1,z1,x2,y2,z2,x3,y3,z3,x4,y4,z4)

        % Standard values to be used
        ss1=ones(1,26);
        ss=ones(1,25);
        sss=ones(1,52);
        tt=0;
        tt3=0;
        tt1=0.1;
        tt4=0.1;
        tt2=0.2;
        tt5=0.2;
        t2=linspace(0,0.1,14);
        t5=linspace(0,0.1,14);
        t3=linspace(0.1,0.2,14);
        t6=linspace(0.1,0.2,14);
        Vx=Vx_mid;
        Vz=Vz_mid;
        % Initializing motion

        % assigning values to variables used in quintic coefficient calculator
        v=vel_arr_x(1);
        V0=-v;
        S=v*Cycle_time;
        H=h;
    
        % Pair 1
    
        % LF leg (1)
        % X motion
        xl1_1=x1*sss; % stance
        xl1=[xl1_1];
        
        % Z motion
        zl1_1=z1*sss; % stance
        zl1=[zl1_1];
    
      
    
        % RH leg (4)
        % X motion
        xl4_1=x4*sss; % stance
        xl4=[xl4_1];
        
        % Z motion
        zl4_1=z4*sss; % stance
        zl4=[zl4_1];
    
      
    
        % Pair 2
    
        % RF leg (2)
        % X motion
        xl2_1=x2*ss1; % stance
        vxl2_1=0*ss1;
        [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(tt3,tt4,xl2_1(end),xl2_1(end)+(0.5*S),V0,Vx,0,0);
        xl2_2=C0+C1*(t5)+C2*(t5.^2)+C3*(t5.^3)+C4*(t5.^4)+C5*(t5.^5); % swing rise
        vxl2_2=C1+2*C2*(t5)+3*C3*(t5.^2)+4*C4*(t5.^3)+5*C5*(t5.^4);
        [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(tt4,tt5,xl2_1(end)+(0.5*S),xl2_1(end)+(S),Vx,V0,0,0);
        xl2_3=C0+C1*(t6)+C2*(t6.^2)+C3*(t6.^3)+C4*(t6.^4)+C5*(t6.^5); % swing fall
        vxl2_3=C1+2*C2*(t6)+3*C3*(t6.^2)+4*C4*(t6.^3)+5*C5*(t6.^4);
        xl2=[xl2_1,xl2_2(1,2:end),xl2_3(1,2:end)];
        v_leg=[vxl2_1,vxl2_2(1,2:end),vxl2_3(1,2:end)];
    
        % Z motion
        zl2_1=z2*ss1; % stance
        [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(tt3,tt4,z2,z2+H,0,Vz,0,0);
        zl2_2=C0+C1*(t5)+C2*(t5.^2)+C3*(t5.^3)+C4*(t5.^4)+C5*(t5.^5); % swing rise
        [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(tt4,tt5,z2+H,z2,Vz,0,0,0);
        zl2_3=C0+C1*(t6)+C2*(t6.^2)+C3*(t6.^3)+C4*(t6.^4)+C5*(t6.^5); % swing fall
        zl2=[zl2_1,zl2_2(1,2:end),zl2_3(1,2:end)];
    
      
    
        % LH leg (3)
        % X motion
        xl3_1=x3*ss1; % stance
        [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(tt3,tt4,xl3_1(end),xl3_1(end)+(0.5*S),V0,Vx,0,0);
        xl3_2=C0+C1*(t5)+C2*(t5.^2)+C3*(t5.^3)+C4*(t5.^4)+C5*(t5.^5); % swing rise
        [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(tt4,tt5,xl3_1(end)+(0.5*S),xl3_1(end)+(S),Vx,V0,0,0);
        xl3_3=C0+C1*(t6)+C2*(t6.^2)+C3*(t6.^3)+C4*(t6.^4)+C5*(t6.^5); % swing fall
        xl3=[xl3_1,xl3_2(1,2:end),xl3_3(1,2:end)];
    
        % Z motion
        zl3_1=z3*ss1; % stance
        [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(tt3,tt4,z3,z3+H,0,Vz,0,0);
        zl3_2=C0+C1*(t5)+C2*(t5.^2)+C3*(t5.^3)+C4*(t5.^4)+C5*(t5.^5); % swing rise
        [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(tt4,tt5,z3+H,z3,Vz,0,0,0);
        zl3_3=C0+C1*(t6)+C2*(t6.^2)+C3*(t6.^3)+C4*(t6.^4)+C5*(t6.^5); % swing fall
        zl3=[zl3_1,zl3_2(1,2:end),zl3_3(1,2:end)];

        % Motion for walking cycles
        local_control=Walking_cycles;
        local_control_2=1;

        z1=zl1(end);
        z2=zl2(end);
        z3=zl3(end);
        z4=zl4(end);
        x1=xl1(end);
        x2=xl2(end);
        x3=xl3(end);
        x4=xl4(end);

         
        % Using while loop
        while local_control > 0

            % assigning values to variables used in quintic coefficient calculator
            v=vel_arr_x(local_control_2);
            V0=-v;
            S=v*Cycle_time;
            H=h;
        
            % Pair 1
        
            % LF leg (1)
            % X motion
            [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(tt,tt1,xl1(end),xl1(end)+(0.5*S),V0,Vx,0,0);
            xl1_1=C0+C1*(t2)+C2*(t2.^2)+C3*(t2.^3)+C4*(t2.^4)+C5*(t2.^5); % swing rise
            [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(tt1,tt2,xl1(end)+(0.5*S),xl1(end)+(S),Vx,V0,0,0);
            xl1_2=C0+C1*(t3)+C2*(t3.^2)+C3*(t3.^3)+C4*(t3.^4)+C5*(t3.^5); % swing fall
            xl1_3=(xl1_2(end))*ss; % stance
            X1=[xl1_1,xl1_2(1,2:end),xl1_3(1,2:end)];
            
            % Z motion
            [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(tt,tt1,z1,z1+H,0,Vz,0,0);
            zl1_1=C0+C1*(t2)+C2*(t2.^2)+C3*(t2.^3)+C4*(t2.^4)+C5*(t2.^5); % swing rise
            [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(tt1,tt2,z1+H,z1,Vz,0,0,0);
            zl1_2=C0+C1*(t3)+C2*(t3.^2)+C3*(t3.^3)+C4*(t3.^4)+C5*(t3.^5); % swing fall
            zl1_3=(zl1_2(end))*ss; % stance
            Z1=[zl1_1,zl1_2(1,2:end),zl1_3(1,2:end)];
        
          
        
            % RH leg (4)
            % X motion
            [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(tt,tt1,xl4(end),xl4(end)+(0.5*S),V0,Vx,0,0);
            xl4_1=C0+C1*(t2)+C2*(t2.^2)+C3*(t2.^3)+C4*(t2.^4)+C5*(t2.^5); % swing rise
            [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(tt1,tt2,xl4(end)+(0.5*S),xl4(end)+(S),Vx,V0,0,0);
            xl4_2=C0+C1*(t3)+C2*(t3.^2)+C3*(t3.^3)+C4*(t3.^4)+C5*(t3.^5); % swing fall
            xl4_3=(xl4_2(end))*ss; % stance
            X4=[xl4_1,xl4_2(1,2:end),xl4_3(1,2:end)];
            
            % Z motion
            [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(tt,tt1,z4,z4+H,0,Vz,0,0);
            zl4_1=C0+C1*(t2)+C2*(t2.^2)+C3*(t2.^3)+C4*(t2.^4)+C5*(t2.^5); % swing rise
            [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(tt1,tt2,z4+H,z4,Vz,0,0,0);
            zl4_2=C0+C1*(t3)+C2*(t3.^2)+C3*(t3.^3)+C4*(t3.^4)+C5*(t3.^5); % swing fall
            zl4_3=(zl4_2(end))*ss; % stance
            Z4=[zl4_1,zl4_2(1,2:end),zl4_3(1,2:end)];
        
          
        
            % Pair 2
        
            % RF leg (2)
            % X motion
            xl2_1=x2*ss; % stance
            vxl2_1=0*ss;
            [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(tt3,tt4,xl2_1(end),xl2_1(end)+(0.5*S),V0,Vx,0,0);
            xl2_2=C0+C1*(t5)+C2*(t5.^2)+C3*(t5.^3)+C4*(t5.^4)+C5*(t5.^5); % swing rise
            vxl2_2=C1+2*C2*(t5)+3*C3*(t5.^2)+4*C4*(t5.^3)+5*C5*(t5.^4);
            [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(tt4,tt5,xl2_1(end)+(0.5*S),xl2_1(end)+(S),Vx,V0,0,0);
            xl2_3=C0+C1*(t6)+C2*(t6.^2)+C3*(t6.^3)+C4*(t6.^4)+C5*(t6.^5); % swing fall
            vxl2_3=C1+2*C2*(t6)+3*C3*(t6.^2)+4*C4*(t6.^3)+5*C5*(t6.^4);
            X2=[xl2_1,xl2_2(1,2:end),xl2_3(1,2:end)];
            vX2=[vxl2_1,vxl2_2(1,2:end),vxl2_3(1,2:end)];
        
            % Z motion
            zl2_1=z2*ss; % stance
            [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(tt3,tt4,z2,z2+H,0,Vz,0,0);
            zl2_2=C0+C1*(t5)+C2*(t5.^2)+C3*(t5.^3)+C4*(t5.^4)+C5*(t5.^5); % swing rise
            [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(tt4,tt5,z2+H,z2,Vz,0,0,0);
            zl2_3=C0+C1*(t6)+C2*(t6.^2)+C3*(t6.^3)+C4*(t6.^4)+C5*(t6.^5); % swing fall
            Z2=[zl2_1,zl2_2(1,2:end),zl2_3(1,2:end)];
        
          
        
            % LH leg (3)
            % X motion
            xl3_1=x3*ss; % stance
            [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(tt3,tt4,xl3_1(end),xl3_1(end)+(0.5*S),V0,Vx,0,0);
            xl3_2=C0+C1*(t5)+C2*(t5.^2)+C3*(t5.^3)+C4*(t5.^4)+C5*(t5.^5); % swing rise
            [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(tt4,tt5,xl3_1(end)+(0.5*S),xl3_1(end)+(S),Vx,V0,0,0);
            xl3_3=C0+C1*(t6)+C2*(t6.^2)+C3*(t6.^3)+C4*(t6.^4)+C5*(t6.^5); % swing fall
            X3=[xl3_1,xl3_2(1,2:end),xl3_3(1,2:end)];
        
            % Z motion
            zl3_1=z3*ss; % stance
            [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(tt3,tt4,z3,z3+H,0,Vz,0,0);
            zl3_2=C0+C1*(t5)+C2*(t5.^2)+C3*(t5.^3)+C4*(t5.^4)+C5*(t5.^5); % swing rise
            [C0,C1,C2,C3,C4,C5]=Quintic_Coefficient_calculator(tt4,tt5,z3+H,z3,Vz,0,0,0);
            zl3_3=C0+C1*(t6)+C2*(t6.^2)+C3*(t6.^3)+C4*(t6.^4)+C5*(t6.^5); % swing fall
            Z3=[zl3_1,zl3_2(1,2:end),zl3_3(1,2:end)];

            

            % Updating values
            xl1=[xl1,X1(1,2:end)];
            xl2=[xl2,X2(1,2:end)];
            xl3=[xl3,X3(1,2:end)];
            xl4=[xl4,X4(1,2:end)];
            zl1=[zl1,Z1(1,2:end)];
            zl2=[zl2,Z2(1,2:end)];
            zl3=[zl3,Z3(1,2:end)];
            zl4=[zl4,Z4(1,2:end)];
            v_leg=[v_leg,vX2(1,2:end)];

            z1=zl1(end);
            z2=zl2(end);
            z3=zl3(end);
            z4=zl4(end);
            x1=xl1(end);
            x2=xl2(end);
            x3=xl3(end);
            x4=xl4(end);
                 
            % Change in control values
            local_control_2=local_control_2+1;
            local_control=local_control-1;

        end

        pa=length(xl1);
        yl1=y1*ones(1,pa);
        yl2=y2*ones(1,pa);
        yl3=y3*ones(1,pa);
        yl4=y4*ones(1,pa);

    
end