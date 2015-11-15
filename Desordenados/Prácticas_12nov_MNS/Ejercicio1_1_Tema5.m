%%% Ejercicio 1.1. Clase Práctica 1. Tema 5 %%%

clc;
close all;
clear all;

N=1e5;%Longitud del vector
Num_dados=10;%Números de dados contemplados

lanzamiento_dados=randi([1,6],Num_dados,N);%Resultado en cada lanzamiento y por dado almacenado en una matriz Num_dados*N
tirada=sum(lanzamiento_dados,1);%Sumamos los resultados de todos los dados

rango_valores=1*Num_dados:1:6*Num_dados;
hist_dados=hist(tirada,rango_valores);

%Visualización
subplot(1,2,1);
bar(rango_valores,hist_dados);
xlabel('Suma de los valores de los dados');
ylabel('Tirada');
title('Lanzamiento de dados');


subplot(1,2,2);
bar(rango_valores,hist_dados*100/N);
xlabel('Suma de los valores de los dados');
ylabel('Tirada %');
title('Lanzamiento de dados');

