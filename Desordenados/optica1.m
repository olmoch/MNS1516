clc; clear all; close all;

Delta_O = [0.051 0.041 0.017 0.009];
P = [5 4 2 1];

ax = linspace(0,0.06,10);

[pol, S] = polyfit(Delta_O,P,1);

hold on; grid on;

axis([0 0.06 0 6]);
title('Gráfica de la potencia frente al desplazamiento del objeto');
xlabel('\Delta O (m)'); ylabel('P (dioptrías)');

refcurve(pol);

plot(Delta_O,P,'o','MarkerEdgeColor','black','MarkerFaceColor','red','MarkerSize',6);

hold off