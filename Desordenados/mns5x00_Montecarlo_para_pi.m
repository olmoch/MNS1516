n = 1e5; X = rand([1,n]); Y = rand([1,n]);

D = sqrt(X.^2+Y.^2); points_in = D(D<1); s_in = size(points_in); p = s_in(2);

mc = 4*p/n; eps = abs(pi - mc);

plot(X(D<1), Y(D<1), 'xr', X(D>1), Y(D>1), 'xg');

title('Método de Montecarlo para el cálculo de \pi');
xlabel('X'); ylabel('Y');
legend('Valores dentro', 'Valores fuera')

fprintf('\n Valor aproximado de pi : %1.7f \n Error de nuestro valor: %1.7f \n\n',[mc,eps]);