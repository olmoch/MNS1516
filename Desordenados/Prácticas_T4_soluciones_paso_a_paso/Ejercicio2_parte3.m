%Ejercicio 2. Pr�ctica 4

%Limpiar workspace y cerrar todas las ventanas
clc;
clear all;
close all;

%Definici�n la funci�n f(x) a minimizar
func = @(x) 2.*x+(3./x);

%Invocamos primero el m�todo bracketing
x0=0.1;
fprintf('\n Bracketing');
[a,b]=bracket(func,x0);

%Ahora invocamos la interpolaci�n parab�lica
tol=1e-4;
fprintf('Interpolaci�n parab�lica [a b]');
[xmin,fmin]=parabInterp(func,a,b,tol);
fprintf('xmin= %4.4f, ymin= %4.4f \n\n', xmin, fmin);

%Dibujamos la funci�n
x=[0:1e-1:6];
%figure(1);
subplot(2,1,1), plot(x,func(x));
xlabel('x');
ylabel('f(x)');
title('Interpolaci�n parab�lica');
grid on;
hold on;
plot(xmin, fmin, 'r*');
hold on;


%Comparamos con el m�todo de Golden Search
fprintf('M�todo de Golden Search \n');
[xmin_GS,fmin_GS]=goldSearch(func,a,b,tol);
fprintf('xmin_GS= %4.4f, ymin_GS= %4.4f \n\n', xmin_GS, fmin_GS);

subplot(2,1,2), plot(x,func(x));
xlabel('x');
ylabel('f(x)');
title('Golden Search');
grid on;
hold on;
plot(xmin_GS, fmin_GS, 'r*');
shg
