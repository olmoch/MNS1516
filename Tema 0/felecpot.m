function pot = felecpot( q, rp, RX, RY)
% Calcula el potencial de una carga puntual en una cuadricula 
% de puntos. Las posicion debe expresarse en coordenadas cartesianas
%
% ARGUMENTOS DE ENTRADA
% rp     posicion de la carga
% RX     coordenadas X de las posiciones de los puntos
% RY     coordenadas Y de las posiciones de los puntos
% q      valor de la carga
%
% ARGUMENTOS DE SALIDA
%
% pot    valores del potencial
%
% Unidades SI
%
eps0 = 8.854187817e-12; % permitividad electrica del vacio (F/m)

pot = (1/4/pi/eps0) * q ./ sqrt( (RX - rp(1)).^2 + (RY - rp(2)).^2);

end