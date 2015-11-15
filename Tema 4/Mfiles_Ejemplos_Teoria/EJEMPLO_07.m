% MINIMIZACION EN N DIMENSIONES MEDIANTE EL ALGORITMO DE DOWNHILL SIMPLEX
clear; clf; close all;

%% Definici�n del problema
% Definimos una funci�n vectorizada usando los nombres que deseemos para las
% variables independientes (x1, x2, ...; x, y, ...: a, b, ...)
F1 = @(x1,x2) x1.^2-x1.*x2-4*x1+x2.^2-x2;
% Re-definimos la funci�n en base a un vector (x) de 1xN variables indepedientes
F2 = @(x) F1(x(1),x(2));

x0 = [0 0]; % vector de condiciones iniciales
b = 0.1; % initial edge length of the simplex (default = 0.1).
tol = 1e-4; % error tolerance (default = 1.0e-4)

[xmin,Fmin,niter] = downhill_simplex(F2,x0,b,tol);
% xMin = vector 1xN, donde cada �ndice representa el valor de una
% variable independiente que lleva al m�nimo de la funci�n coste
% Fmin = escalar con el m�nimo de la funci�n coste
% ncycl = escalar que representa el n�mero de iteraciones realizadas

fprintf('\n\n *** DOWNHILL SIMPLEX *** ')
fprintf('\n x1_min = %.4f, x2_min = %.4f, F_min = %.4f ',xmin(1),xmin(2),Fmin)
fprintf('\n obtained after %i iterations \n\n',niter)

%% Comprobaci�n gr�fica
x1=linspace(-5,5,30); x2=linspace(-5,5,30);
[x1,x2]=meshgrid(x1,x2);
Z=F1(x1,x2);

subplot(121);
surfc(x1,x2,Z);
xlabel('x_1'); ylabel('x_2'); zlabel('f(x_1,x_2)');
title('MESH PLOT');

subplot(122);
cs=contourf(x1,x2,Z); clabel(cs);
xlabel('x_1'); ylabel('x_2');
title('CONTOUR PLOT'); grid;
shg;