%Ejercicio 3. Pr�ctica Tema 4
clc;
clear all;
close all;

%Definici�n de par�metros del problema
eps0=8.85*1e-12;
q=2*1e-5;
Q=q;
a=0.9;

%Definici�n de la funci�n
F= @(x) (1/(4*pi*eps0))*((q*Q*x)./(x.^2+a^2).^1.5);
F_neg= @(x) -F(x);

%Invocamos bracketing
x0=0;
fprintf('\n ***Bracketing*** \n '); 
[a,b]=bracket(F_neg,x0);

%Invocamos el m�todo de Golden Search
tol=1e-4;
fprintf('\n ***Golden Search*** \n ');
[xmin,FMin]=goldSearch(F_neg,a,b,tol);
fprintf('xmax= %4.6f, Fmax= %4.6f \n \n', xmin, -FMin);

%Dibujamos la funci�n
x=[0:1e-5:10];
subplot(2,1,1), plot(x,F(x));
xlabel('x');
ylabel('F(x)');
title('Fuerza ejercicida por q - GS');
hold on;
grid on;
plot(xmin,-FMin,'r*');


%Invocamos el m�todo de fminbnd
fprintf('\n ***fminbnd*** \n ');
options = optimset('display','iter','TolX',tol);
[xmin_fminbnd,fmin_fminbnd] = fminbnd(F_neg,a,b,options);
fprintf('xmax= %4.6f, Fmax= %4.6f \n \n', xmin_fminbnd, -fmin_fminbnd);

%Dibujamos la funci�n
x=[0:1e-5:10];
subplot(2,1,1), plot(x,F(x));
xlabel('x');
ylabel('F(x)');
title('Fuerza ejercicida por q - GS');
hold on;
grid on;
plot(xmin,-FMin,'r*');

subplot(2,1,2), plot(x,F(x));
xlabel('x');
ylabel('F(x)');
title('Fuerza ejercicida por q - fminbnd');
hold on;
grid on;
plot(xmin_fminbnd,-fmin_fminbnd,'r*');
shg