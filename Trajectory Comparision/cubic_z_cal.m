% Calculations for cubic Z motion

function[cz_pos,cvz,caz]=cubic_z_cal(H,tz2,tz3,T)
 z_start=0*ones(1,50);
 z_rise=(((48*H)/(T^2))*(tz2.^2))+(((-128*H)/(T^3))*(tz2.^3));
 z_fall=H+(((-48*H)/(T^2))*(tz3.^2))+(((128*H)/(T^3))*(tz3.^3));
 z_stance=0*ones(1,100);
 cz_pos=[z_start,z_rise,z_fall,z_stance];

 vz_start=0*ones(1,50);
 vz_rise=(((96*H)/(T^2))*(tz2))+(((-384*H)/(T^3))*(tz2.^2));
 vz_fall=(((-96*H)/(T^2))*(tz3))+(((384*H)/(T^3))*(tz3.^2));
 vz_stance=0*ones(1,100);
 cvz=[vz_start,vz_rise,vz_fall,vz_stance];

 az_start=0*ones(1,50);
 az_rise=((96*H)/(T^2))+(((-768*H)/(T^3))*(tz2));
 az_fall=((-96*H)/(T^2))+(((768*H)/(T^3))*(tz3));
 az_stance=0*ones(1,100);
 caz=[az_start,az_rise,az_fall,az_stance];
end
