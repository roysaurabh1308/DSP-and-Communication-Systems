clc;
close all;
a=imread('colo.png');
b=a(:,:,1);
c=a(:,:,3);
figure;
imshow(b);
title('red');
figure;
imshow(c);
title('blue');
figure;
imshow(a);
title('org');