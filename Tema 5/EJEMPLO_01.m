%% EJEMPLO 01
% Generaci�n de n�meros aleatorios con distribuci�n uniforme
clear; clf; clc;

%% Par�metros de inicializaci�n
N = 100; % N�mero de muestras a generar
nbins = 10; % N�mero de pilas para el histograma

%% DISTRIBUCION UNIFORME
xu=rand(1,N); % Distribucion uniforme entre [0,1]

subplot(1,2,1), plot(1:N,xu,'+');
xlabel('N�mero de muestra'); ylabel('N�mero aleatorio generado');
subplot(1,2,2), hist(xu,nbins);
xlabel('N�mero aleatorio generado'); ylabel('N�mero de ocurrencias');