%% EJEMPLO 02: Desplazamiento de una distribucion uniforme
clear; clf; clc;

%% Parámetros de inicialización
N = 1e5; % Número de muestras a generar
nbins = 10; % Número de pilas para el histograma

a=-0.5; b=3; % Parámetros de la distribución uniforme desplazada

%% DISTRIBUCION UNIFORME
xu=rand(1,N); % Distribucion uniforme entre [0,1]
xud=a+(b-a)*rand(1,N); % Distribucion uniforme entre [a,b]

subplot(121), hist(xu,nbins);
xlabel('Número aleatorio generado'); ylabel('Número de ocurrencias');
subplot(122), hist(xud,nbins);
xlabel('Número aleatorio generado'); ylabel('Número de ocurrencias');