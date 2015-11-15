%% EJEMPLO DE MINIMIZACION MULTI-START
% USANDO COMO BASE EL OPTIMIZADOR LOCAL fminsearch
clear; clf; clc;

%% (1) Función a minimizar
f = @(x,y) x.^2+y.^2-10*cos(x*pi/2)-10*cos(y*pi/2);
xl=-4; xh=+4; % Límites inferior (l) y superior (h) de la variable
yl=-4; yh=+4; % Límites inferior (l) y superior (h) de la variable

fx = @(x) f(x(1),x(2)); % Re-definimos con un vector de variables independientes

% Ilustración gráfica de la función
npts = 50; % Número de puntos en el intervalo
x=linspace(xl,xh,npts);
y=linspace(yl,yh,npts);
[x,y]=meshgrid(x,y);

subplot(121); surfc(x,y,f(x,y)); hold on;
xlabel('x'); ylabel('y'); zlabel('f(x,y)');
title('SUPERFICIE');

subplot(122); contourf(x,y,f(x,y),30); hold on;
xlabel('x'); ylabel('y');
title('GRÁFICA DE CONTORNO');
shg;

%% (2) Problema de minimización local ejecutado 1 vez (sin multi-start)
x0=[+2 -3]; % Condición inicial
% Probar otras condiciones iniciales, p.ej. [+1 +1];

options=optimset('display','iter','TolX',1e-1);
[xmin,fmin] = fminsearch(fx,x0,options);
fprintf('\n *** OPTIMIZACION LOCAL *** \n')
fprintf('\n Mínimo encontrado --> fmin = %.1f en (%.1f,%.1f) \n\n',fmin,xmin(1),xmin(2))

% Ilustración gráfica del punto de comienzo y mínimo alcanzado
subplot(121)
plot3(x0(1),x0(2),f(x0(1),x0(2)),'ko','MarkerFaceColor','w','MarkerSize',10);
plot3(xmin(1),xmin(2),f(xmin(1),xmin(2)),'ko','MarkerFaceColor','m','MarkerSize',10);
subplot(122)
plot(x0(1),x0(2),'ko','MarkerFaceColor','w','MarkerSize',10);
plot(xmin(1),xmin(2),'ko','MarkerFaceColor','m','MarkerSize',10);

%% (3) Problema Multi-Start
% optimización local ejecutada N veces
n_run=100; % Número N de veces que se ejecuta el optimizador
xmin=zeros(n_run,2); % Inicializa xmin a una matriz 2xN de ceros
fmin=zeros(n_run,1); % Inicializa fmin a una matriz 1xN de ceros
% En estas matrices se almacenarán los resultados de cada ejecución

for i=1:n_run
    x0=[xl+(xh-xl)*rand yl+(yh-yl)*rand]; % Coordenadas iniciales unif. aleatorias en el dominio
    % Genera números reales aleatorios en (xl,xh) e (yl,yh) para que sirvan
    % como condiciones iniciales
    options=optimset('TolX',1e-1);
    [xmin(i,:),fmin(i)] = fminsearch(fx,x0,options);
    
    % Ilustración gráfica del punto de comienzo y mínimo alcanzado
    subplot(121)
    plot3(x0(1),x0(2),f(x0(1),x0(2)),'ko','MarkerFaceColor','w','MarkerSize',10);
    plot3(xmin(i,1),xmin(i,2),f(xmin(i,1),xmin(i,2)),'ko','MarkerFaceColor','m','MarkerSize',10);
    subplot(122)
    plot(x0(1),x0(2),'ko','MarkerFaceColor','w','MarkerSize',10);
    plot(xmin(i,1),xmin(i,2),'ko','MarkerFaceColor','m','MarkerSize',10);
end

% Los mínimos encontrados están guardados en xmin y fmin
[fmin_min,i]=min(fmin); % Identificamos "el menor de los mínimos" alcanzados
xmin_min=xmin(i,:); % Buscamos el valor de las variables independientes correspondiente

fprintf('\n *** OPTIMIZACION LOCAL CON MULTI-START *** \n')
fprintf('\n Menor mínimo alcanzado --> f(%.1f,%.1f)=%.1f \n\n',...
    xmin_min(1),xmin_min(2),fmin_min);