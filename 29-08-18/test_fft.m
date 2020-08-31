close all;
clear all;
Fs  = 500;
f = 10;
n = 0:1/Fs:1;
x = sin(2*pi*f*n) + sin(2*pi*f*n/5);
subplot(321);
plot(n,x );
xlabel('time');
ylabel('amplitude');
title('message signal');
nfft  = length(x) %2^nextpow2(length(x))
y = fft(x, nfft);
freq_range = Fs/2*(linspace(0, 1, nfft/2 + 1));
subplot(322);
plot(freq_range, abs(y(:, 1:nfft)));
xlabel('frequency');
ylabel('amplitude');
title('dft of input signal');


noisex=  x + 2*rand(1,length(x));
y2  = fft(noisex , nfft);
subplot(323)
plot(n, noisex);
title('noise signal');
xlabel('time');
ylabel('amplitude');
subplot(324);
plot(freq_range, abs(y2(:, 1:nfft/2+1)));
xlabel('freq');
ylabel('amplitude');
title('dft of noise signal');

o = 5;
wn  = [2 10]*2/Fs;
[b, a] = butter(o, wn, 'bandpass');
[h, w] = freqz(b, a, 1024, Fs);
subplot(325);
plot(w, 20*log10(abs(h)));
title('magnitude response of the filter');
xlabel('frequency');
ylabel('magnitude');
grid on;

y_filt  = filter(b, a, noisex);
subplot(326);
plot(n, y_filt);
title('Filtered signal');
xlabel('time');
ylabel('amp');


