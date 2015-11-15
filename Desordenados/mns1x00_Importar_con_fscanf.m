%% Carga del archivo
% Leemos el archivo y lo almacenamos en la variable 'point'.

fileID = fopen('archivo.txt');

%% Lectura de los datos
% En primer lugar utilizamos 'fget' para ir eliminando las líneas
% introductorias del archivo.

li_1 = fgetl(fileID);
li_2 = fgetl(fileID);
% ...
li_n = fgetl(fileID);

% A partir de ahora vamos guardar los datos que nos interesan utilizando la
% función fscanf.

data_1 = fscanf(fileID,'%f',[r,s]);

% Arriba, utilizamos '%f' para indicar que buscamos valores de tipo float,
% y la matriz '[r,s]' indica el tamaño de la hoja de datos que debe
% rellenar. Nótese que los datos aparecen traspuestos.

li_n1 = fgetl(fileID);

% Saltamos el último retorno de carro para llegar a la siguiente línea.

data_2 = fscanf(fileID,'%s',[1,r]);

% Ahora la matriz está cambiada ya que solo analiza una fila de columnas,
% lo cual hace correctamente. Además, leemos datos de tipo 'string'.

%% Liberación de variables en desuso
% Para evitar consumo de RAM, cerramos el documento que hemos abierto y 
% no vamos a necesitar de aquí en adelante. También eliminamos las
% variables que se utilizaron para almacenar líneas de texto.

fclose(fileID);
clear li_1 li_2 li_k

%% Manejo de datos
% Convertimos nuestros datos brutos en algo que podamos utilizar, por
% ejemplo, uniendo tablas, o separándolas.

res = [data_2; data_1'];
c_2 = (data_1(2,:))';

% etc.