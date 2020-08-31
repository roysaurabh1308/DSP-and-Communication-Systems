N = 18;
freq=2*0.18;
b = fir1(N, freq, 'low');
freqz(b,1,500)