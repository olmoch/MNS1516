% BRACKETING DEL MÍNIMO ESTACIONARIO DE UNA FUNCIÓN
% Objetivo: Acotar el mínimo de f(x)=1/10*x^2-2*sin(x) 
% en el intervalo x=[0,4]

clear; % Borra memoria
clc;   % Borra Command Window
clf;   % Borra gráficas que pueda haber abiertas

%% Bracketing
func = @(x) 1/10*x.^2-2*sin(x); % Función coste

x0 = 0.5; % Definimos el valor inicial de x para buscar la "cuesta abajo"
h0 = 0.1; % Definimos la zancada inicial  (valor por defecto: 0.1)

[a,b,data_out] = bracket(func,x0,h0); % Aplicamos la función "bracket.m"

%% Ilustración gráfica
x=0:1e-2:4; % Definimos un vector de valores de x
plot(x,func(x)) % Dibujamos el valor de la función para esos x
xlabel('x'), ylabel('f(x)') % Añadimos el nombre a los ejes x,y de la gráfica
title('BRACKETING'); % Añadimos el título
hold on; % Congela esa gráfica para que se puedan superponer después más datos
grid on; % Añade el grid a la gráfica
shg; % Show hidden grahpic (trae hacia delante la figura)

fprintf('*** ILUSTRACIÓN GRÁFICA *** \n',i);

% Recuperamos información sobre el proceso de bracketing
niter=length(data_out(:,1));
x1=data_out(:,1);
x2=data_out(:,2);
x3=data_out(:,3);
y1=data_out(:,4);
y2=data_out(:,5);
y3=data_out(:,6);

for i=1:niter
    plot(x1(i),y1(i),'ro',...
        'MarkerEdgeColor','b',...
        'MarkerFaceColor','r',...
        'MarkerSize',8);
    plot(x2(i),y2(i),'ro',...
        'MarkerEdgeColor','b',...
        'MarkerFaceColor','r',...
        'MarkerSize',8);
    plot(x3(i),y3(i),'ro',...
        'MarkerEdgeColor','b',...
        'MarkerFaceColor','r',...
        'MarkerSize',8);
    fprintf('Iteración %i. Pulsa una tecla para continuar... \n',i);
    pause
end