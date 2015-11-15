%% Datos iniciales

x = [3.929, 5.308, 7.240, 9.638, 12.866, 17.069, 23.192, 31.443, 38.558, 50.156, 62.948, 75.995, 91.972, 105.711, 122.775, 131.669, 150.697];
y = linspace(1790,1950,150); % Soporte para la funci�n te�rica.
yr = 1790:10:1950; % Soporte para la funci�n experimental.

%% Tratamiento de datos

p = @(t) 197.273./(1+exp(-0.03134.*(t-1913.25))); % Funci�n te�rica.
x2 = p(y);

%% Creaci�n de gr�ficas

plot (y,x2,'Color','black','LineWidth',2); % Dibuja x2 frente a y.

hold on % Permite editar la gr�fica sin sobreescribirla

plot(yr,x,'o','MarkerEdgeColor','black','MarkerFaceColor','red','MarkerSize',8); % A�ade un segundo plot.

% axis([xmin xmax ymin ymax]) % En caso de que sea necesario modificar los
% l�mites de los ejes coordenados.

% En los textos pueden introducirse caracteres especiales de la misma
% manera que en LaTeX, es decir, usando por ejemplo '\Omega'.
title('Poblaci�n frente al tiempo');
xlabel('A�os');
ylabel('Poblaci�n'); 
legend('Pobl. real', 'Ajuste', 'Location', 'North'); % Modifica la leyenda, y la coloca arriba.

hold off