%% NOMBRE: OChLl
%% Resumen del ejercicio


%% Importamos los datos
% Se puede usar el comando importada y luego organizar los datos en variables  

datos = importdata('galaxia.txt');

r = datos.data(:,1);
Vc = datos.data(:,2);
Ndatos = datos.data(:,3);
sigma = datos.data(:,4);
sigmay = datos.data(:,5);

%% Ajuste por un polinomio de tercer grado.
% Hay que representar la figura usando el comando errorbar para incluir las
% barras de incertidumbre en el valor de Vc.

errorbar(r,Vc,sigmay,'o');

hold on

xlabel('r (segundos de arco)')
ylabel('V_c (km/s)')
title('Curva de rotación de NGC 7531')

hold off

[pol, S] = polyfit(r,Vc,3);

refcurve(pol);

%% Cálculo de la incertidumbre en los parámetros del ajuste
% Valores de os coeficientes del ajuste
%
% y = p(1) x^3 + p(2) x^2 + p(3)* x + p(4)
%
% * p(1) =    +/- 
% * p(2) =    +/- 
% * p(3) =    +/- 
% * p(4) =    +/- 

avesy = mean(sigmay);

df = S.df; normr = S.normr; valor = normr/sqrt(df);

Covs = avesy.^2.*(inv(S.R)*inv(S.R)');

fprintf('Se tiene que el polinomio interpolador con forma \n\t y = p(1) x^3+ p(2) x^2 + p(3)* x + p(4)\n tiene como coeficientes: \n\t p(1) = %f +/- %f\n\t p(2) = %f +/- %f\n\t p(3) = %f +/- %f\n\t p(4) = %f +/- %f\n', pol(1), sqrt(Covs(1,1)), pol(2), sqrt(Covs(2,2)), pol(3), sqrt(Covs(3,3)), pol(4), sqrt(Covs(4,4)))