a=107;
c=3;
M=256;
r=1;
for i=2:n
    r(i)=mod(a*r(i-1)+c,M);
end
r=r
plot (1:n,r)