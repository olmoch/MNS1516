function [u, flag] = MIJacobi(A, b, u0, tol, Itermax)
%
% u = MIJacobi(A, b, u0, tol, Itermax) devuelve la solucion del sistema
% lineal Au=b, calculada mediante el metodo iterativo de Jacobi,
% comenzando las iteraciones con el vector u0.
% Se detienen las iteraciones cuando ||u^{k+1}-u^k}|| < tol
% obien cuando se alcanza al numero maximo de iter. Itermax
% [u, flag] = MIJacobi(A, b, u0, tol, Itermax) devuelve, ademas, un
% indicador del desarrollo del algoritmo:
% flag = 0 si el algoritmo no converge en el numero maximo
% de iteraciones Itermax fijado
% flag = k > 0 si el algoritmo converge en k iteraciones
%
D =diag(A);
u =u0;
flag = 0;
for k = 1:Itermax
v = (b-A*u)./D;
u = u + v;
if norm(v) < tol
flag = k;
return
end
end

