% REPRESENTACION GRAFICA DE FUNCIONES DE 2 DIMENSIONES
clear; clf; close all;

%% Definimos la funci�n vectorizada
f = @(x1,x2) 2+x1-x2+2*x1.^2+2*x1.*x2+x2.^2;

%% Representaci�n gr�fica
% Definimos vectores para x1,x2 en el dominio de representaci�n
x1=linspace(-2,0,40);
x2=linspace(0,3,40);

% Hacemos el mallado (mezclado) para generar las coordenadas (x1,x2)
[x1,x2]=meshgrid(x1,x2);

%% Representaci�n gr�fica 3D de la superficie
% Comandos b�sicos: surf, surfc, mesh, meshc
subplot(121)
surfc(x1,x2,f(x1,x2));
xlabel('x_1'); ylabel('x_2'); zlabel('f(x_1,x_2)');
title('MESH PLOT'); grid on;

%% Representaci�n gr�fica 2D de la superficie
% (proyecci�n en el plano x1,x2)
% Comandos b�sicos: contour, contourf
subplot(122)
cs=contourf(x1,x2,f(x1,x2),10); % Contour con 10 curvas de iso-nivel
clabel(cs); % A�ade los valores sobre las curvas de iso-nivel

xlabel('x_1'); ylabel('x_2');
title('CONTOUR PLOT'); grid on;
shg; % Trae al frente la figura