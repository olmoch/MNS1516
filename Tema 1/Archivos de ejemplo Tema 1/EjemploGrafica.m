% Este script sirve de ejemplo a la funci�n plot en el Tema 1
% de M�todos num�ricos y simulaci�n. Requiere el script ejmplo_fscanf
% del mismo tema y los archivos que requiera este �ltimo script
% Dibuja los resultados de un experimento en el que se mide la ddp V
% entre los extremos de una barra de metal
%% Importamos los datos usando otro script
ejemplo_fscanf;
%% Hacemos el gr�fico
V1 = V(1,:);    % Los valores del voltaje para el primer experimento (la 
% primera fila de la matriz V
figure(1);  % No es necesario si s�lo hacemos un gr�fico.
plot(I,V1,'-ok');
%% Ponemos t�tulos al gr�fico y los ejes
xlabel('I (A)');
ylabel('V (\muV)');
title('Comprobaci�n ley de Ohm');
legend('Exp. 1','Location','SE'); % Coloca la leyenda en la esquina 
% inferior derecha del gr�fico