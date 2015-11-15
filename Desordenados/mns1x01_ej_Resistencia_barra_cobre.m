%% NOMBRE: OChLl
%% Resistencia de una barra de cobre
% En este script se analiza la dependencia de la ca�da de potencial V frente
% a la intensidad I que circula por una barra de cobre. V es la variable
% dependiente, porque en el experimento controlamos la intensidad I y medimos
% la diferencia de potencial V. Sin embargo, imponiendo la misma intensidad
% I no siempre se mide la misma diferencia de potencial V. En los datos que
% se nos proporcionan hay 34 series experimentales diferentes. Us�ndolas
% queremos saber si se cumple la leyr de Ohm V=IR y cu�l es el valor
% de la resistencia R de la barra de cobre con su error.
clear;
clc;

%% Importamos los datos
% AYUDA: Para importar los datos puede usar el script 'ejemplo_fscanf' que 
% encontrar� en la p�gina web de la asignatura.

ejemplo_fscanf

%% C�lculo el valor medio de la d.d.p para cada intensidad
% Tambi�n hay que calcular la desviaci�n est�ndar de las medidas de la ddp 
% para cada intensidad 

nexp = length(V);

Vm = ones(1,nexp)*V.*(1./nexp);
Vstd = std(V);
incV = Vstd./(sqrt(nexp));

%% Gr�fica con barras de error
% Para hacer las gr�ficas con las barras de error hay que usar el 
% comando errorbar(X,Y,L)

errorbar(I,Vm,incV,'xr')

hold on

axis([0 2 0 30])
xlabel('Intensidad (A)')
ylabel('d.d.p. (microV)')
title('Ley de Ohm')

hold off

%% C�lculo de los coeficientes del ajuste usando la funci�n polyfit
% Conocida la recta de mejor ajuste hay que pintarla en la figura anterior

[pol, S] = polyfit(I,Vm,1);

refcurve(pol);

%% Tabla con indices de la calidad del ajuste
% Los valores que presentamos son la indeterminaci�n de la variable 
% independiente sigmay, la norma de los residuos y el coeficiente de correlaci�n
%
% * norma de los residuos =
% * sigma_y  =
% * norma_residuos / grados_libertad = 
% * coef. de correlaci�n = 

sigmay = mean(incV);

r = corrcoef(I,Vm);

df = S.df; normr = S.normr;

div = normr./df;

%% C�lculo de la matriz de covarianzas
% Mostramos en pantalla la matriz de covarianzas calculada a partir de los
% datos devueltos por la funci�n polyfit.

R = S.R;

C = inv(R)*inv(R)';

fprintf('La matriz de covariancias ser�:\n')

covs = sigmay.^2.*C

%% Calculamos la indeterminaci�n de los par�metros de ajuste
% Presentamos los coeficientes del ajuste con su incertidumbre 
%
% * Y = p(1)*x+p(2)
% * p(1) =      +/-
% * p(2) =      +/-

p1  = pol(1); p2 = pol(2);
sp2 = sqrt(covs(2,2));
sp1 = sigmay;

fprintf('Se tiene que V = m*I + n, con \n m = %f +/- %f\n n = %f +/- %f \n', p1, sp1, p2, sp2)