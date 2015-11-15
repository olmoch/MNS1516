% %%% Ejercicio 1.4. Clase Pr�ctica 1. Tema 5 %%%

clc;
close all;
clear all;

N=1e5;%Longitud del vector

r=2;%Valor de r



%Definici�n de la funci�n
f=@(x) r.*exp(-r.*x);

x=linspace(1e-1,10/r,50);


%M�todo exponencial
exp_rnd=log(rand(1,N))/(-r);

%Visualizaci�n
subplot(1,3,1);
plot(x,f(x));
grid on;
title('Exponencial definida con la funci�n');
xlabel('x');
ylabel('f(x)');
shg;

subplot(1,3,2);
hist(exp_rnd,x);
grid on;
title('Exponencial definida con n�meros aleatorios');
xlabel('x');
ylabel('exp-rnd');


histograma=hist(exp_rnd,x);%Histograma sin escalar
[nMax,iMax]=max(histograma); % Ocurrencias m�ximas y pila para el que ocurre
factor_escala=f(x(iMax))/nMax;%C�lculo del factor de escala
n_escalado=histograma*factor_escala;%Histograma escalado

subplot(1,3,3);
bar(x,n_escalado);
grid on;
xlabel('x');
ylabel('exp-rnd');
title('Exponencial con n�meros alatorios escalada');