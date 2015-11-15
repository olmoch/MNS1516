% OPTIMIZACION - EJERCICIO 2.4 
% MNS - CURSO 2015-16
% Rocío del Río
clear; clf; clc;

%% Definición del problema

% Datos de entrada
xf1=-16;	yf1=4;      delivf1=5;
xf2=6;      yf2=5;      delivf2=6;
xf3=3;      yf3=-9;     delivf3=10;

% Funcion coste
kilometraje=@(x) 2*delivf1*sqrt(sum((x-[xf1 yf1]).^2))...
                +2*delivf2*sqrt(sum((x-[xf2 yf2]).^2))...
                +2*delivf3*sqrt(sum((x-[xf3 yf3]).^2));

%% Minimización con FMINCON
%     fmincon attempts to solve problems of the form:
%      min F(X)  subject to:  A*X  <= B, Aeq*X  = Beq (linear constraints)
%       X                     C(X) <= 0, Ceq(X) = 0   (nonlinear constraints)
%                                LB <= X <= UB        (bounds)
%                                
%     [X,FVAL] = = fmincon(FUN,X0,A,B,Aeq,Beq,LB,UB,NONLCON,OPTIONS) minimizes with
%     the default optimization parameters replaced by values in OPTIONS, an
%     argument created with the OPTIMOPTIONS function. See OPTIMOPTIONS for
%     details. For a list of options accepted by fmincon refer to the
%     documentation.                           

x0=[0 0]; % Coordenadas iniciales de búsqueda
options=optimset('display','iter','TolX',1e-2);

[x_Min,func_Min]=fmincon(kilometraje,x0,[],[],[],[],[],[],@(x) nonlincc_ej2_4(x),options);

fprintf('\n   *** FMINCON ***');
fprintf('\n   Emplazamiento óptimo --> (x,y)=(%.2f,%.2f)',x_Min(1),x_Min(2));
fprintf('\n   Kilometraje asociado --> %.2f km/mes \n\n',kilometraje(x_Min));

%% COMPROBACION GRAFICA
marker_size=10;
plot(xf1,yf1,'ob','MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',10);
hold on; grid on;
plot(xf2,yf2,'ob','MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',10);
plot(xf3,yf3,'ob','MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',10);
plot(x_Min(1),x_Min(2),'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',10);
axis([-18 8 -10 6]);
shg;