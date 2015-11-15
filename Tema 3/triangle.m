%% TRIANGLE Sierpinski Triangle Curve
%   Z = TRIANGLE(N) is a closed curve in the complex plane
%   with 2*3^N+2 points. N is a nonnegative integer. 
%   Author: jonas.lundgren@saabgroup.com, 2010.
%   Modified by RRF
clear; clc; clf;

%% PARAMETROS
n=6;        % Number of iterations

speed=0.5;  % speed (number of seconds/frame) - default: 0.4
%% Constants
a = (1 + sqrt(-3))/2;
%% Generate point sequence
z = [0; 1];
for k = 1:n
    z = [z; z+a; z+1]/2;
    fprintf('.');
    %pause(speed);
    clc;fprintf('press a key to continue');pause
    plot([z; a; 0]), axis equal
end
%% Close triangle
z = [z; a; 0];
fprintf('\n\n');
