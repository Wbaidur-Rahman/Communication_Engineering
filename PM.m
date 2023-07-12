clc;
clear all;
close all;

% Signal parameters
Am = 1;               % Amplitude of the message signal
fm = 10;              % Frequency of the message signal (Hz)
Ac = 2;               % Amplitude of the carrier signal
fc = 100;             % Frequency of the carrier signal (Hz)
modulation_index = 1; % Modulation index (Phase deviation / Maximum phase change)

% Time parameters
t = 0:0.001:1;        % Time vector (from 0 to 1 second with a step size of 0.001 second)

% Generate the message signal
message_signal = Am * sin(2*pi*fm*t);

% Generate the carrier signal
carrier_signal = Ac * sin(2*pi*fc*t);

% Generate the PM modulated signal
phase_deviation = modulation_index * max(message_signal);
modulated_signal = Ac * sin(2*pi*fc*t + phase_deviation * cumsum(message_signal));

% Plotting
subplot(3, 1, 1);
plot(t, message_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Message Signal');

subplot(3, 1, 2);
plot(t, carrier_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Carrier Signal');

subplot(3, 1, 3);
plot(t, modulated_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('PM Modulated Signal');

% Adjusting the subplot layout
sgtitle('Phase Modulation (PM)');

