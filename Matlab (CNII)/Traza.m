function [a] = Traza (A)
[n,m]=size(A);
if n~=m
    error('eres carajote y has puesto una matriz no cuadrada')
end
a=0;
for k=1:n
    a=a+A(k,k);
end
end


