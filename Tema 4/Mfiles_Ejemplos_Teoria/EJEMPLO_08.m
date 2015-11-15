% MINIMIZACION DE N VARIABLES USANDO
% LA FUNCION PROPIA DE MATLAB fminsearch
clear; clf; close all;

%% Definición del problema
F1 = @(x,y) (x-0.5).^2.*(x+1).^2+(y+1).^2.*(y-1).^2;
F2 = @(x) F1(x(1),x(2));

x0 = [0 0]; % Vector de valores iniciales
% Prueba con distintas condiciones iniciales [0 0][-0.5 0.5][0 0.5]

options=optimset('display','iter','TolX',1e-4);
[xMin,FMin]=fminsearch(F2,x0,options)

%% Comprobación gráfica
npoints=50; % Número de puntos para x1 y x2
nclines=15; % Número de líneas de contorno a dibujar

x=linspace(-1.5,1.0,npoints); y=linspace(-1.5,1.5,npoints);
[x,y]=meshgrid(x,y);
Z=F1(x,y);

subplot(121); surfc(x,y,Z);
xlabel('x'); ylabel('y'); zlabel('f(x,y)');
title('MESH PLOT');

subplot(122); cs=contourf(x,y,Z,nclines); clabel(cs);
xlabel('x'); ylabel('y');
title('CONTOUR PLOT');
shg;