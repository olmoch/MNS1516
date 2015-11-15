% %%% Ejercicio 1.3. Clase Práctica 1. Tema 5 %%%

clc;
close all;
clear all;

N=1e5;%Longitud del vector

mu=7;%Valor de la media
sigma=1;%Valor de la desviación estándard


%Definición de la función gaussiana
f=@(x) 1/sqrt(2*pi*sigma)*exp(-(x-mu).^2/(2*sigma));

x=linspace(mu-6*sigma,mu+6*sigma,50);


%Método de Box-Muller-Gauss
a=0+(2*pi-0)*rand(1,N);
b=sigma*sqrt(-2*log(rand(1,N)));
gauss_rnd=mu+b.*sin(a);
%gauss_rnd=mu+b*cos(a);
fprintf('\n mu=%1.4f, sigma=%1.4f \n \n', mean(gauss_rnd), std(gauss_rnd));



%Visualización
subplot(1,3,1);
plot(x,f(x));
grid on;
title('Gaussiana definida con la función');
xlabel('x');
ylabel('f(x)');
shg;

subplot(1,3,2);
hist(gauss_rnd,x);
grid on;
title('Gaussiana definida con números aleatorios');
xlabel('x');
ylabel('gauss-rnd(x)');
shg;

histograma=hist(gauss_rnd,x);%Histograma sin escalar
[nMax,iMax]=max(histograma); % Ocurrencias máximas y pila para el que ocurre
factor_escala=f(x(iMax))/nMax;%Cálculo del factor de escala
histo_escalado=histograma*factor_escala;%Histograma escalado

subplot(1,3,3);
bar(x,histo_escalado);
grid on;
xlabel('x');
ylabel('gauss-rnd(x)-escalada');
title('Gaussiana con números alatorios escalada')
shg;