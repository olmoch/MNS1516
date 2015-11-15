n = 35; speed = 0.05; ceil = n*(n+1)/2;

k = randi(n); R = rand(1,k);

E_0 = floor(R.*(ceil/sum(R))); E = [E_0, ceil-sum(E_0)];

for i = 1:ceil^2
    % fprintf('%d, ',i);
    pause(speed);
    if i > 0
        Z = E(not(E==0));
        bar(E);
        E = [(Z - ones(size(Z))), size(Z)*[0;1]];
    end
end