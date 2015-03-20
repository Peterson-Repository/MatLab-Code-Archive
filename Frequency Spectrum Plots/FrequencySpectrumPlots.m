clear all;
close all;

Fs = 44100;
tmax = 5; 
freqs = [100 200 300];

dt = 1/Fs;
t = 0:dt:tmax;

tones = sin(2 * pi * kron(freqs', t));

% plot first 2 periods of the component of the lowest frequency
nsamples = (1 / min(freqs) * 2) * Fs;
figure;
plot(t(1:nsamples), tones(1, 1:nsamples), 'k-'); hold on;
plot(t(1:nsamples), tones(2, 1:nsamples), 'r-');
plot(t(1:nsamples), tones(3, 1:nsamples), 'b-');
xlabel('t (seconds)');
ylabel('sin(2\pift)');
legend('f=100Hz', 'f=200Hz', 'f=300Hz', 1);

% obtain frequency components on a row, i.e., 2nd dimension or tones(i, :)
spectrum = fft(tones, Fs, 2);

% show spectrum on a figure (with 3 sub-figures)
f = -Fs/2:Fs/2-1;
spectrum = fftshift(spectrum, 2);
figure;
subplot(3, 1, 1);
semilogy(f, abs(spectrum(1, :)));
xlabel('f (Hz)');
ylabel('Magnitude');
title ('Spectrum of sin(2\pi100t)');
subplot(3, 1, 2);
semilogy(f, abs(spectrum(2, :)));
xlabel('f (Hz)');
ylabel('Magnitude');
title ('Spectrum of sin(2\pi200t)');
subplot(3, 1, 3);
semilogy(f, abs(spectrum(3, :)));
xlabel('f (Hz)');
ylabel('Magnitude');
title ('Spectrum of sin(2\pi300t)');

% zoom in on the above figure
idxselection = - (max(freqs) + 100) < f & f < (max(freqs) + 100);
figure;
subplot(3, 1, 1);
semilogy(f(idxselection), abs(spectrum(1, idxselection)));
xlabel('f (Hz)');
ylabel('Magnitude');
title ('Spectrum of sin(2\pi100t)');
subplot(3, 1, 2);
semilogy(f(idxselection), abs(spectrum(2, idxselection)));
xlabel('f (Hz)');
ylabel('Magnitude');
title ('Spectrum of sin(2\pi200t)');
subplot(3, 1, 3);
semilogy(f(idxselection), abs(spectrum(3, idxselection)));
xlabel('f (Hz)');
ylabel('Magnitude');
title ('Spectrum of sin(2\pi300t)');

% add all three togeter
savedtones = tones;
tones = sum(tones, 1);

% plot up to 2 periods of the component of the lowest frequency
figure;
plot(t(1:nsamples), tones(1:nsamples));
xlabel('t (seconds)');
ylabel('sin(2\pi100t) + sin(2\pi200t) + sin(2\pi300t)');
title('sin(2\pi100t) + sin(2\pi200t) + sin(2\pi300t) vs t');

% obtain frequency components 
spectrum = fft(tones, Fs);

% show spectrum on a figure 
f = -Fs/2:Fs/2-1;
spectrum = fftshift(spectrum);
figure;
semilogy(f, abs(spectrum));
xlabel('f (Hz)');
ylabel('Magnitude');
title ('Spectrum of sin(2\pi100t) + sin(2\pi200t) + sin(2\pi300t)');

% zoom in on the above figure
idxselection = - (max(freqs) + 100) < f & f < (max(freqs) + 100);
figure;
semilogy(f(idxselection), abs(spectrum(1, idxselection)));
xlabel('f (Hz)');
ylabel('Magnitude');
title ('Spectrum of sin(2\pi100t) + sin(2\pi200t) + sin(2\pi300t)');

% apply bandpass filter to extract 200 Hz component
component200hz = fftbpfilter(tones, Fs, Fs, 199, 201);

% show up to 2 periods of the component of the lowest frequency and
% comparing with original signal
figure;
subplot(2, 1, 1);
plot(t(1:nsamples), component200hz(1:nsamples));
xlabel('t (seconds)');
ylabel('200Hz Component');
title('200Hz Component');
subplot(2, 1, 2);
plot(t(1:nsamples), savedtones(2, 1:nsamples));
xlabel('t (seconds)');
ylabel('sin(2\pi200t)');
title('sin(2\pi200t) vs t');

% apply low pass filter to anything below 200 Hz
componentbelow200hz = fftlpfilter(tones, Fs, Fs, 200);

% show up to 2 periods of the component of the lowest frequency and
% comparing with original signal
figure;
subplot(2, 1, 1);
plot(t(1:nsamples), componentbelow200hz(1:nsamples));
xlabel('t (seconds)');
ylabel('Component below 200Hz');
title('Component below 200Hz');
subplot(2, 1, 2);
plot(t(1:nsamples), savedtones(1, 1:nsamples));
xlabel('t (seconds)');
ylabel('sin(2\pi100t)');
title('sin(2\pi100t) vs t');

% apply low pass filter to anything above 200 Hz
componentabove200hz = ffthpfilter(tones, Fs, Fs, 200);
% show up to 2 periods of the component of the lowest frequency and
% comparing with original signal
figure;
subplot(2, 1, 1);
plot(t(1:nsamples), componentabove200hz(1:nsamples));
xlabel('t (seconds)');
ylabel('Component above 200Hz');
title('Component above 200Hz');
subplot(2, 1, 2);
plot(t(1:nsamples), savedtones(3, 1:nsamples));
xlabel('t (seconds)');
ylabel('sin(2\pi300t)');
title('sin(2\pi300t) vs t');




