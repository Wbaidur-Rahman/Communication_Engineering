clc;
clear all;
close all;

% Signal parameters
Am = 1;               % Amplitude of the message signal
fm = 10;              % Frequency of the message signal (Hz)
Ac = 2;               % Amplitude of the carrier signal
fc = 100;             % Frequency of the carrier signal (Hz)
modulation_index = 0.5;   % Modulation index (Amplitude of message signal / Amplitude of carrier signal)

% Time parameters
t = 0:0.001:1;        % Time vector (from 0 to 1 second with a step size of 0.001 second)

% Generate the message signal
message_signal = Am * sin(2*pi*fm*t);

% Generate the carrier signal
carrier_signal = Ac * sin(2*pi*fc*t);

% Generate the modulated signal
modulated_signal = (1+modulation_index * message_signal) .* carrier_signal;

% Plotting
subplot(4, 1, 1);
plot(t, message_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Message Signal');

subplot(4, 1, 2);
plot(t, carrier_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Carrier Signal');

subplot(4, 1, 3);
plot(t, modulated_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('AM Modulated Signal');

demodulated_signal = (modulated_signal./carrier_signal - 1)/0.5;

subplot(4, 1, 4);
plot(t, demodulated_signal);
ylim([-1,1]);
xlabel('Time (s)');
ylabel('Amplitude');
title('AM DeModulated Signal');

