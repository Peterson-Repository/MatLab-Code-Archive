notestable = loadmusicnotes;
Fs = 44100;

bpm = 30; % beats per minute
song = {'C4' 1/4    
    'D4' 1/4
    'E4' 1/4
    'C4' 1/4
    'C4' 1/4
    'D4' 1/4
    'E4' 1/4
    'C4' 1/4
    'E4' 1/4
    'F4' 1/4
    'G4' 1/2
    'E4' 1/4
    'F4' 1/4
    'G4' 1/2
    'G4' 1/8
    'A4' 1/8
    'G4' 1/8
    'F4' 1/8
    'E4' 1/4
    'C4' 1/4
    'G4' 1/8
    'A4' 1/8
    'G4' 1/8
    'F4' 1/8
    'E4' 1/4
    'C4' 1/4
    'C4' 1/4
    'G3' 1/4
    'C4' 1/2
    'C4' 1/4
    'G3' 1/4
    'C4' 1/2
    };
   
numnotes = size(song, 1);

% play the song
output = [];
for i=1:numnotes
    notename = song{i, 1};
    notevalue = song{i, 2};
    note = mknote(notestable, notename, bpm, notevalue, Fs);
    note = smoothnote(note);
    output = cat(2, output, note);  % join notes by concatenating two vectors
    sound(note, Fs);                % poorer quality by playing a note at time
                                    % when comparing with line 54
end
sound(output, Fs);                  % is the 2nd one better?