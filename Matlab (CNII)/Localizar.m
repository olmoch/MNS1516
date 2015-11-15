function [ N ] = Localizar(x,y)
%Localizar devuelve: 
%N=1 si (x,y) está dentro de la bola de radio 1 y centro (1,1)
%N=2 si (x,y) está dentro de la bola de radio 1 y centro (0,0)
%N=0 en caso contrario
if ((x-1)^2+(y-1)^2<1)
    if (x^2+y^2<1)
        N=2
    else
        N=1
    end
else
    N=0
end

end

