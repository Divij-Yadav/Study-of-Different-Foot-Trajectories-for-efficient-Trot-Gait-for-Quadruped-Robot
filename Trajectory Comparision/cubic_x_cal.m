% Cubic X Calculations

function[cx_pos,cvx,cax]=cubic_x_cal(S,T,tx1,tx2,tx3)
  x_start=(S/2)-((2*S)/T)*tx1;
  x_swing=(((-2*S)/T)*tx2)+(((24*S)/(T^2))*(tx2.^2))+(((-32*S)/(T^3))*(tx2.^3));
  x_stance=(S)-((2*S)/T)*tx3;
  cx_pos=[x_start,x_swing,x_stance];

  vx_start=((-2*S)/T)*ones(1,50);
  vx_swing=((-2*S)/T)+(((48*S)/(T^2))*(tx2))+(((-96*S)/(T^3))*(tx2.^2));
  vx_stance=((-2*S)/T)*ones(1,100);
  cvx=[vx_start,vx_swing,vx_stance];

  ax_start=0*ones(1,50);
  ax_swing=((48*S)/(T^2))+(((-192*S)/(T^3))*(tx2));
  ax_stance=0*ones(1,100);
  cax=[ax_start,ax_swing,ax_stance];

end