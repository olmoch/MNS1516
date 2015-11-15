%
% Este script calcula el potencial de una carga puntual en una cuadricula 
% de puntos. Las posicion debe expresarse en coordenadas cartesianas
%
% rp     posicion de la carga
% rX     coordenadas X de las posiciones de los puntos
% rY     coordenadas Y de las posiciones de los puntos
% q      valor de la carga 
%
% Unidades SI

eps0 = 8.854187817e-12; % permitividad electrica del vacio (F/m)
rp = [0.0 0.0];   % posicion de la carga
q = 1.0;
% coordenadas de los puntos en una matriz de dos columnas. La fila i-esima
% contiene las coordenas X, Y del punto i-esimo
rX = linspace( -1, 1, 20); 
rY = linspace( -1, 1, 20);

% desplegamos las coordenadas en dos matrices (consultar ayuda de MESHGRID)
[RX, RY] = meshgrid( rX, rY);

pot = (1/4/pi/eps0) * q ./ sqrt( (RX - rp(1)).^2 + (RY - rp(2)).^2);

figure('Name','Script');
xlabel('x(m)');
ylabel('y(m)');
zlabel('Potencial(V)')
title('Potencial electrostatico de una carga puntual');
surf( RX, RY, pot);
