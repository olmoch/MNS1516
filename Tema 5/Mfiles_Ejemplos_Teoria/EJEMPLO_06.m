%% EJEMPLO 06: Tirada de 2 dados
% Funci�n randi de MATLAB --> Distribuici�n uniforme discreta
clear; clf; clc;

num_lazamientos = 6000;
tirada=randi([1,6],1,num_lazamientos)+randi([1,6],1,num_lazamientos);

posibilidades=2:1:12;
num_ocurrencias=hist(tirada,posibilidades);
fprintf('\n Media   = %7.4f \n\n', mean(tirada));

%% Representaci�n
bar(posibilidades,num_ocurrencias); grid on;
xlabel('Tirada'); ylabel('N�mero de ocurrencias');
title('TIRADA DE DOS DADOS');
shg;