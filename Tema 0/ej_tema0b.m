%% Ejercicios tema 0 - segunda parte
%
% Gran parte de los ejercicios de este fichero estan tomados del Hanh &
% Valentine (Essential Matlab for Engineers and Scientist).
%

%% Ejercicio 1
%
% Dibuja un grafico de la poblacion de EEUU desde 1970 a 2000 usando la
% curva teorica
%
% P(t) = 19727300/( 1 + exp( -0.03134*(t - 1913.25) ) )
%
% Los datos reales de poblacion cada decada desde 1790 hasta 1950 (por 
% decadas) son:
%
% 3929, 5308, 7240, 9638, 12 866, 17 069, 23 192, 31 443, 38 558, 50 156,
% 62948, 75995, 91972, 105711, 122775, 131669, 150697. 
%
% Dibuja estos datos sobre el modelo teorico con circulos (sin unir)
%

%% Ejercicio 2
%
% La espiral de Arquimedes se representa en coordenadas polares por 
%
% r = a t
%
% donde r es la distancia al origen de coordenadas y t el angulo con el
% eje X y a una constante. Escribe un script que dibuje espirales de
% Arquimedes para varios valores de a.
%

%% Ejercicio 3
%
% Otro tipo de espiral es la espiral logaritmica, dada por 
%
% r = a q^t
%
% con a > 0 y q > 1. Dibuja esta espiral para varios valores de a.

%% Ejercicio 4
%
% La disposicion de semilla en un girasol (y otras flores, tales como las
% margaritas) sigue un modelo matematico. La semilla n-esima esta en la
% posicion 
%
% r = sqrt(n)
%
% t = pi*d*n/180 (d en grados, t en radianes)
%
% donde d es un valor angular constante de separacion entre dos semillas
% consecutivas. Prueba el valor d = 137.51º y dibuja un circulo para cada
% semilla en un grafico polar. Prueba tambien los valores 137.45º, 137.65º,
% 137.92º.
%

%% Ejercicio 5
%
% La ecuacion de una elipse en coordenadas polares es 
%
% r = a*( 1 - e^2)/( 1 - e*cos(t))
%
% donde a es el semieje mayor y e es la excentricidad, estando un foco en
% el origen de coordenadas y el semi-eje mayor se extiende a lo largo del
% eje X. El cometa Halley se mueve en una orbita eliptica en torno al Sol
% con semieje mayor de 17.0 AU (unidades astronomicas) y excentricidad
% 0.977276. Representa graficamente la orbita del cometa Halley y la de la
% Tierra (aproximandola por una circunferencia).
%

%% Ejercicio 6
%
% Una relacion iterativa que se ha estudiado mucho ultimamente es 
%
% y(k+1) = r*y(k)*(1-y(k))
%
% Dados y(1) y r, se pueden calcular terminos a voluntad. Representa y(k)
% frente a k (con circulos). Prueba con r = 3.3, 3.5, 3.5668, 3.575,
% 3.5766, 3.738, 3.8287.
%

%% Ejercicio 7
%
% Se puede generar una figura fractal muy bonita dibujando los puntos
% (x(k), y(k)) producidas por aplicacion de las expresiones
%
% x(k+1) = y(k)*( 1 + sin( 0.7 * x( k))) - 1.2*sqrt( abs( x( k)))
%
% y(k+1) = 0.21 - x(k)
%
% Representa la figura resultante.

%% Ejercicio 8
%_
% Dibuja en un grafico polar las equipotenciales y lineas de campo de un
% dipolo electrico situado en el origen de coordenadas y dirigido a lo
% largo del eje z.
%
% Las equipotenciales vienen dadas por 
%
% cos(t) = A r^2
%
% con A una constante distinta para cada linea
%
% y las lineas de campo por
% 
%  r = B*(sen(t))^2
%
% con B una constante distinta para cada linea.
%

%% Ejercicio 9
%_
% Dibuja el potencial de un dipolo electrico situado en el origen de 
% coordenadas y la direccion del eje z en curvas de nivel para el
% plano x = 1.
%
% El potencial de un dipolo en la direccion del eje z viene dado por 
%
% v(x,y,z) = z / (x^2+y^2+z^2)^(3/2)
%
% en unidades arbitrarias.
%

%% Ejercicio 10
%_
% Dibuja el potencial de un dipolo electrico en distintos planos por medio
% de la funcion slice ( ver ejemplo en
%
% http://www.mathworks.es/products/matlab/demos.html?file=/products/demos/shipping/matlab/graf2d2.html)
% 
% en los planos x=0.1, y = 0.1, z=0.1, z= 0.9. El rango de representacion
% debe ser x = y = z = 0.1:0.05:1
