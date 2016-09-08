%records the sound for a given amount of time, and returns an array that
%represents the sound. 
function res = RecordSound(time)
recObj = audiorecorder; % baud rate 8000hz
disp('Begin Recording.')
recordblocking(recObj, time);
disp('End of Recording.');
play(recObj);
res = getaudiodata(recObj);