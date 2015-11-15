% Este script sirve de ejemplo a la función plot en el Tema 1
% de Métodos numéricos y simulación. Requiere el script ejmplo_fscanf
% del mismo tema y los archivos que requiera este último script
% Dibuja los resultados de un experimento en el que se mide la ddp V
% entre los extremos de una barra de metal
%% Importamos los datos usando otro script
ejemplo_fscanf;
%% Hacemos el gráfico
V1 = V(1,:);    % Los valores del voltaje para el primer experimento (la 
% primera fila de la matriz V
figure(1);  % No es necesario si sólo hacemos un gráfico.
plot(I,V1,'-ok');
%% Ponemos títulos al gráfico y los ejes
xlabel('I (A)');
ylabel('V (\muV)');
title('Comprobación ley de Ohm');
legend('Exp. 1','Location','SE'); % Coloca la leyenda en la esquina 
% inferior derecha del gráfico