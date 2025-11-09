function[x_torso,y_torso,z_torso,v_torso,graph_time]=torso_motion(Cycle_time,Walking_cycles,x,y,z,vel_arr_x)
        
         % Initialization motion
         v_ini=vel_arr_x(1);
         v_ini_graph_1=v_ini*ones(1,26);

         % Torso moving
         graph_time_1=linspace(0,0.2,26);

         y_ini_1=y*ones(1,26);
         z_ini_1=z*ones(1,26);
         x_ini_1=x+v_ini*graph_time_1;

         % Torso still
         graph_time_2=linspace(0.2,0.4,25);
         v_ini_graph_2=0*ones(1,25);
         y_ini_2=y_ini_1(end)*ones(1,25);
         z_ini_2=z_ini_1(end)*ones(1,25);
         x_ini_2=x_ini_1(end)*ones(1,25);

         % compiling initialization data
         graph_time=[graph_time_1,graph_time_2(1,2:end)];
         x_torso=[x_ini_1,x_ini_2(1,2:end)];
         y_torso=[y_ini_1,y_ini_2(1,2:end)];
         z_torso=[z_ini_1,z_ini_2(1,2:end)];
         v_torso=[v_ini_graph_1,v_ini_graph_2(1,2:end)];

         % Motion for walking cycles
         local_control=Walking_cycles;
         local_control_2=1;
         
         % Using while loop
         while local_control > 0
             % no change in y and z coordinate during motion
             y_torso_cycle=y_torso(end)*ones(1,52);
             z_torso_cycle=z_torso(end)*ones(1,52);
             % Time for motion
             graph_time_cycle=linspace(graph_time(end),graph_time(end)+0.4,52);
             local_time_cycle=linspace(0,0.4,52);
             % motion for x direction
             v_torso_cycle=vel_arr_x(local_control_2);
             v_torso_cycle_graph=v_torso_cycle*ones(1,52);
             x_torso_cycle=x_torso(end)+v_torso_cycle*local_time_cycle;
             % updating cycle values
             graph_time=[graph_time,graph_time_cycle(1,2:end)];
             x_torso=[x_torso,x_torso_cycle(1,2:end)];
             y_torso=[y_torso,y_torso_cycle(1,2:end)];
             z_torso=[z_torso,z_torso_cycle(1,2:end)];
             v_torso=[v_torso,v_torso_cycle_graph(1,2:end)];
             % Change in control values
             local_control_2=local_control_2+1;
             local_control=local_control-1;

         end


end