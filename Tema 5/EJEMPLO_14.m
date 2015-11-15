%% EJEMPLO 14: Integraci�n por rechazo
% Determinar el valor de pi a partir de una integraci�n 2D
% Estanque circular de radio r inscrito en un cuadrado de lado 2*r
clear; clf;

N=1e5; % N�mero de evaluaciones de la integral
r=1;   % Radio del c�rculo

%% M�todo de rechazo (Monte Carlo)
x=-r+2*r*rand(1,N); % Generaci�n de secuencia aleatoria en [-r,+r]
y=-r+2*r*rand(1,N); % Generaci�n de secuencia aleatoria en [-r,+r]
d=sqrt(x.^2+y.^2);

Nsamp=sign(d-r); % Si Nsamp(i)=-1 la muestra est� dentro del �rea
                 % Si Nsamp(i)=+1 la muestra est� fuera del �rea

coord_pond=find(Nsamp==-1); % �ndices de las coordenadas iguales a -1 (dentro del c�rculo)
coord_box=find(Nsamp==+1);  % �ndices de las coordenadas iguales a +1 (fuera del c�rculo)

N_pond=length(coord_pond); % N�mero de piedras en el estanque
N_box=length(coord_box);   % N�mero de piedras en la caja y fuera del estanque

A_box=(2*r)^2; % Area del cuadrado de lado 2 (2r*2r=4)
A_pond=N_pond/N*A_box; % Area estimada del c�rculo (pi*r^2)

pi_approx=A_pond/r^2;
fprintf('\n pi(approx) = %.8f \n\n', pi_approx);

plot(x(coord_pond),y(coord_pond),'.b','MarkerSize',0.1); hold on;
plot(x(coord_box),y(coord_box),'.r','MarkerSize',0.1);
title(sprintf('pi(approx) =  %.8f (N = %.2e)',pi_approx,N));
axis([-r +r -r +r])
axis equal;
shg;