% REPRESENTACION GRAFICA DE FUNCIONES DE 2 DIMENSIONES
clear; clf; close all;

%% Definimos la función vectorizada
f = @(x1,x2) 2+x1-x2+2*x1.^2+2*x1.*x2+x2.^2;

%% Representación gráfica
% Definimos vectores para x1,x2 en el dominio de representación
x1=linspace(-2,0,40);
x2=linspace(0,3,40);

% Hacemos el mallado (mezclado) para generar las coordenadas (x1,x2)
[x1,x2]=meshgrid(x1,x2);

%% Representación gráfica 3D de la superficie
% Comandos básicos: surf, surfc, mesh, meshc
subplot(121)
surfc(x1,x2,f(x1,x2));
xlabel('x_1'); ylabel('x_2'); zlabel('f(x_1,x_2)');
title('MESH PLOT'); grid on;

%% Representación gráfica 2D de la superficie
% (proyección en el plano x1,x2)
% Comandos básicos: contour, contourf
subplot(122)
cs=contourf(x1,x2,f(x1,x2),10); % Contour con 10 curvas de iso-nivel
clabel(cs); % Añade los valores sobre las curvas de iso-nivel

xlabel('x_1'); ylabel('x_2');
title('CONTOUR PLOT'); grid on;
shg; % Trae al frente la figura