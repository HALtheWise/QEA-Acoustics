function [ sound ] = MyLowPass( x, freq )
    % This filter was taken from http://stackoverflow.com/questions/1783633/matlab-apply-a-low-pass-or-high-pass-filter-to-an-array
    
    samplebaud = 8000;
    
    sampletime = 1/samplebaud;
    
    % the 6* in here is a fudge factor, I don't know why its necessary.
    signaltime = 1/(6*freq);
    
    a = sampletime / signaltime;
    
    sound = filter(a, [1, a-1], x);

end

