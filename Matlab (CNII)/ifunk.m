function [y] = ifunk (k)
y = integral (@(x) x.*sin(4*log(x.*k)),0.5,7);