%Ejercicio 2. Práctica 4

%Limpiar workspace y cerrar todas las ventanas
clc;
clear all;
close all;

%Definición la función f(x) a minimizar
func = @(x) 2.*x+(3./x);

%Invocamos método de minimización
tol=1e-4;
a=0.1;
b=5;
fprintf('Interpolación parabólica [0.1 5]');
[xmin,fmin]=parabInterp(func,a,b,tol);

%Dibujamos la función
x=[0:1e-1:6];
figure(1);
plot(x,func(x));
title('Minimo de la función f(x)');
xlabel('x');
ylabel('f(x)');
shg