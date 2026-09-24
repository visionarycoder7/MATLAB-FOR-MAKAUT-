clc;
clear;
close all;

% Specifications
Fs = 1000;            % Sampling frequency (Hz)
F1 = 150;             % Lower stopband frequency (Hz)
F2 = 300;             % Upper stopband frequency (Hz)
N  = 4;               % Filter order

% Normalize frequencies
Wn = [F1 F2]/(Fs/2);

% Design Band-Stop Butterworth Filter
[b, a] = butter(N, Wn, 'stop');

% Frequency response
freqz(b, a, 1024, Fs);
title('Band Stop Butterworth Filter');