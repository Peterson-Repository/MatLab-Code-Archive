function newnote = smoothnote(note)
%% smooth the node by adjusting the volume of the first and last portion of
%% the note.

    len = length(note);
    
    fadeinportion = 0.05;
    fadeoutportion = 0.1;
    
    nfadein = ceil(len * fadeinportion);
    nfadeout = ceil(len * fadeoutportion);
    
    % use a linear function for the fade-in and fade-out 
    fadein = (0:nfadein) / nfadein;
    fadeout = (nfadeout:-1:0) / nfadeout;
    
    % fade in ...
    note(1:nfadein+1) = fadein .* note(1:nfadein+1);
    
    % fade out ...
    note(end-nfadeout:end) = fadeout .* note(end-nfadeout:end);
    
    newnote = note;
end