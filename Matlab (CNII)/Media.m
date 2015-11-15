function [vmed] = Media (v)
%Como su propio nombre indica, Media(v) calcula  la media aritm�tica de los
%elementos del vector v
%Para ello, se suman los elementos de v y se divide el resultado entre el 
%n�mero de elementos de �ste, i.e. su longitud
(sum(v))/(length(v))
end