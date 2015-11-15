
clear all;

%EJERCICIO 4 FRACTAL 

r=[1.96:0.0002:2.16];%Porcentaje de crecimiento variable (pasos peque�os)

n=100;%N�mero de generaciones

P=zeros(n,length(r));%Inicializar el array de poblaci�n a cero
P(1,:)=0.5; %Poblaci�n inicial para todos los valores de r considerados


for j=1:length(r)
    for i=1:n-1
        P(i+1,j)=(1+r(j)*(1-P(i,j)))*P(i,j);
    end
end

figure(1), plot(r,P(100,:),'b+');%Muestra una ramificaci�n del fractal
title('Valor final de la poblaci�n para distintos valores de r'); hold on
