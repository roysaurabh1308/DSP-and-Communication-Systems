clc
close all
M=floor(3.1/(0.25-0.1))+1;
disp(M)
wc=(0.25+0.1)/2;
W=hanning(M);
b=fir1(M-1,wc,W);
freqz(b,1,512)