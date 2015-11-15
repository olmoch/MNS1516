%%% Ejercicio 1.2. Clase Práctica 1. Tema 5 %%%

clc;
close all;
clear all;

N=1e5;%Longitud del vector

N_pos=3;%Número total de probabilidades contempladas
p1=0.1;%Probabilidad 1
p2=0.2;%Probabilidad 2
p3=0.7;%Probabilidad 3

rnd=zeros(1,N);%Variable donde se va almacenando la distribución discreta

for i=1:N
    tmp=rand;
    if (tmp<p1)
        rnd(i)=1;
    elseif (tmp<p1+p2)
        rnd(i)=2;
    else
        rnd(i)=3;
    end
end

histograma=hist(rnd,1:1:N_pos);
prob=100*histograma/sum(histograma);

bar(1:1:N_pos,prob);
grid on; hold on;
xlabel('Número aleatorio generado'); ylabel('Ocurrencia (%)');
title('PDF DE LA DISTRIBUCIÓN DISCRETA');