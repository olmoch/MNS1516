clear;
clc;
%% Importo los datos usando otro script de ejemplo
% Los datos son los de ejemplo de la Ley de Ohm
ejemplo_fscanf;
%% Grabo ahora los datos en otro archivo
% Voy a grabar los datos en una única tabla de modo que la primera fila 
% sean los valores de la intensidad y las siguientes los valores de 
% voltaje que corresponden a es intensidad
id=fopen('ejemplo_escritura.txt','wt');
fprintf(id,'%4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f \n',I);
fprintf(id,'%4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f %4.3f \n',V');
fclose(id);