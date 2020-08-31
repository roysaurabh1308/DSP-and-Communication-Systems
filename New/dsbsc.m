function dsbsc(t,orgsig,Carsig)
Pm= orgsig.*Carsig;
figure
plot(t,Pm);
title('DSB-SC');
mm=angle(Pm);
figure
plot(t,mm);
title('Phase Plot');
end