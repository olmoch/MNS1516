% Este script sirve de ejemplo a las funciones fopen, fclose
% fgetl y fscanf que se presentan en el Tema 1 de Métodos Numéricos
% y simulación. Tambien usa las sentencias de formato. 
% Requiere el archivo tabla-datos.txt
clear;
clc;
fid=fopen('tabla-datos.txt');
linea1=fgetl(fid);
linea2=fgetl(fid);
linea3=fgetl(fid);
linea4=fgetl(fid);
linea5=fgetl(fid);
I = fscanf(fid,'%f',[1,10]);
salto_linea=fgetl(fid); % Está aquí para leer el \n
linea=fgetl(fid);
V = fscanf(fid,'%f',[34,10]);
fclose(fid);
figure(1)
l1=plot(I,V(1,:));
figure(3)
l2=plot(I,V(2,:));
figure(1);
xlabel('I');
