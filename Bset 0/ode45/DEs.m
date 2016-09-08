function [ dy ] = DEs( ~, y )
%DES Summary of this function goes here
%   Detailed explanation goes here
    x = y(1);
    v = y(2);
    
    %% setup params
    p.alpha = 1;
    p.beta = 1;
    
    %% Calculate derivatives
    xdot = v;
    vdot = -p.alpha * x - p.beta * v^2;
    
    dy = [xdot; vdot];

end

