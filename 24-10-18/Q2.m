N = ceil((-20*log(sqrt(0.0116*10^-3))-13)/(14.6/20))

b = fir1(N,[150/1000, 250/1000], 'bandpass');
[h,w] = freqz(b,1,512)
window = kaiser(512,10)
h2=h.*window

plot(w/pi, abs(h2),w/pi,abs(h),w/pi,abs(window));
xlabel('\omega/\pi');
ylabel('mag');
lgs={'result','without window', 'window'};
legend(lgs);
