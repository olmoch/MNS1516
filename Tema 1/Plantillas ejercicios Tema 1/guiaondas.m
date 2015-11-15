%% NOMBRE:
%% Campo el�ctrico dentro de una gu�a de ondas
% En este script se analizan los datos del archivo GuiaOndas.txt Este
% archivo contiene la amplitud E del campo el�ctrico
% medida por una sonda dentro de una gu�a de ondas en funci�n de la
% posici�n s de la sonda. E est� en unidades arbitrarias y s en mm.
% En el ejercicio hay que hacer el ajuste
%
% E = A +B*cos(x)+D*seno(x) ,
%
% que no
% lo proporciona ninguna funci�n de Matlab, as� que hay que hacerlo "a
% mano" usando el procedimiento estudiado en teor�a para hacer ajustes
% lineales generalizados.

%% Importamos los datos


%% Ajuste generalizado
% Ajustamos por 
% 
% y =  A +B*cos(x)+D*seno(x)
%
% con x=4*pi*s/lamda. Por tanto, la matriz de dise�o tiene que tener tres
% columnas, una de unos, otra con los valores de cos(x) y otra con los
% valores de seno(x).


%% Representaci�n gr�fica
% Representamos los datos experimentales y la curva de mejor ajuste

%% Presentaci�n de resultados
% Presentamos los par�metros del ajuste y la amplitud del campo el�ctrico
% de la onda
%
% * A =   +/-
% * B =   +/-
% * D =    +/-
% * E =    +/-


