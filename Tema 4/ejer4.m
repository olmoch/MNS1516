clc
clear all
close all

%% Constants

q= 50
a= 0.005
k=0.16
h=20
T0=280
x0=0
tol=1e-6

%% Functions declaration

T= @(x) (q/(2*pi)).*(log(x/a)/k+1./(h*x))+T0


%% Minimum acotation

[c,d]=bracket (T,x0,0.001);

%% Minimum calc

options = optimset ('display','iter','TolX',tol);
[xmin,Tmin] = fminbnd (T,c,d,options)

%% Ploting

x=0.001:0.0001:0.1;
plot (x,T(x))
hold on
plot (xmin,T(xmin),'*r')
hold off
shg