clc
clear all
close all
f=[0 0.225 0.25 0.25 0.475 0.5 0.725 0.725 0.95 1];
m=[0 0 0 1 1 1 1 0 0 0];
b=fir2(31,f,m);
[h1,w]=freqz(b,1);
plot(f,m,w/pi,abs(h1))
xlabel('\omega / \pi');
lgs = {'Ideal','fir2 default'};
legend(lgs)