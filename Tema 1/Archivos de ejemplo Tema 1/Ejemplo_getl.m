% Este script sirve de ejemplo a las funciones fopen, fclose
% y fgetl que se presentan en el Tema 1 de M�todos Num�ricos
% y simulaci�n. Requiere el archivo tabla-datos.txt
clear;
clc;
fid=fopen('Tabla-datos.txt');
linea1=fgetl(fid);
linea2=fgetl(fid);
linea3=fgetl(fid);
linea4=fgetl(fid);
linea5=fgetl(fid);
fclose(fid);