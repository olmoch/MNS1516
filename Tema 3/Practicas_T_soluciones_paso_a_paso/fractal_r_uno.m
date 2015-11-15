
clear all;

%EJERCICIO 4 FRACTAL 

r=1;%Porcentaje de crecimiento fijo a 1


n=100;%Número de generaciones

P=zeros(n);
P(1)=0.5; %Población inicial



for i=1:n-1
    P(i+1)=(1+r*(1-P(i)))*P(i);
    
  
     
end

figure(1), plot(P);%Muestra la evolución del AC en una figura
title('Evolución población para r=1 (azul)'); hold on
