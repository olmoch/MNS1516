
clear all;

%EJERCICIO 4 FRACTAL 

clear all; clc; clf;

r=1.95:0.0002:2.5699; % Razón de crecimiento de la población variable (pasos pequeños)
n=1e4; % Número de ciclos temporales
err=1e-5;

P=zeros(n,1);
P(1)=0.5; % Población inicial

for k=1:length(r)
    
    for i=2:n
        P(i)=(1+r(k)*(1-P(i-1)))*P(i-1);
    end
    
    rep=find( (P>P(n-1)-err) & (P<P(n-1)+err) );
    % rep=find(P==P(n-1));
    % Si se busca la igualdad, no se localizan las repeticiones debido al error numérico
    Plim=P(rep(end-1)+1:rep(end));
    dim(k)=length(Plim);
    subplot(211), plot(r(k),Plim,'.'); hold on;
    subplot(212), plot(r(k),dim(k),'+'); hold on;
end

subplot(211)
axis([min(r) max(r) 0.4 1.3])
xlabel('r'); ylabel('Población final');
title('ARBOL DE BIFURCACIONES');

subplot(212)
axis([min(r) max(r) 1 max(dim)])
xlabel('r'); ylabel('Bifurcaciones');
title('NÚMERO DE BIFURCACIONES');
shg;
