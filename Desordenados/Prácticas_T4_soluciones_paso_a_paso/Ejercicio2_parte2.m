%Ejercicio 2. Práctica 4

%Limpiar workspace y cerrar todas las ventanas
clc;
clear all;
close all;

%Definición la función f(x) a minimizar
func = @(x) 2.*x+(3./x);

%Definimos intervalo
a=0.5;
b=5;
tol=1e-4;

%Comparamos con el método de Golden Search
fprintf('Método de Golden Search \n');
[xmin_GS,fmin_GS]=goldSearch(func,a,b,tol);
fprintf('xmin_GS= %4.4f, ymin_GS= %4.4f \n\n', xmin_GS, fmin_GS);

x=[0:1e-1:6];
figure(1), plot(x,func(x));
xlabel('x');
ylabel('f(x)');
title('Golden Search');
grid on;
hold on;
plot(xmin_GS, fmin_GS, 'r*');
shg
