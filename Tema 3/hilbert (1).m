%% HILBERT Hilbert Curve
%   Z = HILBERT(N) is a continuous curve in the complex plane
%   with 4^N points. N is a nonnegative integer.
%   Author: jonas.lundgren@saabgroup.com, 2010.
%   Example
%       plot(hilbert(5))
%   Modified by RRF
clear; clc; clf;
%% PARAMETROS
n=6;        % Number of iterations

speed=0.5;  % speed (number of seconds/frame) - default: 0.4
%% Constants
a = 1 + 1i;
b = 1 - 1i;
%% Generate point sequence
z = 0;
for k = 1:n
    w = 1i*conj(z);
    z = [w-a; z-b; z+a; b-w]/2;
    fprintf('.');
    pause(speed);
    plot(z), axis equal
end
fprintf('\n\n');