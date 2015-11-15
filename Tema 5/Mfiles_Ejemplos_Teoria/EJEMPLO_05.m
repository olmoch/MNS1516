%% EJEMPLO 05: Tirada de 1 dado
% Funci�n randi de MATLAB --> Distribuici�n uniforme discreta
clear; clf; clc;

num_lazamientos = 6000;
tirada=randi([1,6],1,num_lazamientos);

%% Contamos el n�mero de veces que sale 1,2,...,6
posibilidades=1:1:6;
num_ocurrencias=hist(tirada,posibilidades);
fprintf('\n Media   = %.4f \n\n', mean(tirada));

%% Representaci�n
bar(posibilidades,num_ocurrencias); grid on;
xlabel('Tirada'); ylabel('N�mero de ocurrencias');
title('TIRADA DE UN DADO');