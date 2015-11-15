P=0.5;
r1=1;
r2=2.25;
r3=2.5;
r4=3;
k=100; %num iter
p=zeros (1,k);
p(1)=P;
for i=2:k
    P=(1+r3*(1-P))*P;
    p(i)=P;
end
plot (p)