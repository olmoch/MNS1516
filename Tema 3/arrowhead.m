%% ARROWHEAD Sierpinski Arrowhead Curve
%   Z = ARROWHEAD(N) is a continuous curve in the complex plane
%   with 3^N+1 points. N is a nonnegative integer. 
%   Author: jonas.lundgren@saabgroup.com, 2010.
%   Example
%       plot(arrowhead(7))
%   Author: jonas.lundgren@saabgroup.com, 2010.
%   Modified by RRF
clear; clc; clf;
%% PARAMETROS
n=7;        % Number of iterations

speed=0.5;  % speed (number of seconds/frame) - default: 0.4
%% Constants
a = (1 + sqrt(-3))/2;
b = (1 - sqrt(-3))/2;
%% Generate point sequence
z = 0;
for k = 1:n
    w = conj(z);
    z = [a*w; z+a; b*w+a+1]/2;
    fprintf('.');
    pause(speed);
    plot([z; 1]), axis equal
end
%% Add endpoint
z = [z; 1];
fprintf('\n\n');