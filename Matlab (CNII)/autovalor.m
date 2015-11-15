function [h,v] = autovalor (A, tol, Itermax)
%h es el autovalor
%v el autovector asociado

[n,m] = size (A);
ro = 0;
u = (linspace (1,1,n))';
f = @(x) x(1);

for k=1:Itermax
    ro0=ro;
    u0=u;
    
    w=u/norm(u);
    u=A*w;
    ro=f(u)/f(w);
    
    if abs(ro-ro0)<tol
        break
    end
end

h=ro;
v=u/norm(u);
end