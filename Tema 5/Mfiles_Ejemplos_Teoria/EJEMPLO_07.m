%% EJEMPLO 07: Aleatorización de listas
% Uso de la función randperm.
% Permutación aleatoria de índices
clear; clc;

CPs=(41005:41012)'
r=randperm(length(CPs));
CPs_rnd=CPs(r)