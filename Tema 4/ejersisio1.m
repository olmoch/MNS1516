x0=0;
y0=1;
v0=25;
g=9.81;
tetha0=2*pi*50/360;
tol=1e-2;

y=@(x)tan(tetha0).*x-g./(2*v0.^2.*(cos(tetha0)).^2).*x.^2+y0;
y_neg=@(x) -y(x);

[a,b]=bracket (y_neg,x0);
[xmin,y_negmin]=goldSearch (y_neg,a,b,tol);

x=linspace (0,64,100);
plot(x,y(x));
hold on
plot (xmin,y(xmin),'r*')
plot ([0,64],[0,0],'k')
plot ([0,0],[0,35],'k')
xlabel ('x(m)')
ylabel ('y(m)')
title ('Parábola de una pelota')
hold off
shg