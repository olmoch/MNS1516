%% EJEMPLO 08b: Ilustración de algoritmos de generación
% de secuencias pseudo-aleatorias con distribución uniforme

n=1e5; % Longitud del vector aleatorio a generar

%% Algoritmo LCG #2 - Bueno
% From "The Art of Computer Programming" (TAOCP), Vol.2, Knuth
a=2147437301; c=453816693; M=2^31; % Parámetros del LCG
r1=987654321; % Semilla

r=zeros(1,n); r(1)=r1;
% Algoritmo (Regla recursiva)
for i=2:n
    r(i)=rem(a*r(i-1)+c,M); % Genera números en [0,M-1]
end
rn1=r/M; % Normalización de la secuencia al intervalo [0,1]

% Comprobación visual de la secuencia
subplot(221)
plot(rn1(1:n-1),rn1(2:n),'+')
title('GENERADOR LCG BUENO');
xlabel('r(i)'); ylabel('r(i+1)');

subplot(223)
plot3(rn1(1:n-2),rn1(2:n-1),rn1(3:n),'+'); grid on;
title('GENERADOR LCG BUENO');
xlabel('r(i)'); ylabel('r(i+1)'); zlabel('r(i+2)');

%% Algoritmo de rand MATLAB (Mersenne Twister)
rn2=rand(1,n); % Genera números en [0,1]

% Comprobación visual de la secuencia
subplot(222)
plot(rn2(1:n-1),rn2(2:n),'+')
title('GENERADOR DE MATLAB rand');
xlabel('r(i)'); ylabel('r(i+1)');

subplot(224)
plot3(rn2(1:n-2),rn2(2:n-1),rn2(3:n),'+'); grid on;
title('GENERADOR LCG BUENO');
xlabel('r(i)'); ylabel('r(i+1)'); zlabel('r(i+2)');