function [a,b,data_out] = bracket(func,x0,h)
% Brackets the minimum point of f(x).
% USAGE: [a,b,data_out] = bracket(func,x0,h)
% INPUT:
%   func     = handle of function that returns f(x).
%   x0       = starting value of x.
%   h        = initial step size used in search (default = 0.1).
% OUTPUT:
%   a, b     = limits on x at the minimum point.
%   data_out = Vector of [x1 x2 x3 f1 f2 f3] values at each iteration

if nargin < 3; % nargin = number of input arguments
    h = 0.1;   % Default value for the step
end

c = 1.618033989; % Ratio for steps increasing
nIter_max=100;   % Maximum number of iterations
data_out=[];

x1 = x0;   f1 = feval(func,x1);
x2 = x1+h; f2 = feval(func,x2);

%% Determine downhill direction & change sign of h if needed.
if f2 > f1
    h = -h;
    x2 = x1+h; f2 = feval(func,x2);
    % Check if minimum is between x1-h and x1+h
    if f2 > f1
        a = x2; b = x1-h;
        fprintf('\n\n Bracket found for a minimum --> [a,b] = [%7.4f,%7.4f]\n\n',a,b)
        return
    end
end

%% Main loop
fprintf('\n iter   x1      x2      x3      f1      f2      f3')

for i = 1:nIter_max
    h = c*h;
    x3 = x2+h; f3 = feval(func,x3);
    fprintf('\n %i   %7.4f %7.4f %7.4f %7.4f %7.4f %7.4f',i,x1,x2,x3,f1,f2,f3)
    data_out(i,:)=[x1 x2 x3 f1 f2 f3];
    if f3 > f2
        a = x1; b = x3;
        if a>b
            tmp = a; a = b; b = tmp;
        end
        fprintf('\n\n Bracket found for a minimum --> [a,b] = [%7.4f,%7.4f]\n\n',a,b)
        return
    end
    x1 = x2; f1 = f2; x2 = x3; f2 = f3;
end

error('\n\n Bracket function did not find a minimum after %i iterations \n\n',nIter_max)
