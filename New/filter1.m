clc;
close all;
fs=500;
f=100;
n=0:(1/fs):1;
x=sin(2*pi*f*n)+sin(2*pi*(f/5)*n);
figure;
subplot(2,2,1);
plot(n,x);
title('original signal');
L=500;
NFFT=2^nextpow2(L);
y=fft(x,NFFT)/L;
freq_anlg=fs/2*linspace(0,1,NFFT/2+1);
%[b,a]=butter(0,wn,'bandpass');
%plot(f,x);
subplot(2,2,2);
plot(freq_anlg,2*abs(y(1:NFFT/2+1)));
xlabel('frequencies');
ylabel('signal');
title('Freq plot');
nx=awgn(x,10);
subplot(2,2,3);
plot(n,nx);
title('noise signal');
ny=fft(nx,NFFT)/L;
subplot(2,2,4);
plot(freq_anlg,2*abs(ny(1:NFFT/2+1)));
title('Freq represntation of noisy signal');

%design filter
o=5;
wn=[20 100]*2/fs;
[b,a]=butter(o,wn,'bandpass');
[h,w]=freqz(b,a,1024,fs);
figure;
subplot(2,1,1);
plot(w,20*log(abs(h)));
title('Mag response of filter');

%filter
yf=filter(b,a,x);
subplot(2,1,2);
plot(n,yf);
title('Filtered signal');