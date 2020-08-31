clear all;
close all;
clc;
t=0:0.01:1;
f1 = 0.00;
f2 = 10;

x1 = sin(2*pi*f1*t);
x2 = sin(2*pi*f2*t);
X = x1+x2;
X2 = awgn(X,10);
Y = fft(X);
subplot(3,1,1);
plot(t,x1);
xlabel('Time');
ylabel('Amplitude');
title('Sin wave 1');
subplot(3,1,2);
plot(t,x2);
xlabel('Time');
ylabel('Amplitude');
title('Sin wave 2');
subplot(3,1,3);
stem(abs(Y));
xlabel('frequency');
ylabel('Amplitude');
title('DFT');
figure()
subplot(3,1,1);
plot(t, X2);
xlabel('Time');
ylabel('Amplitude');
title('Noise sunusoid');
Y2 = fft(X2);
subplot(3,1,2);
stem(abs(Y2));

