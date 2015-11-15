%% EJEMPLO 03
% Generaci�n de n�meros aleatorios con distribuci�n normal/gaussiana
clear; clf; clc;

%% Par�metros de inicializaci�n
N = 100; % N�mero de muestras a generar
nbins = 20; % N�mero de pilas para el histigrama

%% DISTRIBUCION UNIFORME
xn=randn(1,N);

subplot(121), plot(1:N,xn,'+');
xlabel('N�mero de muestra'); ylabel('N�mero aleatorio generado');
subplot(122), hist(xn,nbins);
xlabel('N�mero aleatorio generado'); ylabel('N�mero de ocurrencias');

fprintf('\n Media = %.4f ', mean(xn));
fprintf('\n Std   = %.4f \n\n', std(xn));