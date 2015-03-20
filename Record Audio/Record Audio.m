clear all;
close all;

% prepare output file
outputfile = sprintf('record_%s.wav', datestr(now, 'yyyymmddTHHMMSS'));

% set recording parameters
Fs = 44100;
numchannels = 1;
nbitspersample = 16;

% create audiorecorder object
recobj = audiorecorder(Fs, nbitspersample, numchannels);

% start recording
fprintf(1, 'Recording in progress ... \n');
record(recobj);     

% wait for user's interruption
keyin = 'C';
while ~strcmpi(keyin, 's')
    keyin = input('Press S and Enter to stop recording:', 's');
end
stop(recobj);

% obtain recorded data
soundsamples = getaudiodata(recobj, 'int16'); 

% save the recording to the WAVE file
fprintf(1, 'Writing the recording to file %s ...', outputfile);
wavwrite(soundsamples, Fs, outputfile);
fprintf(1, 'Done\n');
