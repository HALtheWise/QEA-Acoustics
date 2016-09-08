function string = recieve()
    zerofreq = 500; %hz
    onefreq = 1000; %hz
    
    micbaud = 8000;
    transmitbaud = 15;
    
    global baudratio
    baudratio = micbaud / transmitbaud;
    
    %% Record sound
    [audio, ~] = audioread('audio.wav');
    %audio = RecordSound(20);
    
    %% Filter and compute amplitudes
    zeroamp = dualFilter(audio, zerofreq);
    oneamp = dualFilter(audio, onefreq);
    
    clf
    hold on
    plot(zeroamp, 'r')
    plot(oneamp, 'b')

    %% Detect SOM / EOM
    
    for i = 1:length(zeroamp)
        if zeroamp(i) > 1 || oneamp(i) > 1
            signalstart = round( i + baudratio/2 );
            break
        end
    end
    
    
    for i = length(zeroamp):-1:1
        if zeroamp(i) > 1 || oneamp(i) > 1
            signalend = round( i + baudratio*2 );
            break
        end
    end
    
    signalstart
    signalend
    
    zeroamp = zeroamp(signalstart:signalend);
    oneamp = oneamp(signalstart:signalend);
    
    %% Extract every nth
    
    zeroamp = zeroamp(1:baudratio:length(zeroamp));
    oneamp = oneamp(1:baudratio:length(oneamp));
    
    %% Compare
    bits = '';
    
    for i = 1:length(zeroamp)
        if zeroamp(i) > oneamp(i)
            bits(i) = '0';
        else
            bits(i) = '1';
        end
    end
    disp(bits)
    string = '';
    for i = 1:floor(length(zeroamp)/8)
        string(i) = BitsToStrings(bits((i-1)*8+1:i*8));
    end
    
end