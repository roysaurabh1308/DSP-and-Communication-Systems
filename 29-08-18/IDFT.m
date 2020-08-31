close all;
clear all;
clc;
X = input('Enter the input DFT sequence');
N  = length(X);
for n= 0:N-1
    for k  = 0:N-1
        p=exp(j*2*pi*k*n/N);
        W(n+1,k+1)=p;
    end
end
disp(W);
x=W'*X'/N;
disp(W');
disp(transpose(W));
Theta=phase(x);
disp('the IDFT of the given sequence');
disp(x)
subplot(2,2,1);
stem(abs(x));
xlabel('sample index');
ylabel('amaplitude');
title('magnitude plot');
subplot(2,1,2);
stem(Theta);
xlabel('sample index');
ylabel('amplitude');
title('phase plot from DFT of the given sequence');

disp(ifft(X));
        