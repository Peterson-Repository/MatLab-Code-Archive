function [msg found] = receivemsg()
% naive msg receiving function


    %% physical layer
    % set recording parameters
    Fs = 44100;
    numchannels = 1;
    nbitspersample = 16;

    % create audiorecorder object
    recobj = audiorecorder(Fs, nbitspersample, numchannels);

    % start recording
    fprintf(1, 'Recording in progress ... \n');
    record(recobj);

    % record for 5 seconds
    pause(5);
    stop(recobj);

    % obtain recorded data
    soundsamples = getaudiodata(recobj, 'int16');

    % detect signal
    % modulation and framing parameters
    modulation = 'ook';
    framing = 'hdlc';
    nsamplesperbit = 400;
    nperiodsperbit = 4;
    Fs = 44100;    
    fstart = detectframe(soundsamples, framing, modulation, nsamplesperbit, nperiodsperbit, Fs);
    
    %% link layer
    if (fstart <= 0)
        found = 0;
    else
        % decode frame
        frame = decodeframe(fstart, soundsamples, framing, modulation, nsamplesperbit, nperiodsperbit, Fs);

        % obtain frame data
        msg = frame2msg(frame, framing);
        found = 1;        
    end
end