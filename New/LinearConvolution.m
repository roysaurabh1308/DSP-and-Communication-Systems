clc
close all
x1=input('Seq1:');
x2=input('Seq2:');
l1=length(x1);
l2=length(x2);
y=zeros(1,l2+l1-1);
for i=2:(l1+l2)
    for j=1:max(l2,l1)
        if j<=l1 && (i-j)<=l2 && (i-j)>0
            y(i-1)=y(i-1)+x1(j)*x2(i-j);
        end
    end
end
disp(y)
temp=conv(x1,x2);
disp(temp)