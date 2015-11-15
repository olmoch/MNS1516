%% EJEMPLO 13: Integración por valor medio
% Evaluar una integral en 10D
clear; clc;

%% Definición de la función y sus límites de integración
func = @(x01,x02,x03,x04,x05,x06,x07,x08,x09,x10) ...
    (x01+x02+x03+x04+x05+x06+x07+x08+x09+x10).^2;

x01l=0; x01h=1; x02l=0; x02h=1; x03l=0; x03h=1; x04l=0; x04h=1; x05l=0; x05h=1;
x06l=0; x06h=1; x07l=0; x07h=1; x08l=0; x08h=1; x09l=0; x09h=1; x10l=0; x10h=1; 

N=1e6; % Número de evaluaciones de la función

%% Integración por Monte Carlo
x01samp=x01l+(x01h-x01l)*rand(1,N); % Generación de secuencia aleatoria para x01 en [x01l,x01h]
x02samp=x02l+(x02h-x02l)*rand(1,N); % Generación de secuencia aleatoria para x02 en [x02l,x02h]
x03samp=x03l+(x03h-x03l)*rand(1,N); % Idem
x04samp=x04l+(x04h-x04l)*rand(1,N); % Idem
x05samp=x05l+(x05h-x05l)*rand(1,N); % Idem
x06samp=x06l+(x06h-x06l)*rand(1,N); % Idem
x07samp=x07l+(x07h-x07l)*rand(1,N); % Idem
x08samp=x08l+(x08h-x08l)*rand(1,N); % Idem
x09samp=x09l+(x09h-x09l)*rand(1,N); % Idem
x10samp=x10l+(x10h-x10l)*rand(1,N); % Idem

fsamp=func(x01samp,x02samp,x03samp,x04samp,x05samp,x06samp,x07samp,x08samp,x09samp,x10samp);
fsamp_mean=1/N*sum(fsamp);

I_MC=(x01h-x01l)*(x02h-x02l)*(x03h-x03l)*(x04h-x04l)*(x05h-x05l)*(x06h-x06l)* ...
    (x07h-x07l)*(x08h-x08l)*(x09h-x09l)*(x10h-x10l)*fsamp_mean;

fprintf('\n Integración 10D con Monte Carlo --> I = %.4f', I_MC);
fprintf('\n Resultado analítico             --> I = %.4f \n\n', 155/6);