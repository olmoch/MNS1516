%% EJEMPLO 07: Aleatorizaci�n de listas
% Uso de la funci�n randperm.
% Permutaci�n aleatoria de �ndices
clear; clc;

CPs=(41005:41012)'
r=randperm(length(CPs));
CPs_rnd=CPs(r)