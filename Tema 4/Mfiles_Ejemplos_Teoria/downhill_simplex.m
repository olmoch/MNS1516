function [xMin,fMin,nCycl] = downhill_simplex(func,x0,b,tol)
% Downhill simplex method for minimizing f(x1,x2,...,xn).
% USAGE: [xMin,fMin,nCycl] = downhill(func,xStart,b,tol)
% INPUT:
%   func = handle of function to be minimized.
%   x0 = coordinates of the starting point.
%   b = initial edge length of the simplex (default = 0.1).
%   tol = error tolerance (default = 1.0e-4).
% OUTPUT:
%   xMin = coordinates of the minimum point.
%   fMin = minimum value of f
%   nCycl = number of cycles to convergence.

if nargin < 4; % nargin = number of input arguments
    tol = 1.0e-4; % Default value for the tolerance
end

if nargin < 3; % nargin = number of input arguments
    b = 0.1; % Default value for the initial size of the simplex
end

nCycl_max=500;

n = length(x0); % Number of coords (design variables)
x = zeros(n+1,n); % Coordinates of the n+1 vertices
f = zeros(n+1,1); % Values of ’func’ at the vertices

%% Generate starting simplex of edge length ’b’
x(1,:) = x0;
for i = 2:n+1
    x(i,:) = x0;
    x(i,i-1) = x0(i-1) + b;
end
%% Compute func at vertices of the simplex
for i = 1:n+1; f(i) = func(x(i,:)); end

%% Main loop
fprintf('\n iter    fLo     fHi     MOVEMENT');
for nCycl = 1:nCycl_max % Allow at most "nCycl_max" cycles    
    % Find highest and lowest vertices
    [fLo,iLo]= min(f); [fHi,iHi] = max(f);
    % Compute the move vector d
    d = -(n+1)*x(iHi,:);
    for i = 1:n+1; d = d + x(i,:); end
    d = d/n;
    % Check for convergence
    if sqrt(dot(d,d)/n) < tol
        xMin = x(iLo,:); fMin = fLo;
        return
    end
    % Try reflection
    xNew = x(iHi,:) + 2.0*d;
    fNew = func(xNew);
    if fNew <= f(iLo) % Accept reflection
        x(iHi,:) = xNew; f(iHi) = fNew;
        % Try expansion
        xNew = x(iHi,:) + d; fNew = func(xNew);
        if fNew <= f(iLo) % Accept expansion
            x(iHi,:) = xNew; f(iHi) = fNew;
            fprintf('\n  %2i  %7.4f %7.4f    reflection & expansion ',nCycl,f(iLo),f(iHi))
            continue
        else
            fprintf('\n  %2i  %7.4f %7.4f    reflection ',nCycl,f(iLo),f(iHi))
        end
    else
        if fNew <= f(iHi)
            x(iHi,:) = xNew; f(iHi) = fNew;
            fprintf('\n  %2i  %7.4f %7.4f    shrinkage ',nCycl,f(iLo),f(iHi))
            continue
        else
            % Try contraction
            xNew = x(iHi,:) + 0.5*d; fNew = func(xNew);
            if fNew <= f(iHi) % Accept contraction
                x(iHi,:) = xNew; f(iHi) = fNew;
                fprintf('\n  %2i  %7.4f %7.4f    contraction ',nCycl,f(iLo),f(iHi))
                continue
            else
                % Shrinkage
                for i = 1:n+1
                    if i ~= iLo
                        x(i,:) = 0.5*(x(i,:) + x(iLo,:));
                        f(i) = func(x(i,:));
                    end
                end
            end
        end
    end
end % End of main loop
error('Too many cycles in downhill simplex')