%  FRACTALES
% Ejercicio 4 practicas
%
% Iniciamos el bucle for para las 100 generaciones
% Poblacion inicial
P(1)=0.5;
% Razon de crecimiento
r=input('Dame el valor de r: ')

for k=1:100
    P(k+1)=(1+r*(1-P(k)))*P(k);
    
end
%subplot(1,2,1)
%plot(P)

%% Apartado e
v=length(1.9:0.01:3.0);
D=zeros(1,v*10);
t=1;
E=zeros(1,v*10);
for r=1.9:0.01:3.0
    P=zeros(1,100);
    P(1)=0.5;
    for k=1:100
     P(k+1)=(1+r*(1-P(k)))*P(k);
    end
    E(t:t+9)=r;
    D(t:t+9)=P(end-9:end);
    t=t+10;
end
%subplot(1,2,2)
%plot(E,D,'ro')
plot(E,D,'.')
