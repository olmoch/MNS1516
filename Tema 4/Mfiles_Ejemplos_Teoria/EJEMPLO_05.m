% MÉTODOS DE MINIMIZACIÓN EN UNA DIMENSIÓN
% TODOS LOS MÉTODOS SON UNI-MODALES
% Objetivo: Aislar el mínimo global de f(x)=1/10*x^2-2*sin(x)
% en el intervalo x=[-10,10]
clear; clc; clf;

%% Input problem
f = @(x) 1/10*x.^2-2*sin(x); % Defines the function

x0=10; % Initial value to start bracketing of a uni-modal interval
h0=0.1; % Initial step of the bracketing

tol=1e-4; % Tolerance for the minimum isolation

%% Bracketing
fprintf('\n *** BRACKETING *** ')
[a,b] = bracket(f,x0,h0);

%% Golden-section search
fprintf('\n *** GOLDEN-SECTION SEARCH *** ')
[xMin_gs,fMin_gs] = goldSearch(f,a,b,tol);

%% Parabolic interpolation
fprintf('\n *** PARABOLIC INTERPOLATION *** ')
[xMin_pi,fMin_pi] = parabInterp(f,a,b,tol);

%% MATLAB built-in function fminbnd
fprintf('\n *** MATLAB built-in FMINBND *** ')
options = optimset('display','iter','TolX',tol);
[xMin_m,fMin_m] = fminbnd(f,a,b,options)

%% Comprobación gráfica
x=-10:1e-2:10;
plot(x,f(x))
xlabel('x'), ylabel('f(x)')
hold on; grid on; shg
plot(x0,f(x0),'bo') % Dibujo el punto inicial
plot(xMin_gs,fMin_gs,'rs',xMin_pi,fMin_pi,'r*',xMin_m,fMin_m,'r^'); % Dibujo los puntos finales
