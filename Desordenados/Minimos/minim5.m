clc; clear all; close all;

%% Valores de las resistencias en el circuito, y de la fuente de tensión.

E = 120; R1 = 2; R2 = 3.5; R3 = 3.5; R4 = 1.8; R5 = 1.2;

%% Ecuaciones que definen el circuito.

% La función matricial que obtenemos aplicando Kirchhoff es
% [E; 0] = [R1 + R, R3 - R; -R, R + R2 + R4 + R5] * [i1; i2]

% Convertimos R en una variable simbólica.
syms R

% Escribimos la matriz del sistema como función de R, y definimos b como la
% matriz de tensiones.
M(R) = [R1 + R, R3 - R; -R, R + R2 + R4 + R5]; b = [E; 0];

% La matriz de intensidades es la solución del sistema lineal anterior, y
% naturalmente es también función de R.
I(R) = linsolve(M(R),b);

% Definimos ahora la potencia a partir de las intensidades, que hemos
% hallado y llamado I. Para obtener la resta de intensidades hacemos un
% producto vectorial, tomando la adjunta de I y multiplicándola por el
% vector [1; -1]. Después lo elevamos al cuadrado y multiplicamos por R.
f(R) = ((I(R)'*[1,-1]').^2)*R; 

% Ahora hacemos la función que minimizaremos, como una expresión en función
% de R y a partir de la anterior en negativo.
g = @(R) -f(R);

%% Cálculo del extremo.

% Empezamos definiendo el primer punto en el que buscaremos, así como un
% eje y la tolerancia que pediremos.
R0 = 0; tol = 1e-3; ax = linspace(0,5,501);

% Utilizamos goldSearch, pero habiendo previamente comentado todos los
% 'fprintf' que daban error al intentar calcular los valores.
[xmin, Rmin] = goldSearch(g,0,5,tol);

% Representamos lo obtenido.
plot(ax,f(ax),'LineWidth',2)

hold on

plot(xmin,-Rmin,'or','MarkerSize',5,'MarkerEdgeColor','r','MarkerFaceColor','w')
plot([xmin,xmin],[0,-Rmin],'--g')

title('Potencia disipada por R')
xlabel('R (\Omega)')

hold off
ylabel('P (W)')
