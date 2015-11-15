%% MOLECULE Hexagon Molecule Curve
%   Z = MOLECULE(N) is a closed curve in the complex plane
%   with 6*3^N+1 points. N is a nonnegative integer.
%   Author: jonas.lundgren@saabgroup.com, 2010.
%   Example
%   	plot(molecule(6)), axis equal
%   Modified by RRF
clear; clc; clf;
%% PARAMETROS
n=10;        % Number of iterations

speed=0.5;  % speed (number of seconds/frame) - default: 0.4
%% Constants
a = (1 + sqrt(-3))/2;
b = (1 - sqrt(-3))/2;
c = [1; a; -b; -1; -a; b];
%% Segment angles (divided by pi/3)
u = 0;
for k = 1:n
    u = [u+1; -u; u-1];
    fprintf('.');
    pause(speed);
    tmp = [u; 1-u; 2+u; 3-u; 4+u; 5-u];
    tmp = mod(tmp,6);
    % Points
    z = cumsum(c(tmp+1));
    z = [0; z/2^n];
    plot(z), axis equal
end
fprintf('\n\n');