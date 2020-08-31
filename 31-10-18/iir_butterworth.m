%% Design of Digital IIR Butterworth Filter
%% using bilinear transformation technique
clc;
clear all;
clear all;
%% Input the filter specifications
Wp = 0.3 *pi; % analog passband cutoff frequency
Ws = 0.8*pi;  %analog stopband cutoff frequency
Ap=1;
As=40;
T=1;
%% Calculation of filter order and filter coefficient
%[N, Wc] = buttord(0.3,0.8, Ap, As);
%[b_d,a_d] = butter(N,Wc);
[N,Wc] =buttord(Wp,Ws,Ap,As,'s');
[b,a] = butter(N,Wc,'low','s');%designs a lowpass butterworth analog filter

Hs=tf(b,a); %find corresponding transfer function
[b_d,a_d] = bilinear(b,a,1/T); 
Hz = tf(b_d,a_d,1/T);

[Hw, omega] = freqz(b_d, a_d, 512);
gain  = 20*log10(abs(Hw));
plot(omega,gain);
grid;
xlabel('\omega/\pi');
ylabel('Gain, dB');
title('IIR Butterworth filter');