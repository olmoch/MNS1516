% FUNCION
function [C,Ceq] = nonlincc_ej2_4(x)

C=sum(abs(x-[1 1]))-2; % Restriccion no-lineal --> Distancia a (1,1) <= 2
Ceq=[];

end