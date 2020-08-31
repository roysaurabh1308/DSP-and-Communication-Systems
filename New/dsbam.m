function dsbam(t,orgsig,Carsig)
Rm=(1+0.5*orgsig).*Carsig;
figure
plot(t,Rm);
title('DSB-AM');
mn=angle(Rm);
figure
plot(t,mn);
title('Phase Plot');
end