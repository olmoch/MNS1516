%% Datos para el gráfico

l = 1:150;
r = sqrt(l);
t = pi.*137.51.*l./180;

%% Representación gráfica en polares

h = polar(t,r);

set(h,'LineStyle','none','Marker','o','MarkerEdgeColor','black','MarkerFaceColor','green','MarkerSize',8);

title('Representación en polares');
legend('Semillas de girasol', 'Location', 'Southwest');