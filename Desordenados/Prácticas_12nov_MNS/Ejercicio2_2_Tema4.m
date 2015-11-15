%%% Ejercicio 2.2. Clase Pr�ctica 2. Tema 4 %%%

clc;
close all;
clear all;

%Cargamos los datos desde el fichero externo
temp=load('exponencial_exp.txt');
x_exp=temp(:,1);
y_exp=temp(:,2);

%Valores iniciales para el m�todo de minimizaci�n
k0=1;
tau0=1;
param0=[k0 tau0];

%Opciones de minimizaci�n
options=optimset('display','iter','TolX',1e-2,'TolFun',1e-2);

%Invocar a la funci�n fminsearch
[param_min]=fminsearch(@reg_no_lineal,param0,options,x_exp,y_exp);

k_min=param_min(1);
tau_min=param_min(2);

y_fit=k_min*exp(-x_exp/tau_min);

residue=y_fit-y_exp;

%Visualizaci�n
subplot(1,2,1);
plot(x_exp,y_exp,'*');
hold on;
%grid on;
subplot(1,2,1);
plot(x_exp,y_fit,'r-o');
xlabel('Valores experimentales eje x');
ylabel('Valores experimentales eje y');
title('Visualizaci�n datos experimentales');

subplot(1,2,2);
bar(x_exp,residue);
xlabel('Valores exp eje x');
ylabel('Valores residuos');
title('Visualizaci�n valores residuos');
shg;

