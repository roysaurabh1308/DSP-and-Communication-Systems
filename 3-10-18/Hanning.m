clc;
close all;
clear all;
N = 67; %order
w = 0.175; %cutoff frequency
beta = 0.5; % Kaiser parameter
W =blackman(N); %kaiser(N, beta);
b = fir1(N-1, w, 'low', W);
[h, omega] = freqz(b, 1, 512);
subplot(321)
plot(omega/pi, 20*log10(abs(h)));
grid;
xlabel('\omega/\pi');
ylabel('gain, db');
title('Filter response');

subplot(322);
plot(0:N-1, b);

b1 = fir1(N-1, [w, 0.85], 'bandpass', W);
[h1, omega1] = freqz(b1,1,512);
subplot(323);
plot(omega1/pi, 20*log10(abs(h1)));

subplot(324);
plot(0:N-1, b1);

subplot(325);
plot(0:N-1, W);
wvtool(W, hanning(N), rectwin(N), hamming(N), kaiser(N, beta));
 
 %plotting window function
 