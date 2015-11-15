monos = importdata ('primates.txt');
pcer = monos.data (:,2);
pcuerp = monos.data (:,3);
loglog (pcuerp,pcer,'r.');
hold on
xlabel ('Peso del cuerpo (g)');
ylabel ('Peso del cerebro (g)');
legend ('Monos')
hold off

