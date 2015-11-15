%% DRAGON Dragon Curve
%   Z = DRAGON(N) is a continuous curve in the complex plane
%   with 2^(N+1) points. N is a nonnegative integer. 
%   Author: jonas.lundgren@saabgroup.com, 2010.
%   Example
%       z = dragon(12);
%       figure(1), plot(z), axis equal
%       figure(2), plot(reshape(z,[],4)), axis equal
%   Modified by RRF
clear; clc; clf;
%% PARAMETROS
n=12;        % Number of iterations

speed=0.5;  % speed (number of seconds/frame) - default: 0.4
%% Constants
a = (1 + 1i)/2;
b = (1 - 1i)/2;
c = sqrt(1/2);
%% Generate point sequence
z = [1-c; c];
for k = 1:n
    w = z(end:-1:1);
    z = [a*z; 1-b*w];
    fprintf('.');
    pause(speed);
    subplot(1,2,1), plot(z), axis equal
    subplot(1,2,2), plot(reshape(z,[],4)), axis equal
end
fprintf('\n\n');
