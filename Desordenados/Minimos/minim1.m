%% Limpieza previa
clc; clear all; close all;

%% Declaración de constantes

y0 = 1;
v0 = 25;
x0 = 50;
g = 9.81;
theta0 = 2*pi*50/360;
tol = 10^(-3);

%% Definición de función

y = @(x) tan(theta0).*x - g/(2*v0^2*(cos(theta0)^2)).*x.^2+y0; 
y_neq = @(x) -y(x); % Maximizar la de arriba es equivalente a minimizar esta.

%% Método bracketing para acotar la búsqueda del extremo relativo

[a,b] = bracket(y_neq, x0);

%% Método Golden Search para hallar la posición del extremo

[xmin, ymin, data_out] = goldSearch(y_neq,a,b,tol);

%% Visualización

x = linspace(0,100,1001);

plot(x,y(x))

hold on

plot(xmin,-ymin,'x')

hold off



