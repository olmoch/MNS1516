%% Uso de 'fprintf'
% fprintf es un comando que puede utilizarse para imprimir en pantalla
% tanto texto como variables de un script o una función.

%% Sentencias de formato
% Se usan a lo largo y ancho de MATLAB para especificar el tipo de datos:

% '%s' para 'string'
% '%e' para notación científica
% '%d' para 'integer'
% '%f' para 'float'

%% Modificación del formato
% Podemos cambiar, en el caso de los 'floats', el formato, para evitar
% cadenas demasiado largas de dígitos.

% '%a.bf' devuelve un 'float' con 'a' dígitos iniciales y un máximo de 'b'
% cifras decimales.

%% Formato de cadenas de texto

% \n -> Salto de línea
% \r -> Retorno de carro
% \t -> Tabulación horizontal

%% Uso práctico

A = pi^7*[1,2;3,4]; % Matriz de datos que queremos imprimir, supongamos 2x2.

fprintf('\n A_11 = %f, A_21 = %4.3f, A_12 = %e, A_22 = %2.f \n\n', A)

% Tendríamos como resultado
 
% >> fprintf('\n A_11 = %f, A_21 = %4.3f, A_12 = %e, A_22 = %2.f \n\n', A);
%
%  A_11 = 3020.293228, A_21 = 9060.880, A_12 = 6.040586e+03, A_22 = 12081 
%
% >>