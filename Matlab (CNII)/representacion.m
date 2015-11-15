k=linspace (1,10);
v=zeros (1,100);

for i=1:100
    v(i)=ifunk (k(i));
end

plot (k,v,'r','LineWidth',1.5)
hold on
plot ([0,10],[0,0],'k')
hold off