% these are the frequency indices to be plotted. Don’t
% worry about this or the fftshift below yet
fs = linspace(-Fs/2, -Fs/2*(length(wb)-1)/length(wb),length(wb));
plot(fs,abs(fftshift(fft(wb))), 'b');
hold on
plot(fs,abs(fftshift(fft(lf))), 'm');