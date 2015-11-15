%% EJEMPLO 05: Tirada de 1 dado
% Función randi de MATLAB --> Distribuición uniforme discreta
clear; clf; clc;

num_lazamientos = 6000;
tirada=randi([1,6],1,num_lazamientos);

%% Contamos el número de veces que sale 1,2,...,6
posibilidades=1:1:6;
num_ocurrencias=hist(tirada,posibilidades);
fprintf('\n Media   = %.4f \n\n', mean(tirada));

%% Representación
bar(posibilidades,num_ocurrencias); grid on;
xlabel('Tirada'); ylabel('Número de ocurrencias');
title('TIRADA DE UN DADO');