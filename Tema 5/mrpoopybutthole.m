clear all
clc
close all
desv=1;
med=7;
n=1e5;
x=zeros(1,n);
for i=1:n
    a=2*pi*rand;
    xrand=rand;
    b=desv*sqrt(-2*log(xrand));
    x(i)=med+b*sin(a);
end
y=linspace (med-6*desv,med+6*desv,50);
histograma = hist(x,y);
bar(y,histograma/n);

    