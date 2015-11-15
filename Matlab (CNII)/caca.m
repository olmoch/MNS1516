x = [1, 2, 3];
y = [-3, 1, 3];
coef = polyfit(x, y, 2);
z = linspace(0,7);
pz = polyval(coef, z);
hold on
plot(z, pz, 'LineWidth',1.1)
plot([-1,7],[0,0], 'k','LineWidth',1.1)
plot([0,0],[-10,6],'k','LineWidth',1.1)
plot(x,y,'r.','MarkerSize',20)
axis([-2, 8, -11, 7])
hold off