function output = mknote(notestable, notename, bpm, notevalue, Fs)
%% Generate samples for music notes using a naive strategy (music-wise)

dt = 1/Fs;  % sample interval between two adjacent audio samples

[~, fnote] = notestable{strcmp(notename, cellstr(char(notestable{:, 1}))), :};

beatduration = 60 / bpm; % the duration of a beat in seconds
noteduration = notevalue * beatduration;

t = 0:dt:noteduration;
output = sin(2 * pi * str2double(fnote) * t);

