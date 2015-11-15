%%% Ejercicio 2.3. Clase Práctica 2. Tema 4 %%%

clc;
close all;
clear all;

%Definimos la función multi-variable
F=@(x,y) (x.^2+y-11).^2+(x+y.^2-7).^2;
Fx=@(x) F(x(1),x(2));

%Definimos las restricciones
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

% restricción x+y>=-5 --> -x-y<=5
A=[-1 -1];
B=[5];

Aeq=[];
Beq=[];

LB=[0 -2];
UB=[];

nonlincon=[];

%Invocamos la función fmincon
x0=[0 0];
options=optimset('display','iter','TolX',1e-2);
[x_min Fx_min]=fmincon(Fx,x0,A,B,Aeq,Beq,LB,UB,nonlincon,options);
fprintf('\n x_min=%7.5f, y_min=%7.5f, F_min=%7.5f \n \n', x_min(1), x_min(2), Fx_min);


%Visualización 3D
x=linspace(-5,5,50);
y=linspace(-5,5,50);
[x,y]=meshgrid(x,y);

%Visualización 3D sin restricciones
subplot(1,3,1)
surfc(x,y,F(x,y));
xlabel('x');
ylabel('y');
zlabel('F(x,y)');
title('Visualización 3D F(x,y)');

%Visualización 3D con restricciones
Fc=F(x,y).*(x>=0).*(y>=-2).*(x+y>=-5);
subplot(1,3,2);
surfc(x,y,Fc);
xlabel('x');
ylabel('y');
zlabel('Fc(x,y)');
title('Visualización 3D F(x,y) con restricciones');

%Curvas de nievel con restricciones
subplot(1,3,3);
contourf(x,y,Fc,70);
xlabel('x');
ylabel('y');
title('Curvas isonivel');
shg;
shg;