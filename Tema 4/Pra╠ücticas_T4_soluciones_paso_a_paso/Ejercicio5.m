%Ejercicio 5. Prácticas Tema 4
clc;
clear all;
%close all;

%Método bracketing
R0=0;
fprintf('\n ***Bracketing***');
[a,b]=bracket(@Potencia_en_R,R0);

%Método de minimización fminbnd
fprintf('\n ***fminbnd***');
tol=1e-2;
options=optimset('display','iter','TolX',tol);
[Rmin,P_min]=fminbnd(@Potencia_en_R,a,b,options);
fprintf('Rmax= %4.6f, P(Rmax)= %4.6f \n \n', Rmin, -P_min);

%Dibujamos la función
R=[0:1e-2:10];
for i=1:length(R)
    Pot_neg(i)=-feval(@Potencia_en_R,R(i));
end
figure(2)
plot(R,Pot_neg);
hold on;
grid on;
plot(Rmin,-P_min,'*r');
xlabel('R(ohms)');
ylabel('Potencia(W)');
title('Potencia disipada en R');
shg