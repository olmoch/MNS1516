% BÚSQUEDA DE UN MÍNIMO ESTACIONARIO
% MEDIANTE LA FUNCIÓN PROPIA fminbnd DE MATLAB
% Objetivo: Aislar el mínimo de f(x)=1/10*x^2-2*sin(x) en el intervalo x=[0,4]
clear; clc;

func = @(x) 1/10*x.^2-2*sin(x);
a=0.0; b=4.0; % Intervalo unimodal en el que buscar el mínimo

options = optimset('display','iter','TolX',1e-2);
% Define las opciones para la optimización: mostrar información de las
% iteraciones, fijar la tolerancia, ...

[xMin,fMin] = fminbnd(func,a,b,options)