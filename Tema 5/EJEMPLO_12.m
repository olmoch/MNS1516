%% EJEMPLO 12: Integraci�n por valor medio
% Evaluar una integral en 3D
clear; clc;

%% Definici�n de la funci�n y sus l�mites de integraci�n
func = @(x1,x2,x3) (x1+x2+x3).^2;

x1l=0; x1h=1;
x2l=0; x2h=1;
x3l=0; x3h=1;

N=1e5; % N�mero de evaluaciones de la funci�n

%% Integraci�n por Monte Carlo
x1samp=x1l+(x1h-x1l)*rand(1,N); % Generaci�n de secuencia aleatoria para x1 en [x1l,x1h]
x2samp=x2l+(x2h-x2l)*rand(1,N); % Generaci�n de secuencia aleatoria para x2 en [x2l,x2h]
x3samp=x3l+(x3h-x3l)*rand(1,N); % Generaci�n de secuencia aleatoria para x3 en [x3l,x3h]

fsamp=func(x1samp,x2samp,x3samp);
fsamp_mean=1/N*sum(fsamp);

I_MC=(x1h-x1l)*(x2h-x2l)*(x3h-x3l)*fsamp_mean;

fprintf('\n Integraci�n 3D con Monte Carlo        --> I = %.4f', I_MC);

%% Comprobaci�n con la funci�n de MATLAB triplequad
I=triplequad(func,x1l,x1h,x2l,x2h,x3l,x3h); % Integral triple de f(x1,x2,x3)
fprintf('\n Integraci�n 3D con MATLAB triplequad  --> I = %.4f \n\n', I);