%% Datos aleatorios

n = 15; e = 0.5;

X = rand(1,n);
Y = 2*X + e*rand(1,n);

%% Análisis inicial

sigma_Y = std(Y)/sqrt(n)*ones(1,n);

%% Gráfico con barras de error

errorbar(X,Y,ones(1,n),'xr');

%% Cálculo del polinomio de mejor ajuste

[pol, S] = polyfit(X,Y,1);

refcurve(pol);

%% Análisis de la calidad del ajuste

S.normr; % Norma de los residuos.

sY = mean(sigma_Y); 

(S.normr)./(S.df); % Norma entre grados de libertad.

%% Matriz de covarianzas

Cov = sqrt(sY^2*(inv(S.R)*inv(S.R)'));

%% Coeficientes y errores

% Y = m * X + n

m = pol(1); n = pol(2);
sigma_m = Cov(2,2);
sigma_n = Cov(1,1);

fprintf('\n Y = m·X + n \n m = %1.3f +/- %1.3f \n n = %1.3f +/- %1.3f \n\n',[m, sigma_m, n, sigma_n]);