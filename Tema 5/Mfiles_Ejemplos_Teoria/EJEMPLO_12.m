%% EJEMPLO 12: Integración por valor medio
% Evaluar una integral en 3D
clear; clc;

%% Definición de la función y sus límites de integración
func = @(x1,x2,x3) (x1+x2+x3).^2;

x1l=0; x1h=1;
x2l=0; x2h=1;
x3l=0; x3h=1;

N=1e5; % Número de evaluaciones de la función

%% Integración por Monte Carlo
x1samp=x1l+(x1h-x1l)*rand(1,N); % Generación de secuencia aleatoria para x1 en [x1l,x1h]
x2samp=x2l+(x2h-x2l)*rand(1,N); % Generación de secuencia aleatoria para x2 en [x2l,x2h]
x3samp=x3l+(x3h-x3l)*rand(1,N); % Generación de secuencia aleatoria para x3 en [x3l,x3h]

fsamp=func(x1samp,x2samp,x3samp);
fsamp_mean=1/N*sum(fsamp);

I_MC=(x1h-x1l)*(x2h-x2l)*(x3h-x3l)*fsamp_mean;

fprintf('\n Integración 3D con Monte Carlo        --> I = %.4f', I_MC);

%% Comprobación con la función de MATLAB triplequad
I=triplequad(func,x1l,x1h,x2l,x2h,x3l,x3h); % Integral triple de f(x1,x2,x3)
fprintf('\n Integración 3D con MATLAB triplequad  --> I = %.4f \n\n', I);