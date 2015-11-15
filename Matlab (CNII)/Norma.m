function [vnorm] = Norma (v)
L=length (v)
suma=0
for i=1:L
	suma=suma+(v(i))^2;
	end
	vnorm=sqrt(suma)
	end