% B�SQUEDA DE UN M�NIMO ESTACIONARIO
% MEDIANTE EL ALGORITMO GOLDEN-SECTION SEARCH
% Objetivo: Aislar el m�nimo de f(x)=1/10*x^2-2*sin(x)
% en el intervalo x=[0,4]

clear; % Borra memoria
clc;   % Borra Command Window
clf;   % Borra gr�ficas que pueda haber abiertas

%% Golden Search
func = @(x) 1/10*x.^2-2*sin(x); % Funci�n coste

a=0.0; b=4.0; % Intervalo unimodal en el que buscar el m�nimo
tol=1e-2;     % Tolerancia para localizar el m�nimo (valor por defecto: 1e-4)

[xMin,fMin,data_out] = goldSearch(func,a,b,tol);

%% Ilustraci�n gr�fica
% Recuperamos informaci�n sobre el proceso de Golden Search
niter=length(data_out(:,1));
a=data_out(:,1);
b=data_out(:,2);
x1=data_out(:,3);
x2=data_out(:,4);
y1=data_out(:,5);
y2=data_out(:,6);

fprintf('*** ILUSTRACI�N GR�FICA *** \n',i);

for i=1:niter
    clf
    x=0:1e-2:4; % Definimos un vector de valores de x
    plot(x,func(x)) % Dibujamos el valor de la funci�n para esos x
    xlabel('x'), ylabel('f(x)') % A�adimos el nombre a los ejes x,y de la gr�fica
    title('GOLDEN SEARCH'); % A�adimos el t�tulo
    hold on; % Congela esa gr�fica para que se puedan superponer despu�s m�s datos
    grid on; % A�ade el grid a la gr�fica
    shg; % Show hidden grahpic (trae hacia delante la figura)
    
    plot(a(i),func(a(i)),'bs',...
        'MarkerEdgeColor','b',...
        'MarkerFaceColor','b',...
        'MarkerSize',8);
    plot(b(i),func(b(i)),'bs',...
        'MarkerEdgeColor','b',...
        'MarkerFaceColor','b',...
        'MarkerSize',8);
    plot(x1(i),y1(i),'ro',...
        'MarkerEdgeColor','b',...
        'MarkerFaceColor','r',...
        'MarkerSize',8);
    plot(x2(i),y2(i),'ro',...
        'MarkerEdgeColor','b',...
        'MarkerFaceColor','r',...
        'MarkerSize',8);
    fprintf('Iteraci�n %i. Pulsa una tecla para continuar... \n',i);
    pause
end