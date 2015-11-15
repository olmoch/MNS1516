%% EJEMPLO 11: DESINTEGRACION RADIOACTIVA
clear; clc; clf;

N0=1e5; % Número inicial de núcleos
lambda=0.01; % Constante de desintegracion=1/tau, siendo tau el tiempo de vida del núcleo

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

%% Representación gráfica
data=load('desintegracion.dat');
t=data(:,1); N=data(:,2);
semilogy(t,N); grid on;
xlabel('tiempo'); ylabel('Números de núcleos, N');
title('DESINTEGRACIÓN RADIOACTIVA');
shg;

%% Sonido de la desintegración
% (Recuerda a un contador Geiger)
% OJO: la secuencia es muy corta
sound(data(:,2),44100) % FS=4.410kHz