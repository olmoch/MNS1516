clc
clear all
close all

f = @(x) 3./x+2.*x;
a=0.1;
b=5;
tol = 1e-4;

[xmin,ymin]= parabInterp (f,a,b,tol);
x=0.1:0.1:5;
plot (x,f(x));
hold on
plot (xmin,f(xmin),'*r')
hold off
shg