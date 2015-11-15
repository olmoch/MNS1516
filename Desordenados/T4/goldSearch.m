function [xMin,fMin,data_out] = goldSearch(func,a,b,tol)
% Golden section search for the minimum of f(x).
% The minimum point must be bracketed in a <= x <= b.
% USAGE: [xMin,fMin] = goldSearch(func,a,b,tol)
% INPUT:
%   func     = handle of function that returns f(x).
%   a, b     = limits of the interval containing the minimum.
%   tol      = error tolerance (default is 1.0e-4).
% OUTPUT:
%   fMin     = minimum value of f(x).
%   xMin     = value of x at the minimum point.
%   data_out = Vector of [a b x1 x2 f1 f2] values at each iteration

if nargin < 4; % nargin = number of input arguments
    tol = 1.0e-4; % Default value for tolerance
end

nIter = ceil(-2.078087*log(tol/abs(b-a))); % Number of iterations for a given tolerance
phi = (1+sqrt(5))/2; % phi = 1.618033989;

data_out=[];

%% First telescoping
x1 = a + (phi-1)*(b-a); % h = (phi-1)*(b-a);
x2 = b - (phi-1)*(b-a); % h = (phi-1)*(b-a);
f1 = feval(func,x1);
f2 = feval(func,x2);
fprintf('\n iter   a       b       x1       x2      f1      f2')

%% Main loop
for i =1:nIter
    fprintf('\n  %2i %7.4f %7.4f %7.4f %7.4f %7.4f %7.4f', i,a,b,x1,x2,f1,f2)
    data_out(i,:)=[a b x1 x2 f1 f2];
    if f1 > f2
        b = x1; x1 = x2; f1 = f2;
        x2 = b - (phi-1)*(b-a);
        f2 = feval(func,x2);
    else
        a = x2; x2 = x1; f2 = f1;
        x1 = a + (phi-1)*(b-a);
        f1 = feval(func,x1);
    end
end

if f1 < f2
    fMin = f1; xMin = x1;
else
    fMin = f2; xMin = x2;
end

fprintf('\n\n  xMin = %7.4f, fMin = %7.4f obtained after %i iterations \n\n', xMin,fMin,i)