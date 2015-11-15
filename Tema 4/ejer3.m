clc
clear all
close all

%% Constants

eps=8.85e-12;
q=2e-5;
Q=q;
a=0.9;
x0=0;
tol = 1e-1;

%% Functions declaration

F= @(x) (1/(4*pi*eps)).*(q*Q*x./((x.^2+a^2).^(3/2)));
F_neg= @(x) -F(x);


%% Minimum acotation

[c,d]=bracket (F,x0);

%% Minimum calc

options = optimset ('display','iter','TolX',tol);
[xmin,F_negmin] = fminbnd (F_neg,c,d,options)

%% Ploting

x=-1:0.001:1;
plot (x,F(x))
hold on
plot (xmin,F(xmin),'*r')
hold off
shg