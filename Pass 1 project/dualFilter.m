function [ amp ] = dualFilter( sound, freq )
%FILTER Summary of this function goes here
%   Detailed explanation goes here
    
    % Configurable parameters
    repeats = 5;
    tolerance = 0; % hz
    window = 500; % samples
    
    for i = 1:repeats
        sound = MyLowPass(sound, freq + tolerance);
        sound = MyHighPass(sound, freq - tolerance);
        
        % An ideal sin wave degrades about this much with eachc pass.
        sound = sound .* 2.2563;
    end
    
    amp = MovingAverage(abs(sound), window);
    
    disp(mean(amp));
    
    % assuming 1s and 0s have similar precedence, this 
    % normalizes transmission differences.
    amp = amp / mean(amp); 
    
end