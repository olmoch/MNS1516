%%% Tema 4. Práctica 2. Ejercicio1 %%%

clc;
clear all;
close all;

%Declaración de parámetros
a=150;
b=50;
k=0.6;
P=5;

%Definición de la función
delta_AB= @(u,v) sqrt((a+u).^2+v.^2)-a;
delta_BC= @(u,v) sqrt((b-u).^2+v.^2)-b;

V= @(u,v)  -P*v+(k*(a+b)*(delta_AB(u,v).^2)/(2*a))+(k*(a+b)*(delta_BC(u,v).^2)/(2*b));

Vp=@(x) V(x(1),x(2));


%Dibujamos la gráfica en 3D
N_pts=50;
N_cn=50;

u=linspace(-100,100,N_pts);
v=linspace(-100,100,N_pts);

[u,v]=meshgrid(u,v);

z=V(u,v);

subplot(1,2,1);
surfc(u,v,z);
xlabel('u(mm)');
ylabel('v(mm)');
zlabel('V(N*mm)');
title('Energía potencial');

subplot(1,2,2);
cn=contourf(u,v,z,N_cn);
clabel(cn);
xlabel('u(mm)');
ylabel('v(mm)');
title('Curvas de nivel');

%Minimización fminsearch
x0=[0 0];
tol=1e-1;
fprintf('\n ***fminsearch***');
options=optimset('display','iter','TolX',tol);
[xmin,Vmin,nCy]=fminsearch(Vp,x0,options);
fprintf('\n u_min = %1.4f mm, v_min = %2.4f mm, V_min = %2.4f N*mm \n \n',xmin(1),xmin(2),Vmin); 



