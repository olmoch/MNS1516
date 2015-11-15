% Este script sirve de ejemplo a las funciones fopen, fclose
% fgetl y fscanf que se presentan en el Tema 1 de Métodos Numéricos
% y simulación. Tambien usa las sentencias de formato. 
% Requiere el archivo tabla-datos.txt
clear;
clc;
%% Importamos los datos del archivo 
% Fíjate que fscanf almacena directamente
% lo datos en variables numéricas así
% que no tenemos que organizarlos
fid=fopen('tabla-datos.txt');
linea1=fgetl(fid);
linea2=fgetl(fid);
linea3=fgetl(fid);
linea4=fgetl(fid);
linea5=fgetl(fid);
I = fscanf(fid,'%f',[1,10]);
salto_linea=fgetl(fid); % Está llamada a fgetl está aquí para leer el 
% carácter \n al final de la línea de los valores de la intensidad
% qye fscanf no lee.
linea=fgetl(fid);
V = fscanf(fid,'%f',[10,34]); % No es [34,10] porque fscanf rellena
% las matrices por columnas
V=V';   % Con esto ponemos la tabla de valores de V como aparece en el 
% archivo Tabla-datos.txt 
fclose(fid);