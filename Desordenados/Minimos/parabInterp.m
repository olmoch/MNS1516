function [xMin,fMin,data_out] = parabInterp(func,a,b,tol)
% Parabolic interpolation for the minimum of f(x).
% The minimum point must be bracketed in a <= x <= b.
% USAGE: [xMin,fMin] = parabInterp(func,a,b)
% INPUT:
%   func = handle of function that returns f(x).
%   a, b = limits of the interval containing the minimum.
%   tol = error tolerance (default is 1.0e-4).
% OUTPUT:
%   fMin = minimum value of f(x).
%   xMin = value of x at the minimum point.
%   data_out = Vector of [a b x1 x2 f1 f2] values at each iteration

if nargin < 4; % nargin = number of inpit arguments
    tol = 1.0e-4; % Default value for tolerance
end

nIter_max=100; % Maximum number of iterations
data_out=[];

%% First telescoping
x1 = a; x2 = (a+b)/2; x3 = b;
f1 = func(x1); f2 = func(x2); f3 = func(x3);
fprintf('\n iter   x1      x2      x3      x4      f1      f2      f3      f4')

%% Main loop
for i =1:nIter_max
    x4 = x2-1/2*((x2-x1)^2*(f2-f3)-(x2-x3)^2*(f2-f1))/((x2-x1)*(f2-f3)-(x2-x3)*(f2-f1));
    f4 = func(x4);
    fprintf('\n  %2i %7.4f %7.4f %7.4f %7.4f %7.4f %7.4f %7.4f %7.4f',i,x1,x2,x3,x4,f1,f2,f3,f4)
    data_out(i,:)=[x1 x2 x3 x4 f1 f2 f3 f4];
    if x4 < x2
           if f4 < f2
               if abs(x4-x2)<tol
                   fMin=f4; xMin=x4;
                   fprintf('\n\n  xMin = %7.4f, fMin = %7.4f obtained after %i iterations \n\n', xMin,fMin,i)
                   return
               end
               x3 = x2; f3 = f2; x2 = x4; f2 = f4;
           else
               if abs(x4-x1)<tol
                   fMin=f4; xMin=x4;
                   fprintf('\n\n  xMin = %7.4f, fMin = %7.4f obtained after %i iterations \n\n', xMin,fMin,i)
                   return
               end
               x1 = x4; f1 = f4;          
           end
    else
        if f4 <= f2
            if abs(x4-x2)<tol
                fMin=f4; xMin=x4;
                fprintf('\n\n  xMin = %7.4f, fMin = %7.4f obtained after %i iterations \n\n', xMin,fMin,i)
                return
            end
            x1 = x2; f1 = f2; x2 = x4; f2 = f4;
        else
            if abs(x4-x3)<tol
                fMin=f4; xMin=x4;
                fprintf('\n\n  xMin = %7.4f, fMin = %7.4f obtained after %i iterations \n\n', xMin,fMin,i)
                return
            end
            x3 = x4; f3 = f4;
        end
    end
end
error('\n\n Parabolic Interpolation function did not find a minimum after %i iterations \n\n',nIter_max)