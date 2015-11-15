delfin = importdata ('odontocetos.txt');
dcer = delfin.data (:,2);
dcuerp = delfin.data (:,3);

monos = importdata ('primates.txt');
pcer = monos.data (:,2);
pcuerp = monos.data (:,3);

xd = log (dcuerp);
yd = log (dcer);
xp = log (pcuerp);
yp = log (pcer);

plot (xd,yd,'.r');
hold on
plot (xp,yp,'.b');
xlabel ('Peso del cuerpo (g)');
ylabel ('Peso del cerebro (g)');
legend ('show','primates','odontocetos','Location','NorthWest');
hold off
