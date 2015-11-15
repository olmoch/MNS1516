function [vsum] = SumAbs (v)
%SumAbs (v) calcula la suma de los valores absolutos del vector v
%La funci�n calcula iterativamente el valor absoluto del elemento i-�simo
%del vector, y se lo suma a la suma de los valores absolutos de los
%elementos de 1 a i-1, siendo esta suma 0 cuando i=0.
SumAbs=0
for i=[1:length(v)]
    SumAbs=SumAbs+abs(v(i))
end
end