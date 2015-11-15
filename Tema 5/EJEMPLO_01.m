%% EJEMPLO 01
% Generación de números aleatorios con distribución uniforme
clear; clf; clc;

%% Parámetros de inicialización
N = 100; % Número de muestras a generar
nbins = 10; % Número de pilas para el histograma

%% DISTRIBUCION UNIFORME
xu=rand(1,N); % Distribucion uniforme entre [0,1]

subplot(1,2,1), plot(1:N,xu,'+');
xlabel('Número de muestra'); ylabel('Número aleatorio generado');
subplot(1,2,2), hist(xu,nbins);
xlabel('Número aleatorio generado'); ylabel('Número de ocurrencias');