%% Design of Digital IIR Butterworth Filter
%% using bilinear transformation technique
clc;
clear all;
clear all;
%% Input the filter specifications
Wp = 2*2000*pi; % analog passband cutoff frequency
Ws = 2*3500*pi;  %analog stopband cutoff frequency
Ap=0.2;
As=40;
fs=8000;
T=1/fs;
%% Calculation of filter order and filter coefficient
%[N, Wc] = buttord(0.3,0.8, Ap, As);
%[b_d,a_d] = butter(N,Wc);
[N,Wc] =buttord(Wp,Ws,Ap,As,'s');
[b,a] = butter(N,Wc,'high','s');%designs a lowpass butterworth analog filter

Hs=tf(b,a); %find corresponding transfer function
freqz(b,a,512);
[b_d,a_d] = impinvar(b,a,fs); 
Hz = tf(b_d,a_d,1/T);

[Hw, omega] = freqz(b_d, a_d, 512);
gain  = 20*log10(abs(Hw));
figure;
plot(omega,gain);
grid;
xlabel('\omega/\pi');
ylabel('Gain, dB');
title('IIR Butterworth digital filter');