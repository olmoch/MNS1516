function [n] = ncuadrante (x,y)
if x*y==0
    n=0;
    return
end
if x>0
    if y>0
        n=1;
    else
        n=4;
    end
else
    if y>0
        n=2;
    else
        n=3;
    end
end
end


