clc; clear all; close all;

%%

q = 50; a = 0.005; k = 0.16; h = 20; Tinf = 280;

%%

r0 = a; tol = 10^(-6);

%%

T = @(r) q/2/pi * (log(r./a)/k + 1./(h*r)) + Tinf;

%%

[left,rite] = bracket(T, r0, 0.001);
[xmin, Tmin, data_out] = goldSearch(T,left,rite,tol);

%%

ax = linspace(a,5*a,500);

plot(ax,T(ax))

hold on

plot(xmin,Tmin,'x')

hold off

