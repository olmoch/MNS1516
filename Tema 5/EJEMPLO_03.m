%% EJEMPLO 03
% Generación de números aleatorios con distribución normal/gaussiana
clear; clf; clc;

%% Parámetros de inicialización
N = 100; % Número de muestras a generar
nbins = 20; % Número de pilas para el histigrama

%% DISTRIBUCION UNIFORME
xn=randn(1,N);

subplot(121), plot(1:N,xn,'+');
xlabel('Número de muestra'); ylabel('Número aleatorio generado');
subplot(122), hist(xn,nbins);
xlabel('Número aleatorio generado'); ylabel('Número de ocurrencias');

fprintf('\n Media = %.4f ', mean(xn));
fprintf('\n Std   = %.4f \n\n', std(xn));