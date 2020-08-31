%% Design of Chebyshev type 1 filter
%% using bilinear transformation technique
clc;
clear all;
clear all;
%% Input the filter specifications
Wp = 2*1300*pi; % analog passband cutoff frequency
Ws = 2*1550*pi;  %analog stopband cutoff frequency
Ap=0.23;
As=47;
fs=8800;
T=1/fs;
%% Calculation of filter order and filter coefficient
%[N, Wc] = buttord(0.3,0.8, Ap, As);
%[b_d,a_d] = butter(N,Wc);
[b,a] =cheby1(Wp,Ws,Ap,As,'s');
%[b,a] = butter(N,Wc,'low','s');%designs a lowpass butterworth analog filter

Hs=tf(b,a); %find corresponding transfer function
freqz(b,a,512);
[b_d,a_d] = bilinear(b,a,fs); 
Hz = tf(b_d,a_d,fs);

[Hw, omega] = freqz(b_d, a_d, 512);
gain  = 20*log10(abs(Hw));
figure;
plot(omega,gain);
grid;
xlabel('\omega/\pi');
ylabel('Gain, dB');
title('Chebyshev type 1 digital filter');