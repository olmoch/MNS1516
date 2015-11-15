% Este script sirve de ejemplo a las funciones fopen, fclose
% fgetl y textscan que se presentan en el Tema 1 de Métodos Numéricos
% y simulación. Tambien usa las sentencias de formato. 
% Requiere el archivo tabla-datos.txt
clear;
clc;
%% Importamos los datos del archivo 
fid=fopen('tabla-datos.txt');
linea1=fgetl(fid);
linea2=fgetl(fid);
linea3=fgetl(fid);
linea4=fgetl(fid);
linea5=fgetl(fid);
cellI = textscan(fid,'%f');
linea=fgetl(fid);
cellV = textscan(fid,'%f %f %f %f %f %f %f %f %f %f');
fclose(fid);
%% Organizamos los datos
% Se trata de pasar los datos de variables tipo celda
% a variables numéricas
I = cellI{1};
V = zeros(34,10);
for k=1:10
    V(:,k)= cellV{k};
end