% B�SQUEDA DE UN M�NIMO ESTACIONARIO
% MEDIANTE LA FUNCI�N PROPIA fminbnd DE MATLAB
% Objetivo: Aislar el m�nimo de f(x)=1/10*x^2-2*sin(x) en el intervalo x=[0,4]
clear; clc;

func = @(x) 1/10*x.^2-2*sin(x);
a=0.0; b=4.0; % Intervalo unimodal en el que buscar el m�nimo

options = optimset('display','iter','TolX',1e-2);
% Define las opciones para la optimizaci�n: mostrar informaci�n de las
% iteraciones, fijar la tolerancia, ...

[xMin,fMin] = fminbnd(func,a,b,options)