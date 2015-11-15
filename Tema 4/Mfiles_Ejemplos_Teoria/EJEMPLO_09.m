%% EJEMPLO DE MINIMIZACION CON RESTRICCIONES
% CON LA FUNCION fmincon DE MATLAB
clear; clf;

%% Definición del problema
Perim=@(b,h,ang) b+2*h*sec(ang);

Perimx=@(x) Perim(x(1),x(2),x(3)); % Re-definimos usando un vector de variables independientes
x0=[2 4 0]; % Vector de condiciones iniciales

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

A=[]; B=[]; Aeq=[]; Beq=[]; LB=[]; UB=[];

options=optimset('display','iter','TolX',1e-2);

[xmin,Perim_min]=fmincon(Perimx,x0,A,B,Aeq,Beq,LB,UB,@(x) nonlcon(x),options)

fprintf('\n b_min (m)   = %.2f ',xmin(1))
fprintf('\n h_min (m)   = %.2f ',xmin(2))
fprintf('\n ang_min (º) = %.2f ',xmin(3)*180/pi)
fprintf('\n ********************')
fprintf('\n Perim_min (m)   = %.2f \n\n',Perim_min)