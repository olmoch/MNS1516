%% EJEMPLO 10: PASEO ALEATORIO (RANDOM WALK)
clear; clf; clc; shg;

N=500;      % Número de pasos de cada paseo
n_exp=1000; % Número de paseos

%% Inicialización
x=zeros(1,N+1); % Coordenada x de cada paso (partiendo de x=0)
y=zeros(1,N+1); % Coordenada y de cada paso (partiendo de y=0)
R=zeros(n_exp,N); % Distancia al origen en cada paso

%% Algoritmo
for j=1:n_exp
    for i=1:N
        ang=2*pi*rand; % Generación del ángulo entre [0,2*pi]
        Dx=1*cos(ang); % Componente incremental en x (radio=1)
        Dy=1*sin(ang); % Componente incremental en y (radio=1)
        x(i+1)=x(i)+Dx;
        y(i+1)=y(i)+Dy;
        R(j,i)=sqrt(x(i+1)^2+y(i+1)^2); % Distancia al origen tras este paso
    end
end
R_rms=rms(R); % Cálculo del valor cuadrático medio (rms --> sqrt(mean(variable^2))

%% Ilustración gráfica
subplot(121)
plot(x,y); hold on; grid on;
plot(x(1),y(1),'k*');
plot(x(N+1),y(N+1),'r*') % Señalamos el 1er y último punto
title('2D RANDOM WALK - PASEO ALEATORIO');
xlabel('x'); ylabel('y');
legend('trayectoria','comienzo','fin');

subplot(122);
plot(1:N,R_rms); hold on; grid on;
plot(1:N,sqrt(1:N),'r-.');
title('DISTANCIA PROMEDIO RESPECTO AL ORIGEN');
xlabel('N'); ylabel('R');
legend('simulación','ecuación teórica','Location','SouthEast');
axis([1 N 1 max(max(R_rms,sqrt(1:N)))]);