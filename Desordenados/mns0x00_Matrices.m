%% Tema 0

%% Construcci�n de matrices

A = eye(4); % Matriz identidad 4x4.
B = ones(3,5); % Matriz de unos, de 3 filas y 5 columnas. �dem para las funciones 'zeros' y 'rand'.
xs = linspace(0,10,5); % Vector fila de 5 valores equiespaciados entre 0 y 10.

%% Operaciones sobre matrices

% y = M x  ->  x = M\y;

% y = x M  ->  x = y/M;

% Con un '.', las operaciones son elemento a elemento. Por ejemplo,
% A*B = A�B
% A.*B = (a_ii * b_ii)

% A' es la traspuesta de A.

% Se pueden concatenar matrices como [A, B], o [A'; B']

%% El operador ':'

A(1:3,2); % Extrae los valores A(1,2), A(2,2), A(3,2). Puede usarse A(:,2) para toda la longitud.
1:7; % Sucesi�n aritm�tica de diferencia 1.
7:0.25:13; % �dem, pero con diferencia 0.25.

%% Operaciones l�gicas

% A(A>3) devuelve las celdas de A que cumplen el predicado.
% A(B<0) devuelve las celdas de A tales que la celda equivalente en B
% cumple el predicado.

% Tambi�n podemos construir la matriz 
% prop = f(y) ~ g(x)
% que devolver� una matriz de ceros y unos en funci�n de la relaci�n
% binaria que queramos entre f(y_ij) y g(x_ij).