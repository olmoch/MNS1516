clc
clear all
close all

%% Constants

E = 120;
r1 = 2;
r2 = 3.6;
r3 = 1.5;
r4 = 1.8;
r5 = 1.2;

%% Cálculo de i1 e i2

A=[r1+r3+r -r; -r r2+r4+r5+r];
B=[E;0];
i=A\B

%% Definición de la función potencia

P = (i(1)-i(2))^2.*R;

