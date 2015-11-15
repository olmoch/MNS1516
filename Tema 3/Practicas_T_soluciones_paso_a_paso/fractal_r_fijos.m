
clear all;

%EJERCICIO 4 FRACTAL 

r1=1;%Porcentaje de crecimiento fijo a 1
r2=2.25;%Porcentaje de crecimiento fijo a 2.25
r3=2.5;%Porcentaje de crecimiento fijo a 2.5
r4=3;%Porcentaje de crecimiento fijo a 3

n=100;%Número de generaciones

P1=zeros(0);
P1(1)=0.5; %Población inicial

P2=zeros(n);
P2(1)=0.5; %Población inicial

P3=zeros(n);
P3(1)=0.5; %Población inicial

P4=zeros(n);
P4(1)=0.5; %Población inicial


for i=1:n-1
    P1(i+1)=(1+r1*(1-P1(i)))*P1(i);
    
    P2(i+1)=(1+r2*(1-P2(i)))*P2(i);
    
    P3(i+1)=(1+r3*(1-P3(i)))*P3(i);
    
    P4(i+1)=(1+r4*(1-P4(i)))*P4(i);
     
end

figure(1), plot(P1);%Muestra la evolución del AC en una figura
title('Evolución población para r=1 (azul), r=2 (rojo), r=2.5 (green), r=3 (negro)'); hold on
plot(P2,'r');hold on
plot(P3,'g');hold on
plot(P4,'k');
