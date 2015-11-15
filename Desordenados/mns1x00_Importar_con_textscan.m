%% Carga del archivo
% Identificamos el archivo que leemos en el mismo directorio con una
% variable dentro de MATLAB.

fileID = fopen('archivo.txt');

%% Variables para el procesado
% Definimos qu� queremos que procese MATLAB.

formatSpec = '%s %f %f %f %[^\n\r]';

% MATLAB buscar� una columna de strings y tres de floats, y nos devolver�
% lo que encuentre en el formato correspondiente.

skipeLines = n;

% Indica que salte las primeras 'n' l�neas.

%% B�squeda de datos
% Decimos a MATLAB que examine el documento en funci�n de los par�metros
% que hemos determinado.

data = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'HeaderLines' ,skipLines, 'ReturnOnError', false);


%% Cierre del archivo

fclose(fileID);