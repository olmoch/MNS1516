%% NOMBRE:
%% Resistencia de una barra de cobre
% En este script se analiza la dependencia de la caída de potencial V frente
% a la intensidad I que circula por una barra de cobre. V es la variable
% dependiente, porque en el experimento controlamos la intensidad I y medimos
% la diferencia de potencial V. Sin embargo, imponiendo la misma intensidad
% I no siempre se mide la misma diferencia de potencial V. En los datos que
% se nos proporcionan hay 34 series experimentales diferentes. Usándolas
% queremos saber si se cumple la leyr de Ohm V=IR y cuál es el valor
% de la resistencia R de la barra de cobre con su error.
clear;
clc;
%% Importamos los datos
% AYUDA: Para importar los datos puede usar el script 'ejemplo_fscanf' que 
% encontrará en la página web de la asignatura.
ejemplo_fscanf;

%% Cálculo el valor medio de la d.d.p para cada intensidad
% También hay que calcular la desviación estándar de las medidas de la ddp 
% para cada intensidad 
Vm = [];
for i=1:10
    Vs=sum(V(:,i))/24;
    Vm=horzcat (Vm,Vs);
end
Vstd = std (V);
incV = ones (1,10);
for i=1:10
    incV (i) = Vstd (i)/sqrt (24);
end
%% Gráfica con barras de error
% Para hacer las gráficas con las barras de error hay que usar el 
% comando errorbar(X,Y,L)

errorbar (I,Vm,incV);
hold on
axis([0 2 0 30])
xlabel ('Intensidad (A)')
ylabel ('d.d.p. (micro-V)')
title ('Ley de Ohm')
hold off
%% Cálculo de los coeficientes del ajuste usando la función polyfit
% Conocida la recta de mejor ajuste hay que pintarla en la figura anterior
[p, S] = polyfit (I,Vm,1);

refcurve (p);
%% Tabla con indices de la calidad del ajuste
% Los valores que presentamos son la indeterminación de la variable 
% independiente sigmay, la norma de los residuos y el coeficiente de correlación
%
% * norma de los residuos =
% * sigma_y  =
% * norma_residuos / grados_libertad = 
% * coef. de correlación = 



%% Cálculo de la matriz de covarianzas
% Mostramos en pantalla la matriz de covarianzas calculada a partir de los
% datos devueltos por la función polyfit.



%% Calculamos la indeterminación de los parámetros de ajuste
% Presentamos los coeficientes del ajuste con su incertidumbre 
%
% * Y = p(1)*x+p(2)
% * p(1) =      +/-
% * p(2) =      +/-
