% Composite Cycloid X Calculations

function[sx_pos,svx,sax]=sin_x_cal(S,T,tx1,tnx2,tx3,Ty,tnx1,tnx3)
  x_start=(-S)*(tnx1-(sin(4*pi*tnx1)/(4*pi)))+(S/2);
  x_swing=S*(tnx2-(sin(2*pi*tnx2)/(2*pi)));
  x_stance=(-S)*(tnx3-(sin(2*pi*tnx3)/(2*pi)))+(S);
  sx_pos=[x_start,x_swing,x_stance];

  vx_start=(-S/Ty)*(1-cos(4*pi*tnx1)); 
  vx_swing=(S/Ty)*(1-cos(2*pi*tnx2));
  vx_stance=(-S/Ty)*(1-cos(2*pi*tnx3));
  svx=[vx_start,vx_swing,vx_stance];

  ax_start=((-4*pi*S)/(Ty^2))*(sin(4*pi*tnx1));
  ax_swing=((2*pi*S)/(Ty^2))*(sin(2*pi*tnx2));
  ax_stance=((-2*pi*S)/(Ty^2))*(sin(2*pi*tnx3));
  sax=[ax_start,ax_swing,ax_stance];

end