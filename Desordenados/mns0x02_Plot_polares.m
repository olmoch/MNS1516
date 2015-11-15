%% Datos para el gr�fico

l = 1:150;
r = sqrt(l);
t = pi.*137.51.*l./180;

%% Representaci�n gr�fica en polares

h = polar(t,r);

set(h,'LineStyle','none','Marker','o','MarkerEdgeColor','black','MarkerFaceColor','green','MarkerSize',8);

title('Representaci�n en polares');
legend('Semillas de girasol', 'Location', 'Southwest');