close all;
clc;
clear all;
x = input('Enter the sequence: ');
N = length(x);
for k=0:N-1
    for n=0:N-1
        p = exp(-j*2*pi*k*n/N);
        W(k+1, n+1) = p;
    end
end
X =W*x';
Theta = phase(X);
disp('The DFT of the given sequence is');
disp(X);
subplot(2,1,1);
stem(abs(X));
xlabel(' Sample index');
ylabel('Amplitude');
title('Magnitude plot');
subplot(2,1,2);
stem(Theta);
xlabel('Sample Index');
ylabel('Phase');
title('Phase plot for DFT of the given sequence');
disp(fft(x))