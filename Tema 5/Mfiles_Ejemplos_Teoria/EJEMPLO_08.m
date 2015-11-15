%% EJEMPLO 08: Ilustración de algoritmos de generación
% de secuencias pseudo-aleatorias con distribución uniforme
clear; clf; clc;

n=2e3; % Longitud del vector pseudo-aleatorio a generar

%% Algoritmo para secuencias LCG #1 - Deliberadamente malo
a=57; c=1; M=256; % Parámetros del LCG
r1=10; % Semilla

r=zeros(1,n); r(1)=r1;
% Algoritmo (Regla recursiva)
for i=2:n
    r(i)=rem(a*r(i-1)+c,M); % Genera números en [0,M-1]
end
rn1=r/M; % Normalización de la secuencia al intervalo [0,1]

% Comprobación visual de la secuencia
subplot(121), plot(rn1(1:n-1),rn1(2:n),'+')
title('GENERADOR DELIBERADAMENTE MALO');
xlabel('r(i)'); ylabel('r(i+1)');

% Determinación del periodo de la secuencia
pos1=find(rn1==rn1(1)); % Posiciones en las que se repite el 1er número de la secuencia
T1=pos1(2)-pos1(1)

%% Algoritmo de rand MATLAB (Mersenne Twister)
rn2=rand(1,n); % Genera números en [0,1]

% Comprobación visual de la secuencia
subplot(122), plot(rn2(1:n-1),rn2(2:n),'+')
title('GENERADOR DE MATLAB rand');
xlabel('r(i)'); ylabel('r(i+1)');

% Determinación del periodo de la secuencia
% pos2=find(rn2==rn1(2)); % Posiciones en las que se repite el 1er número de la secuencia
% T2=pos2(2)-pos2(1)

