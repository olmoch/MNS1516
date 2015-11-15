function [C,Ceq] = nonlcon(x)
C = [];
Area = (x(1) + x(2)*tan(x(3)))*x(2);
Ceq = Area - 8;