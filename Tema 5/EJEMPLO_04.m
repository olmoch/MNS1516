%% EJEMPLO 04: Desplazamiento de una distribucion normal
clear; clf; clc;
%% Par�metros de inicializaci�n
N = 1e5; % N�mero de muestras a generar
nbins = 20; % N�mero de pilas para el histograma

mu=5; sigma=0.2; % Par�metros de la distribuci�n normal desplazada

%% DISTRIBUCION NORMAL
xn=randn(1,N); % Distribucion normal con media=1 y std=0
xnd=mu+sigma*randn(1,N); % Distribucion normal con media=mu y std=sigma

fprintf('\n DISTRIB. NORMAL CON MEDIA=0 Y STD=1      --> Media = %7.4f, Std   = %7.4f', mean(xn), std(xn));
fprintf('\n DISTRIB. NORMAL CON MEDIA=mu Y STD=sigma --> Media = %7.4f, Std   = %7.4f \n\n', mean(xnd), std(xnd));

hist(xn,nbins); hold on;
hist(xnd,nbins,'r');
xlabel('N�mero aleatorio generado'); ylabel('N�mero de ocurrencias');