% 
%% Ejercicios tema 0

%% Ejercicio 1
% Crea un vector fila con los numeros pares entre 31 y 75.

%% Ejercicio 2
% Sea x = [ 1 8 6 4]
%
% a) suma 4 a todos los elementos
% b) suma 2 unicamente a los elementos de indice impar
% c) calcula la raiz cuadrada de cada elemento
% d) calcula el cuadrado de cada elemento

%% Ejercicio 3
% Sean x = [8 3 7 1]' e y = [4 3 5 1]' (vectores columna). Calcula
%
% a) la suma de los elementos de x con los de y
% b) eleva cada elemento de x a la potencia de cada elemento de y
% c) divide cada elemento de y entre cada elemento de x
% d) almacena en z la suma de los productos de x e y elemento a elemento
% e) calcula x'*y y comparalo con z
% f) calcula x*y' 

%% Ejercicio 4
% Crea vectores con los elementos
%
% a) 2, 4, 6, 8, ...
% b) 10, 8, 6, 4 , 2, 0, -2, -4, ...
% c) 1, 1/2, 1/3, 1/4, ...
% d) 0, 1/2, 2/3, 3/4, 4/5, ...

%% Ejercicio 5
%_ Una matriz de Hilbert es una matriz cuadrada que tiene por elemento i j a 
%
% 1/(i+j-1)
%
% Escribe una funcion Matlab que genere la matriz de Hilbert de orden n.
% Escribe dos versiones: una con bucles y otra solo con operaciones
% matriciales. Compara el tiempo de calculo de ambas versiones.
%

%% Ejercicio 6
% Crea un vector x cuyo elemento n-esimo vale (-1)^(n+1)/(2*n-1). Suma los
% cien primeros elementos de la serie resultante.

%% Ejercicio 7
%
% Dado un vector t con n elementos escribe las expresiones matlab que
% evaluen correctamente las siguientes expresiones elemento a elemento
%
% a) ln(2+t+t^2)
% b) e^t * (1 + cos( 3*t))
% c) (cos(t))^2 + (sin(t))^2

%% Ejercicio 8
%
% Dada la matriz A = [ 8 5 3; 0 8 4; 1 1 8] escribe los comandos necesarios
% para realizar las siguientes operaciones
% 
% a) asignar la primera fila de la matriz A a un vector x1
% b) asignar la segunda y tercera fila a una matriz B
% c) calcula la suma de cada columna de A
% d) calcula la suma de cada fila de A

%% Ejercicio 9
%
% Dados los arrays x = [ 1 5 7], y = [ 2 5 3] y A = [ 5 1 6; 3 8 9]
% comprueba cual de los siguiente comandos se ejecuta correctamente. En
% caso de que no se ejecute, explica la causa del error.
%
% a) x + y
% b) x + A
% c) x' + y
% d) A - [x' y']
% e) [x; y']
% f) [x; y]
% g) A -3
%


%% Ejercicio 10
%
% Dada la matriz A = [2 7 8 7 ; 3 3 5 6 ; 8 1 7 5] comprueba y explica el 
% resultado de los siguientes comandos
%
%  a) A'
%  b) A(:,[1 4])
%  c) A([2 3],[3 1])
%  d) reshape(A,2,6)
%  e) A(:)
%  f) flipud(A)
%  g) fliplr(A)
%  h) [A; A(:,end)]
%  i) A(1:3,:)
%  j) [A ; A(1:2,:)]
%  k) sum(A)
%  l) sum(A')
%  m) sum(A,2)
%  k) [ [ A ; sum(A) ] [ sum(A,2) ; sum(A(:)) ] ] 

%% Ejercicio 11
%
% Dados dos vectores x = [1 5 3 8 9 0 7] e y = [5 2 4 6 0 0 2] ejecuta
% los siguiente comandos y explica el resultado
% a) x > y
% b) y > x
% c) x == y
% d) x <= y
% e) y <= x
% f) x | y
% g) x & y
% h) x & (~y)
% i) (x > y) | (y > x)
% j) (x > y) & (y > x)

%% Ejercicio 12
%
% Este ejercicio muestra ejemplos de indexacion mediante vectores logicos.
% Sean x = 1:10 e y = [4 7 5 6 0 3 1 8 2 9 ]. Ejecuta e interpreta los
% siguiente comandos
%  a) (x > 3) & (x < 8)
%  b) x(x > 5)
%  c) y(x <= 4)
%  d) x( (x < 2) | (x >= 8) )
%  e) y( (x < 2) | (x >= 8) )
%  f) x(y > 3)

%% Ejercicio 13
%
% El indexado mediante vectores logicos obliga a veces a forzar el tipo de
% algunas operaciones. Por ejemplo, dados los vectores x e y del ejercicio
% anterior y haciendo uso de la funcion rem (resto de la division),
% comprueba los siguiente comandos que tratan de extraer los elementos de y
% cuyos indices coinciden con los de los numeros pares e impares de x
%
% a) y(rem(x,2))
% b) y(logical(rem(x,2)))
% c) y(~rem(x,2))
% d) y(~logical(rem(x,2)))
%

%% Ejercicio 14
%
% Crea el vector x = randperm(35) y evalua para x los valores de la
% siguiente funcion, que debes codificar utilizando indexacion logica
%
% y(x) = 2         if x < 6
%      = x - 4     if 6 <= x < 20
%      = 36 - x    if 20 <= x <= 35
%      = 1         if x > 35

%% Ejercicio 15
%_
% Ejecuta los siguientes comandos de Matlab y explica el resultado
%
% a) v = [1 2 3]; 
% b) A = v'*[ 1 1 1]
% c) B = v*[1 1 1]'
% d) C = [ 1; 1; 1]*v
% d) n=5; m=3; D = ones( n, 1)*(1:m), E = (1:m)'*ones(1, n)

%% Ejercicio 16
%_
% Crea una funcion que reste a cada columna de una matriz A de dimension
% m*n, un elemento de un array (vector) de dimension n (con y sin utilizar 
% bucles).
%

%% Ejercicio 17
%_
% Ejecuta y explica el resultado de las siguientes operaciones
%
% a) A = eye(4), A(1,1), A([1,1])
% b) a = 3, a([1,1]), a([1 1; 1 1]), a( [1, 2] )
% c) v = 1:4, v(:), v( [1,1], :), v( [1 2], :)
% d) vv = v', vv(:), vv(:,[1 1]), vv( :, [1 2])
% e) p = [1 2 3; 4 5 6]', p( [ 1:3, 1:3], [1:2, 1:2])
%

%% Ejercicio 18
%_
% Ejecuta los siguientes comandos
%
% n = 4; A = rand(n); s1 = sum(A), s2 = ones( 1, n)*A 
%
% a) Genera una multiplicacion matricial que proporcione la suma de los
% elementos de cada fila de la matriz A.
%
% b) Genera una multiplicacion matricial que proporciones la suma alternada
% (cambiando el signo de cada sumando) de cada columna de A.
%

%% Ejercicio 19
%_
% Una forma de efectuar transformaciones sobre una matriz consiste en
% realizar esas mismas transformaciones sobre la matriz identidad y luego
% multiplicarla por la matriz original. Hagamos algunos ejemplos con la
% siguiente matriz (creada para que las transformaciones sean evidentes):
%
% n = 4; 
% A = repmat( 1:n, n, 1) + 10*repmat( (1:n)', 1, n);
% A = A + .01
%
% a) Multiplica cada fila por un entero (por ejemplo, el numero de fila).
% Sugerencia: genera la matriz identidad transformada mediante la funcion
% diag). Idem con columnas.
%
% b) Permuta la filas entre si de modo que la fila i-esima vaya a la fila
% dada por el elemento i-esimo de ip = randperm(n). Idem con columnas.
%
