function transmit(string)
    zerofreq = 600; %hz
    onefreq = 1000; %hz
    transmitbaud = 15;
    
    %% String to Bits
    bits = StringToBits(string);
    disp(bits);
    bits = reshape(bits',[1,numel(bits)]);
    
    %% Generate sin waves
    
    speakerbaud = 8000;
    
    
    baudratio = round(speakerbaud/transmitbaud);
    
    zerosin = sin(linspace(0,zerofreq / transmitbaud * 2 * pi, baudratio));
    onesin = sin(linspace(0,onefreq / transmitbaud * 2 * pi, baudratio));
    
    %% Interleave sin waves
    output = zeros([1, baudratio * length(bits)]);
    
    for i = 1:length(bits)
        bit = bits(i);
        
        if bit == '1'
            output((i-1)*baudratio+1 : i*baudratio) = onesin;
        else
            output((i-1)*baudratio+1 : i*baudratio) = zerosin;
        end
        
    end
    
    %% Play sound
    sound(output, speakerbaud);
    audiowrite('audio.wav',output,speakerbaud);
    
end