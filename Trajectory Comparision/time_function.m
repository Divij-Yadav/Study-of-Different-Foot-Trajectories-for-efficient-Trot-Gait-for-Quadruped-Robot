function[X_time,tx1,tx2,tx3,tnx2,Z_time,tz1,tz2,tz3,tz4,tnz2,tnz3,tnx1,tnx3]=time_function(T,Ty)
  % Time arrays to be used in X calculations
  tx_1=linspace(0,T/4,50);
  tx_2=linspace(T/4,(3*T)/4,100);
  tx_3=linspace((3*T)/4,(5*T)/4,100);
  X_time=[tx_1,tx_2,tx_3]; % Time array to be plotted

  tx1=linspace(0,T/4,50);
  tx2=linspace(0,T/2,100);
  tx3=linspace(0,T/2,100);
  tnx1=tx1/Ty;
  tnx2=tx2/Ty;
  tnx3=tx3/Ty;

  % Time arrays to be used in Z calculations
  tz_1=linspace(0,T/4,50);
  tz_2=linspace(T/4,T/2,50);
  tz_3=linspace(T/2,(3*T)/4,50);
  tz_4=linspace((3*T)/4,(5*T)/4,100);
  Z_time=[tz_1,tz_2,tz_3,tz_4]; % Time array to be plotted

  tz1=linspace(0,T/4,50);
  tz2=linspace(0,T/4,50);
  tz3=linspace(0,T/4,50);
  tz4=linspace(0,T/2,100);

  tnz2=tz2/Ty;
  tnz3=tz3/Ty;
end