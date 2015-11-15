%Ejercicio 2. Pr�ctica 4

%Limpiar workspace y cerrar todas las ventanas
clc;
clear all;
close all;

%Definici�n la funci�n f(x) a minimizar
func = @(x) 2.*x+(3./x);

%Invocamos m�todo de minimizaci�n
tol=1e-4;
a=0.1;
b=5;
fprintf('Interpolaci�n parab�lica [0.1 5]');
[xmin,fmin]=parabInterp(func,a,b,tol);

%Dibujamos la funci�n
x=[0:1e-1:6];
figure(1);
plot(x,func(x));
title('Minimo de la funci�n f(x)');
xlabel('x');
ylabel('f(x)');
shg