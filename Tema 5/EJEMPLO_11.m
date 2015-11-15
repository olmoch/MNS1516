%% EJEMPLO 11: DESINTEGRACION RADIOACTIVA
clear; clc; clf;

N0=1e5; % N�mero inicial de n�cleos
lambda=0.01; % Constante de desintegracion=1/tau, siendo tau el tiempo de vida del n�cleo

N=N0;
t=0;
Dt=1; % Delta_t en unidades de tiempo

file=fopen('desintegracion.dat','w');
fprintf(file,'%i\t%i\n',t,N);

while N>0
    DN=0;
    for i=1:N
        if rand<lambda
            DN=DN+1;
        end
    end
    t=t+Dt;
    N=N-DN;
    fprintf(file,'%i\t%i\n',t,N);
end

fprintf('\n Datos salvados en desintegracion.dat \n\n');
fclose(file);

%% Representaci�n gr�fica
data=load('desintegracion.dat');
t=data(:,1); N=data(:,2);
semilogy(t,N); grid on;
xlabel('tiempo'); ylabel('N�meros de n�cleos, N');
title('DESINTEGRACI�N RADIOACTIVA');
shg;

%% Sonido de la desintegraci�n
% (Recuerda a un contador Geiger)
% OJO: la secuencia es muy corta
sound(data(:,2),44100) % FS=4.410kHz