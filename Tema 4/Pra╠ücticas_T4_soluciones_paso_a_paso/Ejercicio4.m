%Ejercicio 4. Práctica Tema 4
clc;
clear all;
close all;

%Definición los parámetros del problema
q=50;
a=5*1e-3;
k=0.16;
h=20;
Tinf=280;

%Definición la función
T= @(r) q/(2*pi)*((log(r/a)/k)+(1./(h*r)))+Tinf;

%Invocamos bracketing
fprintf('\n ***Bracketing***');
[a_erroneo,b_erroneo]=bracket(T,a);
%OJO POR PRIMERA VEZ HAY QUE CAMBIAR EL VALOR DE h POR DEFECTO
h=1e-4;
[a_inter,b_inter]=bracket(T,a,h);

%Invocamos la función de minimización fminbnd
fprintf('\n ***fminbnd***');
tol=1e-6;
options=optimset('display','iter','Tolx',tol);
[r_min,T_min]=fminbnd(T,a_inter,b_inter,options);
fprintf('r_min= %1.8f mm , T_rmin= %6.3f K \n \n',1e3*r_min, T_min);

%Dibujamos la función
%r=linspace(a,10*a,1e2);
r=[a:1e-6:10*a];
% OJO - El problema sólo tiene sentido para r>a

plot(1e3*r,T(r));
hold on; grid on;
xlabel('r (mm)'); ylabel('T (r)');
title('Temperatura del cable (K)');
plot(1e3*r_min,T_min,'r*');
shg;