%% Tema 0 - Breve introduccion a Matlab. 
% METODOS NUMERICOS Y DE SIMULACION - Curso 2015-2016. 
% Segundo curso del Grado en Fisica. Universidad de Sevilla.

%%
% 
% <<blanco.png>>
% 

%% El entorno Matlab
% 
% La siguiente figura muestra los elementos mas habituales del entorno 
% Matlab
%
% * Directorio de trabajo
% * Ventata de comandos interactiva (_command window_).
% * Editor (escribir texto)
% * _Workspace_ (visor de variables)
% * Historial de comandos (_command history_)
% * El entorno Matlab contiene todo lo necesario para trabajar con
% archivos (listar, comprimir *en zip*, etc). No suele ser necesario salir al
% sistema operativo (windows, etc).
%
% <<pantallamatlabeditada.png>>
%
% <<blanco.png>>

%% El elemento basico de Matlab es la matriz
%  
% * Un _vector_ (_array_) es una matriz de UNA *fila* o una *columna*.
% * Incluso un *escalar* es un matriz 1x1
% * Accedemos a los elementos mediante subindices fila, columna.
% * Las matrices se organizan *internamente* por columnas.
%
% <<repinternamatriz.png>>
%

A = [1 2 3; 4 5 6; 7 8 9] % introduccion de una matriz por teclado
vf = [1 2 3]              % un vector fila
vc = [1;4;7]              % un vector columna
a  = 5                    % un escalar
whos A vf vc a            % nos muestra que es cada variable
A(1,2)                    
vf(2)
vc(3)
A, A(4), A(7)             % La matriz A referenciada con un solo indice
B = []                    % matriz vacia
whos B

%%
% 
% <<blanco.png>>
% 

%% Operaciones con matrices
%
% * *Suma*, *resta*, *multiplicacion*, *traspuesta* y 
%    *multiplicacion por un escalar* y *potenciacion a un escalar* 
% coinciden con sus definiciones habituales en matematicas.
At = A'          % traspuesta                                                       
B = At*10        % multiplicacion por un escalar                                                       
A + B            % suma de matrices
A - B            % resta de matrices
A*B              % producto de matrices
B*A              % no conmutativo, en general
A*A, A^2         % potenciacion
%vf + vc          % suma de matrices de distinta dimension (!ERROR!)
vf + vc'         % 
vf*vc            % matriz 1x3 por matriz 3x1: matriz 1x1
vc*vf            % matriz 3x1 por matriz 1x3: matriz 3x3

%%
% 
% <<blanco.png>>
% 

%% Division de matrices
%
% * Las _divisiones_ de matrices equivalen a multiplicar por la inversa.
% * Division izquierda \
% * Division derecha   /
C = [2 -2 1; -1 1 1; -1 3 5]
Ci = inv(C)      % inversa de A
Ci*C             % multiplicacion por la inversa
C*Ci             %              
Ci*B             %              
C\B              % division IZQUIERDA
B*Ci             %
B/C              % division DERECHA
% sea el sistema de ecuaciones C*x = vc
x = C\vc         % resolucion de sistemas de ecuaciones lineales
C*x
vc

%%
% 
% <<blanco.png>>
% 

%% Operaciones elemento a elemento
%
% * Es posible multiplicar y dividir las matrices *elemento a elemento*.
% * En tal caso se utilizan como simples tablas de numeros.
% * Las operaciones elemento a elemento son .*, ./, .\, .^.
% * Logicamente, requieren *las misma dimensiones* en ambas matrices.

A, B, A.*B       % multiplicacion elemento a elemento
A, B, A./B       % division de cada elemento de A entre c.e. de B
A, B, A.\B       % division de cada elemento de B entre c.e. de A
vc.^(vf')        % potenciacion (observese el parentesis)

%%
% 
% <<blanco.png>>
%

%% Creacion de matrices 
%
% * La creacion de matrices por teclado solo es valida para dimensiones
% reducidas.
% * Matrices mayores se crean normalmente mediante *funciones* de Matlab.
% * Tambien pueden crearse a partir de la yuxtaposion de otras.
M0 = zeros(3,4)       % matriz de ceros
M1 = ones(4,3)        % matriz de unos
Mi = eye(5)           % matriz unidad 5x5
Mr = rand(3,4)        % matriz 3x4 con elementos aleatorios entre 0 y 1
My = [Mi [M1; [1 1 1]]] % matriz construida con trozos de otras
Mt = repmat( [1 2; 3 4], 2 ,3) % matriz de matrices
v1 = 1:0.1:2           % *operador dos puntos*
v2 = 1:10
v3 = 10:-1:1
v4(7) = 3             % se crean los elementos necesarios para que tenga sentido
v5 = linspace( 0, 3, 7) % la funcion linspce genera valores equiespaciados

%%
% 
% <<matriz1.png>>
% 
% <<matriz2.png>>
% 
% <<blanco.png>>
%

%% Tipos de datos
%
% * Los elementos de la matrices son por defecto *doubles* (numeros de coma
% flotante de doble precision).
% * Existen valores especiales *NaN* (not a number), *Inf* (infinity), 
% *-Inf*.
% * Tambien existen los enteros (*integer*), flotantes de precision simple
% (*float*) y los booleanos (*logical*, con valores _true_ o _false_ *representados por 1 y 0 respectivamente*).
% * Existen las versiones complejas de los float, doubles y enteros.
a = 3
whos a              % por defecto, las matrices contienen doubles
ai = int32(a)       % se puede forzar a que sean enteros
whos ai
l1 = true, l2 = logical(1)    % variable logica
whos l1 l2
M = rand(3)
lM = M > 0.5        % de operaciones logicas se obtienen matrices logicas
1/0, -1/0, 0/0      % Inf, -Inf y NaN
1/Inf, 1/NaN
1+3i, 1i, 1i^2      % numeros complejos y unidad imaginaria
a = true	    % variable logica con valor verdadero: la representa por 1
b = false           % variable logica con valor falso: la representa por 0

%%
% 
% <<blanco.png>>
% 

%% Indexacion de matrices mediante arrays enteros y logicos
%
% * Se pueden seleccionar elementos de las matrices usando como indices
% otras matrices logicas o enteras.
% * La indexacion con matrices enteras produce una matriz con los elementos
% correspondientes a tales valores de los indices.
% * La indexacion con matrices logicas devuelve los elementos en los que el
% indice toma el valor _true_ (1).
% * Estos tipos de indexacion, aunque muy concisos y elegantes, pueden dar 
% lugar a codigos muy confusos por lo que hay que usarlos con precaucion.
%
% <<indexacionmatrices1.png>>
%
%
% <<indexacionmatrices2.png>>
%

A = [11 12 13; 21 22 23; 31 32 33]
A( [1 3],:)      % filas 1 y 3. Todas las columnas (operador :)
A( [1 3], [1 2]) % columnas 1 y 2 de las filas 1 y 3
A( [1 3; 5 7])   % elementos 1, 3, 1, 2 de A (en representacion interna)
% igual a [ A(1) A(3); A(5) A(7)]
A( [1 1 1 1 1],:) % la fila 1 cinco veces
A(:)              % todos los elementos de A en una columna
A(3:end)          % los elementos de A desde el tercero al ultimo
%B = rand(3)      % matriz 3x3 con elementos aleatorios
B = [    0.7317    0.5470    0.1890
        0.6477    0.2963    0.6868
        0.4509    0.7447    0.1835
    ]

L = B > 0.5      % matriz logica con valor true donde el elemento de B > 0.5
B(L)             % conjunto de elementos mayores que 0.5 (en columna)
C = zeros( size( B)) % matriz de ceros con las mismas dimensiones que C
C(L) = B(L)-1   % a los elementos mayores que 0.5 les restamos de 1
disp('Version con matrices logicas')
C
% version con bucles
[n, m] = size( C);
for i = 1:n
    for j = 1:m
        if B(i,j) > 0.5
            C(i,j) = B(i,j) - 1;
        else
            C(i,j) = B(i,j);
        end
    end
end
disp('Version con bucles')
C

%%
% 
% <<blanco.png>>
% 

%% Cuestion 1
%
% Un grupo de 20 estudiantes (numerados del 1 al 20) ha realizado dos 
% examenes parciales con las calificaciones recogidas en la tabla de mas
% abajo. La nota global se obtiene mediante la media aritmetica aumentada 
% con las  siguientes normas:
% 
% * Se exige al menos un cuatro en ambos parciales para aprobar, obteniendo
% un 4 como nota media si no se cumple esta condicion
% * Si tiene mas de un 6 en ambos parciales se le regala un punto extra
% sobre la media aritmetica.
% * A los alumnos 3, 12 y 19 se les quita un punto de la nota final porque
% se copiaron un problema.
% * No se admiten notas superiores a 10.
%
%  N   p1      p2
%  1    2.2    1.1
%  2    1.1    0.6
%  3    4.0    4.5
%  4    3.7    7.6
%  5    6.3    7.7
%  6    9.3    9.7
%  7    1.9    1.4
%  8    7.0    0.9
%  9    5.3    5.3
% 10    8.6    4.8
% 11    3.9    6.7
% 12    7.4    5.2
% 13    3.5    1.5
% 14    5.9    2.6
% 15    0.4    7.5
% 16    2.4    4.4
% 17    6.9    3.6
% 18    7.4    3.9
% 19    6.8    7.0
% 20    4.4    0.2

%%
% 
% <<blanco.png>>
%

%% Otros tipos de datos
%
% * Cadenas de caracteres.
% * Estructuras (_struct_).
% * Matrices de celda (_Cell arrays_).

%%
% 
% <<blanco.png>>
%

%% Cadenas de caracteres
%
% Son matrices de caracteres.
%
c1 = 'fulano'                    % creacion de una cadena
c2 = ['fulano', 'mengano']       % concatenacion
%c3 = ['fulano'; 'mengano']       % erroneo: distintos numeros de elementos
c3 = char('fulano','mengano')    % la funcion char arregla el problema
whos c1 c2 c3

%%
% 
% <<blanco.png>>
%

%% Estructuras
%
% Son agrupaciones de datos bajo un mismo nombre. Hagamos como ejemplo una
% estructura para los elementos de la tabla periodica.
clear elem;
elem.simbolo = 'H';         % especificamos los campos mediante el operador .
elem.mp      = 1.00794;
elem, whos elem
elem(2).simbolo = 'He';     % podemos añadir mas elementos
elem(2).mp      = 4.002602;
elem, whos elem
elem.simbolo

%%
% 
% <<blanco.png>>
%

%% Matrices de celdas (_cell arrays_)
%
% Son matrices de elementos *de distintos tipos*. Sus elementos se denotan
% con llaves.
%
mc{1} = 'fulano';
mc{2} = [1 2 3];
mc{3} = rand(3);
mc, whos mc
% tambien se pueden crear de forma analoga a los vectores y matrices
mc2 = { 'fulano', [1 2 3], rand(3)};
mc2, whos mc2
% reservar memoria para celdas: funcion cell
mc3 = cell( 1,3);
% ahora podemos rellenar elemento a elemento
mc3{1} = 'fulano';
mc3{2} = [1 2 3];
mc3{3} = rand(3);

%%
% 
% <<blanco.png>>
%

%% Control de flujo 
%
% El flujo del programa es el orden en el cual se ejecutan las
% instrucciones. El flujo se controla mediante bifurcacions (*if*) y bucles
% (*for*, *while* combinado con *break* y *continue*). En Matlab, *no suele
% ser necesario utilizar bucles para realizar operaciones elemento a
% elemento sobre las matrices*. Revisamos el bucle *for*.
%
for i = 1:5
    i
end
% bucle sobre una matriz 
A = [ 11 12 13; 21 22 23; 31 32 33];
[m,n] = size( A);
for i = 1:m
    for j = 1:n
        fprintf('El elemento fila %d columna %d vale %3.1f\n', i,j,  A(i,j));
    end
end
%
% Consultar 'Aprenda Matlab ...' (capitulo 6) para repasar el resto de 
% bifurcaciones y bucles.

%%
% 
% <<blanco.png>>
%

%% Scripts y funciones
%
% Las ordenes de Matlab se organizan en
%
% * Sesion interactiva, tecleando directamente sobre la ventana de comandos.
% * Archivos con conjuntos de comandos (*archivos de _script_*),
% equivalentes a escribir los comandos en sesion interactiva. *Las
% variables de un script son accesibles desde el espacio Matlab*.
% * *Funciones*, con argumentos de entrada y de salida y con variables
% _internas_ a la funcion. *Las variables de una funcion no son accesibles
% desde el espacio Matlab* (exceptuando los argumentos de salida).
% * Cada funcion debe estar contenida en su propio fichero .m.
% * Los argumentos de entrada *NO SE MODIFICAN* en la funcion.
% * Aprovechamos para mostrar una importante herramienta denominada
% _debugger_.
edit elecpot.m            % vemos la fuente del script en el editor
elecpot                   % ejecutamos el script
edit felecpot.m           % vemos la fuente de la funcion en el editor

figure('Name','Script');
surf( RX, RY, felecpot( q, rp, RX, RY));
xlabel('x(m)');
ylabel('y(m)');
zlabel('Potencial(V)')
title('Potencial electrostatico de una carga puntual');

figure('Name','Funcion'); 
surf( RX, RY, felecpot(  q, rp+[ 0.5,0], RX, RY) + ...
                      felecpot( -q, rp+[-0.5,0], RX, RY) );
xlabel('x(m)');
ylabel('y(m)');
zlabel('Potencial(V)')
title('Potencial electrostatico de dos cargas puntuales');
%%
% 
% <<blanco.png>>
%

%% Funciones anonimas
%
% Son funciones definidas en una linea. Por ejemplo
%
f = @(A,w,V0,t) A*sin(w*t) + V0; % funcion anonima
A = 1.0; w = 1e6; V0 = 0;
g = @(t) f( A, w, V0, t);
t = linspace( 0, 2*pi/w*3);
figure('Name','Ejemplo de funcion anonima');
plot( t, g(t));
title( get( gcf, 'Name' ));
%%
% 
% <<blanco.png>>
%

%% Obtener ayuda en Matlab
%
% * Tecleando _*help* nombrefuncion_ se obtiene ayuda sobre la funcion. El
% texto de esta ayuda esta escrito al principio del fichero de la funcion.
% * Tecleando _*doc* nombrefuncion_ se abre la documencation de Matlab por
% la pagina referente a la funcion.
% * Si mientras se escribe se pulsa la tecla tabulador, Matlab nos muestra
% una lista de las funciones cuyo nombre comienza con las letras ya
% escritas.
% * La tecla de flecha hacia arriba re-escribe los comandos tecleados
% anteriormente (los contenidos en el historial).

help meshgrid
edit meshgrid
doc meshgrid

%% Recomendaciones de programacion
%
%
% * Todo codigo debe partir de un claro planteamiento previo: no esperemos
% encontrar el planteamiento sobre la marcha.
% * La prioridad a la hora de programar es que el codigo sea  *claro* y lo 
% mas sencillo posible. 
% * Deben utilizarse operaciones matriciales en lugar de bucles siempre que
% sea posible (y no compliquen el codigo).
% * Si el codigo se va a utilizar una o dos veces conviene un archivo de
% script mas que una funcion.
% * Una funcion debe ser logica y clara mas alla del codigo en que se
% inserta y debe aspirar a ser mas general. No tiene sentido hacer
% funciones con trozos arbitrarios de codigo.
% * Siempre que sea posible debe utilizarse una funcion de biblioteca en
% lugar de programarla nosotros/as mismos/as.
%

