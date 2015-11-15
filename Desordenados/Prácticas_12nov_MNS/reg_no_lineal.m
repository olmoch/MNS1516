function f_cost = reg_no_lineal(param,x_exp,y_exp)

k=param(1);
tau=param(2);

y_fit=k.*exp(-x_exp./tau);

residue=y_fit-y_exp;

f_cost=sum(residue.^2);
