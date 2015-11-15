%% NOMBRE:
%% Campo eléctrico dentro de una guía de ondas
% En este script se analizan los datos del archivo GuiaOndas.txt Este
% archivo contiene la amplitud E del campo eléctrico
% medida por una sonda dentro de una guía de ondas en función de la
% posición s de la sonda. E está en unidades arbitrarias y s en mm.
% En el ejercicio hay que hacer el ajuste
%
% E = A +B*cos(x)+D*seno(x) ,
%
% que no
% lo proporciona ninguna función de Matlab, así que hay que hacerlo "a
% mano" usando el procedimiento estudiado en teoría para hacer ajustes
% lineales generalizados.

%% Importamos los datos


%% Ajuste generalizado
% Ajustamos por 
% 
% y =  A +B*cos(x)+D*seno(x)
%
% con x=4*pi*s/lamda. Por tanto, la matriz de diseño tiene que tener tres
% columnas, una de unos, otra con los valores de cos(x) y otra con los
% valores de seno(x).


%% Representación gráfica
% Representamos los datos experimentales y la curva de mejor ajuste

%% Presentación de resultados
% Presentamos los parámetros del ajuste y la amplitud del campo eléctrico
% de la onda
%
% * A =   +/-
% * B =   +/-
% * D =    +/-
% * E =    +/-


