% Calculations for Quintic Z motion

function[qz_pos,qvz,qaz]=quintic_z_cal(H,tz2,tz3,T)
 z_start=0*ones(1,50);
 C0=0; C1=0; C2=0; C3=(640*H)/(T^3); C4=(-3840*H)/(T^4); C5=(6144*H)/(T^5);
 z_rise=C0+C1*(tz2)+C2*(tz2.^2)+C3*(tz2.^3)+C4*(tz2.^4)+C5*(tz2.^5);
 C0=H; C1=0; C2=0; C3=(-640*H)/(T^3); C4=(3840*H)/(T^4); C5=(-6144*H)/(T^5);
 z_fall=C0+C1*(tz3)+C2*(tz3.^2)+C3*(tz3.^3)+C4*(tz3.^4)+C5*(tz3.^5);
 z_stance=0*ones(1,100);
 qz_pos=[z_start,z_rise,z_fall,z_stance];

 vz_start=0*ones(1,50);
 C0=0; C1=0; C2=0; C3=(640*H)/(T^3); C4=(-3840*H)/(T^4); C5=(6144*H)/(T^5);
 vz_rise=C1+2*C2*(tz2)+3*C3*(tz2.^2)+4*C4*(tz2.^3)+5*C5*(tz2.^4);
 C0=H; C1=0; C2=0; C3=(-640*H)/(T^3); C4=(3840*H)/(T^4); C5=(-6144*H)/(T^5);
 vz_fall=C1+2*C2*(tz3)+3*C3*(tz3.^2)+4*C4*(tz3.^3)+5*C5*(tz3.^4);
 vz_stance=0*ones(1,100);
 qvz=[vz_start,vz_rise,vz_fall,vz_stance];

 az_start=0*ones(1,50);
 C0=0; C1=0; C2=0; C3=(640*H)/(T^3); C4=(-3840*H)/(T^4); C5=(6144*H)/(T^5);
 az_rise=2*C2+6*C3*(tz2)+12*C4*(tz2.^2)+20*C5*(tz2.^3);
 C0=H; C1=0; C2=0; C3=(-640*H)/(T^3); C4=(3840*H)/(T^4); C5=(-6144*H)/(T^5);
 az_fall=2*C2+6*C3*(tz3)+12*C4*(tz3.^2)+20*C5*(tz3.^3);
 az_stance=0*ones(1,100);
 qaz=[az_start,az_rise,az_fall,az_stance];
end
