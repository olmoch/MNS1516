
clear all;

%EJERCICIO AUT�MATA CELULAR (AC) REGLA 30

b=7;%N�mero de c�lulas del AC
n=25;%Evoluci�n del AC

x=zeros(n,b);%Inicializar a cero el AC
y=zeros(n,b);%Inicializar a cero la variable temporal donde almacenas la salida del AC temporalmente

%x(1,:)=0;%Estado inicial del AC (todas las celdas a cero)
%x(1,:)=1;%Estado inicial del AC (todas las celdas a uno)
x(1,4)=1;%Estado inicial del AC(un uno en celda n�mero 4)
%x(1,1:2:b)=1;%Estado inicialdel AC (valores uno y cero alternos)
%x(1,:)=randi([0 1], 1, b);%Genera aleatoriamente la inicializaci�n del
%estado inicial de la celda

for i=2:n
    for j=1:b
        if (j>1 && j<7)
            y(i,j)=xor(x(i-1,j-1),or(x(i-1,j),x(i-1,j+1)));
        elseif (j==1)
            y(i,j)=xor(x(i-1,7),or(x(i-1,j),x(i-1,j+1)));
        elseif (j==7)
            y(i,j)=xor(x(i-1,j-1),or(x(i-1,j),x(i-1,1)));
        end
        
       x(i,j)=y(i,j);
        
    end
    %x(i,:)=y(i,:); %Tambi�n pod�is asignar la variable temporal fila a fila (ojo si descomentas esta l�nea hay que comentar la l�nea 29porque ambas son rendundantes)
end

figure(1), imshow(uint8(255*x));%Muestra la evoluci�n del AC en una figura

%Cada estado de la celda puede ser transformado de codificaci�n binaria a decimal
pow2=2.^(0:1:b-1);
for i=1:n
    x_decimal(i,:)=sum(x(i,:).*pow2(:)');%Valor de las celdas del aut�mata en decimal
    x_normalizado(i,:)=sum(x(i,:).*pow2(:)')/(2^b-1);%Valor de las celdas del aut�mata en decimal normalizadoentre 0 y 1
end

x_random=rand(n,1);

figure(2)
subplot(211), plot(x_normalizado,'b+');
xlabel('Paso temporal discreto AC');
ylabel('Valor del AC en decimal y normalizado');
title('AC-regla 30');
subplot(212), plot(x_random,'b+');
xlabel('Paso');
ylabel('N�mero aleatorio funci�n rand Matlab');
title('Matlab-rand');

