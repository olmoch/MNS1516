
clear all;

%EJERCICIO 4 FRACTAL 

r=[1.96:0.0002:2.16];%Porcentaje de crecimiento variable (pasos pequeños)

n=100;%Número de generaciones

P=zeros(n,length(r));%Inicializar el array de población a cero
P(1,:)=0.5; %Población inicial para todos los valores de r considerados


for j=1:length(r)
    for i=1:n-1
        P(i+1,j)=(1+r(j)*(1-P(i,j)))*P(i,j);
    end
end

figure(1), plot(r,P(100,:),'b+');%Muestra una ramificación del fractal
title('Valor final de la población para distintos valores de r'); hold on
