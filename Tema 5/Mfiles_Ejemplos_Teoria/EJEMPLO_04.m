%% EJEMPLO 04: Desplazamiento de una distribucion normal
clear; clf; clc;
%% Parámetros de inicialización
N = 1e5; % Número de muestras a generar
nbins = 20; % Número de pilas para el histograma

mu=5; sigma=0.2; % Parámetros de la distribución normal desplazada

%% DISTRIBUCION NORMAL
xn=randn(1,N); % Distribucion normal con media=1 y std=0
xnd=mu+sigma*randn(1,N); % Distribucion normal con media=mu y std=sigma

fprintf('\n DISTRIB. NORMAL CON MEDIA=0 Y STD=1      --> Media = %7.4f, Std   = %7.4f', mean(xn), std(xn));
fprintf('\n DISTRIB. NORMAL CON MEDIA=mu Y STD=sigma --> Media = %7.4f, Std   = %7.4f \n\n', mean(xnd), std(xnd));

hist(xn,nbins); hold on;
hist(xnd,nbins,'r');
xlabel('Número aleatorio generado'); ylabel('Número de ocurrencias');