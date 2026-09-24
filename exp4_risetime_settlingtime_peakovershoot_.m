clc; clear all; close all;

% Given parameters from handwritten derivations
zeta = 0.5;
wn = 10;
K = wn^2; % Calculated gain K = 100

% Define the open-loop transfer function components
num = [K];
den = [1 10 K]; % s^2 + 10s + K
sys = tf(num, den);

% Calculate analytical time-domain specifications
wd = wn * sqrt(1 - zeta^2);
phi = atan(sqrt(1 - zeta^2) / zeta); % in radians

tr = (pi - phi) / wd;
tp = pi / wd;
ts_2pct = 4 / (zeta * wn);
ts_5pct = 3 / (zeta * wn);
Mp = exp((-zeta * pi) / sqrt(1 - zeta^2));
pct_Mp = Mp * 100;

% Display the calculated values in the command window
fprintf('--- Calculated Time-Domain Specifications ---\n');
fprintf('Calculated Gain (K): %d\n', K);
fprintf('Rise Time (tr): %.4f sec\n', tr);
fprintf('Peak Time (tp): %.4f sec\n', tp);
fprintf('Settling Time (ts - 2%% Criterion): %.4f sec\n', ts_2pct);
fprintf('Settling Time (ts - 5%% Criterion): %.4f sec\n', ts_5pct);
fprintf('Peak Overshoot (Mp): %.4f\n', Mp);
fprintf('Percentage Peak Overshoot (%%Mp): %.2f%%\n', pct_Mp);

% Plot the Unit Step Response to visually verify values
figure;
step(sys);
grid on;
title('Unit Step Response for Problem 4');
xlabel('Time (seconds)');
ylabel('Output c(t)');
