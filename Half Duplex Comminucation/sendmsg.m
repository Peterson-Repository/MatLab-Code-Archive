function [status numattempts] = sendmsg(msg)
% send a message over the sound medium.
%   SENDMSG(msg) sends a message through the sound medium. msg is the 
%   message to be sent and considered as a byte array

    % generate binary frame in which each element represents a bit
    nbits = length(msg) * 8;
    [frame szframe] = mkframe(msg, nbits, 'hdlc');
        
    % send the binary frame over the sound medium.
    [status numattempts] = sendvialink(frame, szframe, 'ook');
end