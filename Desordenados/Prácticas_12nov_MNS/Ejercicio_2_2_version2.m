%% Ejercicio 2.2. Tema 4
clear;
clf;
clc;
close all;
%%
% Importamos los datos
%datos = importdata('exponencial_exp.txt');
datos = load('exponencial_exp.txt');
x_exp = datos(:,1);
y_exp = datos(:,2);


% Definimos la función a minimizar
Res = @(k,tau) sum ((y_exp - k.*exp(-x_exp/tau)).^2);

Resx = @(x)Res(x(1),x(2));

%%
% fminsearch    
 x0 = [1,1];
options = optimset('display', 'iter', 'TolX', 1e-2, 'TolFun', 1e-2);
[xmin,Resmin] = fminsearch(Resx, x0, options);
% 
%
k_min=xmin(1);
tau_min=xmin(2);

y_fit=k_min*exp(-x_exp/tau_min);

residue=y_fit-y_exp;

%Visualización
subplot(1,2,1);
plot(x_exp,y_exp,'*');
hold on;
%grid on;
subplot(1,2,1);
plot(x_exp,y_fit,'r-o');
xlabel('Valores experimentales eje x');
ylabel('Valores experimentales eje y');
title('Visualización datos experimentales');

subplot(1,2,2);
bar(x_exp,residue);
xlabel('Valores exp eje x');
ylabel('Valores residuos');
title('Visualización valores residuos');
shg;


