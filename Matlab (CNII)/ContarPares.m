function [Npares] = ContarPares (v)
%ContarPares (v) devuelve el número de elementos de v que son pares
%
Contarpares=0
for i=[1:length(v)]
    if mod(v(i),2)==0
        Contarpares=Contarpares + 1
    else
        Contarpares=Contarpares
    end
end
end
