%Ejercicio 1. Pr�ctica 4
clc;
clear all;
close all;

%Par�metros que definen el problema
v0=25;
tetha0=(2*pi*50)/360;
y0=1;
g=9.81;

%Definimos la funci�n
ypos= @(x) (tan(tetha0)).*x-(g/(2*v0^2*(cos(tetha0))^2)).*x.^2+y0;
yneg= @(x) -ypos(x); %Para que el min coincida con el m�ximo de 'ypos'

%Invocamos bracketing
x0=0;
fprintf('\n ***Bracketing***');
[a,b] = bracket(yneg,x0);

%Invocamos el m�todo GS
fprintf('\n ***Golden Search***');
tol=1e-2;
[xmin, ymin] = goldSearch(yneg,a,b,tol);
fprintf('xmax = %4.2f m, ymax = %4.2f m \n \n', xmin, -ymin);

%Dibujamos la funci�n
x=[0:1e-1:64];
plot(x,ypos(x));
grid on; 
hold on;
plot (xmin, -ymin, 'r*');
xlabel('x(m)');
ylabel('y(m)');
title('Par�bola de una pelota');
shg;