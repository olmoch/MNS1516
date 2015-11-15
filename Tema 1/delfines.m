delfin = importdata ('odontocetos.txt');
dcer = delfin.data (:,2);
dcuerp = delfin.data (:,3);

monos = importdata ('primates.txt');
pcer = monos.data (:,2);
pcuerp = monos.data (:,3);

loglog (dcuerp,dcer,'r.');
hold on
loglog (pcuerp,pcer,'b.');
xlabel ('Peso del cuerpo (g)');
ylabel ('Peso del cerebro (g)');
legend ('show','primates','odontocetos','Location','NorthWest');
hold off

