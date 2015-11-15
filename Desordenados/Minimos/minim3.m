clc; clear all; close all;

%%

eps0 = 8.85*10^(-12); qs = 2*10^(-5); Qc = 2*10^(-5); a = 0.9; tol = 10^(-4);

%%

F = @(x) 1/(4*pi*eps0)*qs*Qc.*x./(a^2 + x.^2).^(3/2); F_n = @(x) -F(x);

%%

[left,rite] = bracket(F_n, a);

%% Método Golden Search para hallar la posición del extremo

[xmin, Fmin, data_out] = goldSearch(F_n,left,rite,tol);

%%

ax = linspace(0,rite+a,500);

plot(ax,F(ax),xmin,-Fmin,'x')

hold on

plot([a,a],[0,F(a)])

hold off