function Potencia_neg = Potencia_en_R(R)

R1=2;
R2=3.6;
R3=1.5;
R4=1.8;
R5=1.2;

E=120;

A=[R1+R3+R -R; -R R2+R4+R5+R];
B=[E; 0];
i=A\B;


P=(i(1)-i(2))^2*R;
Potencia_neg=-P; %Para usarse como entrada en métodos de minimización