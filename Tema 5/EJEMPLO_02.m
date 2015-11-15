%% EJEMPLO 02: Desplazamiento de una distribucion uniforme
clear; clf; clc;

%% Par�metros de inicializaci�n
N = 1e5; % N�mero de muestras a generar
nbins = 10; % N�mero de pilas para el histograma

a=-0.5; b=3; % Par�metros de la distribuci�n uniforme desplazada

%% DISTRIBUCION UNIFORME
xu=rand(1,N); % Distribucion uniforme entre [0,1]
xud=a+(b-a)*rand(1,N); % Distribucion uniforme entre [a,b]

subplot(121), hist(xu,nbins);
xlabel('N�mero aleatorio generado'); ylabel('N�mero de ocurrencias');
subplot(122), hist(xud,nbins);
xlabel('N�mero aleatorio generado'); ylabel('N�mero de ocurrencias');