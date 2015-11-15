function [vmed] = Media (v)
%Como su propio nombre indica, Media(v) calcula  la media aritmética de los
%elementos del vector v
%Para ello, se suman los elementos de v y se divide el resultado entre el 
%número de elementos de éste, i.e. su longitud
(sum(v))/(length(v))
end