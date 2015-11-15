% %%% Ejercicio 1.4. Clase Práctica 1. Tema 5 %%%

clc;
close all;
clear all;

N=1e5;%Longitud del vector

r=2;%Valor de r



%Definición de la función
f=@(x) r.*exp(-r.*x);

x=linspace(1e-1,10/r,50);


%Método exponencial
exp_rnd=log(rand(1,N))/(-r);

%Visualización
subplot(1,3,1);
plot(x,f(x));
grid on;
title('Exponencial definida con la función');
xlabel('x');
ylabel('f(x)');
shg;

subplot(1,3,2);
hist(exp_rnd,x);
grid on;
title('Exponencial definida con números aleatorios');
xlabel('x');
ylabel('exp-rnd');


histograma=hist(exp_rnd,x);%Histograma sin escalar
[nMax,iMax]=max(histograma); % Ocurrencias máximas y pila para el que ocurre
factor_escala=f(x(iMax))/nMax;%Cálculo del factor de escala
n_escalado=histograma*factor_escala;%Histograma escalado

subplot(1,3,3);
bar(x,n_escalado);
grid on;
xlabel('x');
ylabel('exp-rnd');
title('Exponencial con números alatorios escalada');