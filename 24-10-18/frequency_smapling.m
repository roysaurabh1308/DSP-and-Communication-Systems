
f = [0 0.3 0.3 0.6 0.6 1];
mhi = [0 0 1 1 0 0];
bhi = fir2(194,f,mhi);
[h1,w] = freqz(bhi,1);
plot(f,mhi,w/pi,abs(h1));
xlabel('\omega / \pi');
lgs={'ideal', 'fir default'};
legend(lgs)