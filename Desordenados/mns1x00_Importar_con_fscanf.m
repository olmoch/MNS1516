%% Carga del archivo
% Leemos el archivo y lo almacenamos en la variable 'point'.

fileID = fopen('archivo.txt');

%% Lectura de los datos
% En primer lugar utilizamos 'fget' para ir eliminando las l�neas
% introductorias del archivo.

li_1 = fgetl(fileID);
li_2 = fgetl(fileID);
% ...
li_n = fgetl(fileID);

% A partir de ahora vamos guardar los datos que nos interesan utilizando la
% funci�n fscanf.

data_1 = fscanf(fileID,'%f',[r,s]);

% Arriba, utilizamos '%f' para indicar que buscamos valores de tipo float,
% y la matriz '[r,s]' indica el tama�o de la hoja de datos que debe
% rellenar. N�tese que los datos aparecen traspuestos.

li_n1 = fgetl(fileID);

% Saltamos el �ltimo retorno de carro para llegar a la siguiente l�nea.

data_2 = fscanf(fileID,'%s',[1,r]);

% Ahora la matriz est� cambiada ya que solo analiza una fila de columnas,
% lo cual hace correctamente. Adem�s, leemos datos de tipo 'string'.

%% Liberaci�n de variables en desuso
% Para evitar consumo de RAM, cerramos el documento que hemos abierto y 
% no vamos a necesitar de aqu� en adelante. Tambi�n eliminamos las
% variables que se utilizaron para almacenar l�neas de texto.

fclose(fileID);
clear li_1 li_2 li_k

%% Manejo de datos
% Convertimos nuestros datos brutos en algo que podamos utilizar, por
% ejemplo, uniendo tablas, o separ�ndolas.

res = [data_2; data_1'];
c_2 = (data_1(2,:))';

% etc.