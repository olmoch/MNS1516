% B�SQUEDA DE UN M�NIMO ESTACIONARIO
% MEDIANTE EL ALGORITMO DE INTERPOLACI�N PARAB�LICA
% Objetivo: Aislar el m�nimo de f(x)=1/10*x^2-2*sin(x) 
% en el intervalo x=[0,4]

clear; % Borra memoria
clc;   % Borra Command Window
clf;   % Borra gr�ficas que pueda haber abiertas

%% Interpolaci�n Parab�lica
func = @(x) 1/10*x.^2-2*sin(x);

a=0.0; b=4.0; % Intervalo unimodal en el que buscar el m�nimo
tol=1e-2; % Tolerancia para localizar el m�nimo (valor por defecto: 1e-4)

[xMin,fMin,data_out] = parabInterp(func,a,b,tol);

%% Ilustraci�n gr�fica

% Recuperamos informaci�n sobre el proceso de Interpolaci�n Parab�lica
niter=length(data_out(:,1));
x1=data_out(:,1);
x2=data_out(:,2);
x3=data_out(:,3);
x4=data_out(:,4);
y1=data_out(:,5);
y2=data_out(:,6);
y3=data_out(:,7);
y4=data_out(:,8);

fprintf('*** ILUSTRACI�N GR�FICA *** \n',i);

for i=1:niter
    clf
    x=a:1e-2:b; % Definimos un vector de valores de x
    plot(x,func(x)) % Dibujamos el valor de la funci�n para esos x
    xlabel('x'), ylabel('f(x)') % A�adimos el nombre a los ejes x,y de la gr�fica
    title('INTERPOLACI�N PARAB�LICA'); % A�adimos el t�tulo
    hold on; % Congela esa gr�fica para que se puedan superponer despu�s m�s datos
    grid on; % A�ade el grid a la gr�fica
    shg; % Show hidden grahpic (trae hacia delante la figura)

    %% Determinaci�n de la par�bola que pasa por (x1,y1),(x2,y2),(x3,y3)
    % Ecuaci�n de la par�bola --> y=a*x^2+b*x+c; --> coefs=[a b c];
    % Determinaci�n de a,b,c mediante �lgebra lineal (Ax=B)
    A=[x1(i)^2 x1(i) 1; x2(i)^2 x2(i) 1; x3(i)^2 x3(i) 1];
    B=[y1(i); y2(i); y3(i)];
    coefs_parab=A\B; aa=coefs_parab(1); bb=coefs_parab(2); cc=coefs_parab(3);
    xval=x1(i):1e-2:x3(i); % Definimos un vector de valores de x entre x1 y x3
    parab = @(x) aa*x.^2+bb*x+cc; % Ecuaci�n de la par�bola

    plot(xval,parab(xval),'r-.'); % Dibujamos la par�bola
    legend('Funci�n Coste','Par�bola','Location','NorthWest');
    plot(x4(i),parab(x4(i)),'ro',...
        'MarkerEdgeColor','r',...
        'MarkerSize',8); % Dibujamos el m�nimo de la par�bola
    
    plot(x1(i),y1(i),'bs',...
        'MarkerEdgeColor','b',...
        'MarkerFaceColor','b',...
        'MarkerSize',8);
    plot(x2(i),y2(i),'bs',...
        'MarkerEdgeColor','b',...
        'MarkerFaceColor','b',...
        'MarkerSize',8);
    plot(x3(i),y3(i),'bs',...
        'MarkerEdgeColor','b',...
        'MarkerFaceColor','b',...
        'MarkerSize',8);
    plot(x4(i),y4(i),'ro',...
        'MarkerEdgeColor','b',...
        'MarkerFaceColor','r',...
        'MarkerSize',8);
    fprintf('Iteraci�n %i. Pulsa una tecla para continuar... \n',i);
    pause
end