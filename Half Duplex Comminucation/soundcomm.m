% only implement half-duplex communication
clear all;
close all;

% addpath('../netstack');
% sendmsg('Hello');

while 1
    fprintf(1, '\nSoundComm Menu: \n\t[1] Send a message\n\t[2] Receive a message\n\t[0] Exit\n');
    choice = input('Enter your choice:', 's');
    switch choice
        case {'1'}
            fprintf(1, '\tSoundComm: Sending Function Started\n\t\t');
            msg = input('Enter a short message:', 's');
            sendmsg(msg);
            fprintf(1, '\t\tSoundComm: Message Sent\n');
        case {'2'}
            fprintf(1, '\tSoundComm: Receiving Function Started\n');
            msg = receivemsg();
            fprintf(1, '\t\tSoundComm: Message Received:%s\n', msg);
        case {'0'}
            fprintf(1, 'SoundComm exited\n');
            break;
        otherwise
            fprintf(1, 'SoundComm: Invalid choice.\n');
    end
end

