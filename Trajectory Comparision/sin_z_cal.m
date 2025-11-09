% Calculations for Composite Cycloidal ( Half-Sine ) Curve

function[sz_pos,svz,saz]=sin_z_cal(H,Ty,tnz2,tnz3)
 z_start=0*ones(1,50);
 z_rise=2*H*(tnz2-((sin(4*pi*tnz2))/(4*pi)));
 z_fall=H-2*H*(tnz3-((sin(4*pi*tnz3))/(4*pi)));
 z_stance=0*ones(1,100);
 sz_pos=[z_start,z_rise,z_fall,z_stance];

 vz_start=0*ones(1,50);
 vz_rise=((2*H)/Ty)*(1-cos(4*pi*tnz2));
 vz_fall=-((2*H)/Ty)*(1-cos(4*pi*tnz3));
 vz_stance=0*ones(1,100);
 svz=[vz_start,vz_rise,vz_fall,vz_stance];

 az_start=0*ones(1,50);
 az_rise=((8*pi*H)/(Ty^2))*(sin(4*pi*tnz2));
 az_fall=-((8*pi*H)/(Ty^2))*(sin(4*pi*tnz3));
 az_stance=0*ones(1,100);
 saz=[az_start,az_rise,az_fall,az_stance];


end

