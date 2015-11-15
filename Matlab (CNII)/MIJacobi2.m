function [u,flag] = MIJacobi2 (A, b, u0, tol, itermax)
D = diag (A);
flag = 0;
u = u0;

for k=1:itermax
    v= (b-A*u)./D;
    u= u+v;
    if norm (v) < tol
        flag = k
        return
    end
end