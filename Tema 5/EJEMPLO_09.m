%% EJEMPLO 09: Ilustración del control de repetitividad
clear; clc;

RandStream.setDefaultStream(RandStream('mt19937ar', 'Seed', 5489));
% Resetea la semilla del método twister (función rand, randn y randi) a su estado inicial

r1=rand(1,10) % Genera una secuencia con esa semilla, pero cambia el estado a otra distinta
r2=rand(1,10) % Genera una secuencia con la nueva semilla, por lo que la secuencia no es la misma

RandStream.setDefaultStream(RandStream('mt19937ar', 'Seed', 5489));
% Resetea de nuevo la semilla
r3=rand(1,10) % r3 debe coincidir con r1

% Dado que MATLAB arranca siempre con la misma semilla (5489) como estado inicial siempre obtendremos
% la misma secuencia s1 si usamos la función rand, randn o randi nada más arrancar la sesión
% ¿Cómo evitarlo?
% Usando por ejemplo el reloj del sistema como semilla

RandStream.setDefaultStream(RandStream('mt19937ar','seed',sum(100*clock)));
% Fija la semilla a un valor distinto cada vez
r4=rand(1,10)

RandStream.setDefaultStream(RandStream('mt19937ar','seed',sum(100*clock)));
r5=rand(1,10) % ¿Ha pasado el tiempo suficientemente rápido?
pause(1)

RandStream.setDefaultStream(RandStream('mt19937ar','seed',sum(100*clock)));
r6=rand(1,10) % ¿Y ahora?