% BÚSQUEDA DE UN MÍNIMO ESTACIONARIO
% MEDIANTE EL ALGORITMO DE INTERPOLACIÓN PARABÓLICA
% Objetivo: Aislar el mínimo de f(x)=1/10*x^2-2*sin(x) 
% en el intervalo x=[0,4]

clear; % Borra memoria
clc;   % Borra Command Window
clf;   % Borra gráficas que pueda haber abiertas

%% Interpolación Parabólica
func = @(x) 1/10*x.^2-2*sin(x);

a=0.0; b=4.0; % Intervalo unimodal en el que buscar el mínimo
tol=1e-2; % Tolerancia para localizar el mínimo (valor por defecto: 1e-4)

[xMin,fMin,data_out] = parabInterp(func,a,b,tol);

%% Ilustración gráfica

% Recuperamos información sobre el proceso de Interpolación Parabólica
niter=length(data_out(:,1));
x1=data_out(:,1);
x2=data_out(:,2);
x3=data_out(:,3);
x4=data_out(:,4);
y1=data_out(:,5);
y2=data_out(:,6);
y3=data_out(:,7);
y4=data_out(:,8);

fprintf('*** ILUSTRACIÓN GRÁFICA *** \n',i);

for i=1:niter
    clf
    x=a:1e-2:b; % Definimos un vector de valores de x
    plot(x,func(x)) % Dibujamos el valor de la función para esos x
    xlabel('x'), ylabel('f(x)') % Añadimos el nombre a los ejes x,y de la gráfica
    title('INTERPOLACIÓN PARABÓLICA'); % Añadimos el título
    hold on; % Congela esa gráfica para que se puedan superponer después más datos
    grid on; % Añade el grid a la gráfica
    shg; % Show hidden grahpic (trae hacia delante la figura)

    %% Determinación de la parábola que pasa por (x1,y1),(x2,y2),(x3,y3)
    % Ecuación de la parábola --> y=a*x^2+b*x+c; --> coefs=[a b c];
    % Determinación de a,b,c mediante álgebra lineal (Ax=B)
    A=[x1(i)^2 x1(i) 1; x2(i)^2 x2(i) 1; x3(i)^2 x3(i) 1];
    B=[y1(i); y2(i); y3(i)];
    coefs_parab=A\B; aa=coefs_parab(1); bb=coefs_parab(2); cc=coefs_parab(3);
    xval=x1(i):1e-2:x3(i); % Definimos un vector de valores de x entre x1 y x3
    parab = @(x) aa*x.^2+bb*x+cc; % Ecuación de la parábola

    plot(xval,parab(xval),'r-.'); % Dibujamos la parábola
    legend('Función Coste','Parábola','Location','NorthWest');
    plot(x4(i),parab(x4(i)),'ro',...
        'MarkerEdgeColor','r',...
        'MarkerSize',8); % Dibujamos el mínimo de la parábola
    
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
    fprintf('Iteración %i. Pulsa una tecla para continuar... \n',i);
    pause
end