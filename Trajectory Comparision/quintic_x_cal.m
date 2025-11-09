% Quintic X Calculations

function[qx_pos,qvx,qax]=quintic_x_cal(S,T,tz1,tz2,tz3,tz4)

  x_start=(S/2)-((2*S)/T)*tz1;
  C0=0; C1=(-2*S)/T; C2=0; C3=(512*S)/(T^3); C4=(-2944*S)/(T^4); C5=(4608*S)/(T^5);
  x_swing1=C0+C1*(tz2)+C2*(tz2.^2)+C3*(tz2.^3)+C4*(tz2.^4)+C5*(tz2.^5);
  C0=S/2; C1=0; C2=0; C3=(448*S)/(T^3); C4=(-2816*S)/(T^4); C5=(4608*S)/(T^5);
  x_swing2=C0+C1*(tz3)+C2*(tz3.^2)+C3*(tz3.^3)+C4*(tz3.^4)+C5*(tz3.^5);
  x_stance=(S)-((2*S)/T)*tz4;
  qx_pos=[x_start,x_swing1,x_swing2,x_stance];

  vx_start=((-2*S)/T)*ones(1,50);
  C0=0; C1=(-2*S)/T; C2=0; C3=(512*S)/(T^3); C4=(-2944*S)/(T^4); C5=(4608*S)/(T^5);
  vx_swing1=C1+2*C2*(tz2)+3*C3*(tz2.^2)+4*C4*(tz2.^3)+5*C5*(tz2.^4);
  C0=S/2; C1=0; C2=0; C3=(448*S)/(T^3); C4=(-2816*S)/(T^4); C5=(4608*S)/(T^5)
  vx_swing2=C1+2*C2*(tz3)+3*C3*(tz3.^2)+4*C4*(tz3.^3)+5*C5*(tz3.^4);
  vx_stance=((-2*S)/T)*ones(1,100);
  qvx=[vx_start,vx_swing1,vx_swing2,vx_stance];

  ax_start=0*ones(1,50);
  C0=0; C1=(-2*S)/T; C2=0; C3=(512*S)/(T^3); C4=(-2944*S)/(T^4); C5=(4608*S)/(T^5);
  ax_swing1=2*C2+6*C3*(tz2)+12*C4*(tz2.^2)+20*C5*(tz2.^3);
  C0=S/2; C1=0; C2=0; C3=(448*S)/(T^3); C4=(-2816*S)/(T^4); C5=(4608*S)/(T^5);
  ax_swing2=2*C2+6*C3*(tz3)+12*C4*(tz3.^2)+20*C5*(tz3.^3);
  ax_stance=0*ones(1,100);
  qax=[ax_start,ax_swing1,ax_swing2,ax_stance];

end