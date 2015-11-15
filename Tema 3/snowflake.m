%% SNOWFLAKE Koch Snowflake Curve
%   Z = SNOWFLAKE(N,A) is a closed curve in the complex plane
%   with 3*2^N+1 points. N is a nonnegative integer and A is a
%   complex number with |A| < 1 and |1-A| < 1.
%   Default is A = 1/2 + i*sqrt(3)/6.
%   Author: jonas.lundgren@saabgroup.com, 2010.
%   Examples
%       plot(snowflake(10)), axis equal
%       plot(snowflake(10,0.45+0.35i)), axis equal
%   Modified by RRF
%       plot(snowflake(n,a)), axis equal
clear; clc; clf;
%% PARAMETROS
n=10;        % Number of iterations
a=1/2 + sqrt(-3)/6;

speed=0.5;  % speed (number of seconds/frame) - default: 0.4
%% Constants
b = 1 - a;
c = 1/2 + sqrt(-3)/2;
d = 1 - c;
%% Generate point sequence
z = 1;
for k = 1:n
    z = conj(z);
    z = [a*z; b*z+a];
    fprintf('.');
    pause(speed);
    plot([0; z; 1-c*z; 1-c-d*z]), axis equal
end
%% Close snowflake
z = [0; z; 1-c*z; 1-c-d*z];
fprintf('\n\n');