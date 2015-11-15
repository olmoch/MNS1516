%% EJERCICIO 1.5: GENERACION DE NUMEROS ALEATORIOS PARA PDF ARBITRARIA
% METODO DE RECHAZO
clear; clc; clf;

func=@(x) 2*pi*sin(4*pi*x); % Función de interés
a=0; b=0.25; % Intervalo de interés
N=1e6; % Longitud del vector aleatorio a generar con PDF=f(x)
nbin=50; % Número de puntos para el plot de f(x)

%% Representación gráfica de la PDF arbitraria
x=linspace(a,b,nbin);
func_eval=func(x);
funcMax=max(func_eval);
xMax=x(min(find(func_eval==funcMax)));

subplot(1,2,1),plot(x,func_eval,'r','LineWidth',3); grid on; hold on;
xlabel('x'); ylabel('f(x)');
title('PDF ARBITRARIA');

%% Generación de secuencia pseudo-aleatoria
func_rand=zeros(1,N);
i=1;
while i<N+1
    rand_0fMax=funcMax*rand;
    rand_ab=a+(b-a)*rand;
    if func(rand_ab)>rand_0fMax
        func_rand(i)=rand_ab;
        i=i+1;
    end
end

n=hist(func_rand,x);

% Búsqueda del factor de escala adecuado
% (Se asume que la PDF y el histograma están calculados para el mismo vector de x)
[nMax,iMax]=max(n); % Ocurrencias máximas y pila para el que ocurre
factor_escala=func(x(iMax))/n(iMax);
n_escalado=n*factor_escala;

integral_pdf_escalada=sum(n_escalado*(x(2)-x(1))) % Comprobación de que el escalado es correcto
                                                  % La integral de la PDF debe ser (teóricamente) 100%
subplot(121),bar(x,n_escalado);
legend('PDF a partir de la Ecuación','PDF a partir de la Secuencia Generada','Location','South')

subplot(1,2,2),hist(func_rand,x); grid on; hold on;
xlabel('Número aleatorio generado'); ylabel('Número de ocurrencias');
title('HISTOGRAMA DEL VECTOR ALEATORIO GENERADO');
shg;