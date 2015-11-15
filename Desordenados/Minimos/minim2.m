clc; clear all; close all;

a = 0.1; b = 5; tolpi = 10^(-3); tolgs = 10^(-4);

y = @(x) 2*x+3./x;

[xmpi, ympi] = parabInterp(y,a,b,tolpi);

[xmgs, ymgs] = goldSearch(y,a,b,tolgs);

ax = linspace(0.1,5,200);

plot(ax,y(ax))

hold on

plot([xmpi, xmgs], [ympi,ymgs], 'x')

hold off

abs(ymgs-ympi)