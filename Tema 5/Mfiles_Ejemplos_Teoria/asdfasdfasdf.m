clear all
clc
close all

N=1e5;
p1=0.1;
p2=0.2;
p3=0.7;
N_prob=1:3;

rnd = zeros (1,N);
for i=1:N
    xrand=rand;
    if xrand<p1
        rnd(i)=1;
    elseif xrand<p2+p1
        rnd(i)=2;
    else
        rnd(i)=3;
    end
end
histograma=hist (rnd,N_prob);
bar(N_prob,histograma)
xlabel = 'comemela'
ylabel = 'free rick sanchez pls'
shg