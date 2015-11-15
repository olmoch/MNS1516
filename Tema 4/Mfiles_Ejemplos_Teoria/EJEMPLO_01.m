% BRACKETING DEL M�NIMO ESTACIONARIO DE UNA FUNCI�N
% Objetivo: Acotar el m�nimo de f(x)=1/10*x^2-2*sin(x) 
% en el intervalo x=[0,4]

clear; % Borra memoria
clc;   % Borra Command Window
clf;   % Borra gr�ficas que pueda haber abiertas

%% Bracketing
func = @(x) 1/10*x.^2-2*sin(x); % Funci�n coste

x0 = 0.5; % Definimos el valor inicial de x para buscar la "cuesta abajo"
h0 = 0.1; % Definimos la zancada inicial  (valor por defecto: 0.1)

[a,b,data_out] = bracket(func,x0,h0); % Aplicamos la funci�n "bracket.m"

%% Ilustraci�n gr�fica
x=0:1e-2:4; % Definimos un vector de valores de x
plot(x,func(x)) % Dibujamos el valor de la funci�n para esos x
xlabel('x'), ylabel('f(x)') % A�adimos el nombre a los ejes x,y de la gr�fica
title('BRACKETING'); % A�adimos el t�tulo
hold on; % Congela esa gr�fica para que se puedan superponer despu�s m�s datos
grid on; % A�ade el grid a la gr�fica
shg; % Show hidden grahpic (trae hacia delante la figura)

fprintf('*** ILUSTRACI�N GR�FICA *** \n',i);

% Recuperamos informaci�n sobre el proceso de bracketing
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
    fprintf('Iteraci�n %i. Pulsa una tecla para continuar... \n',i);
    pause
end