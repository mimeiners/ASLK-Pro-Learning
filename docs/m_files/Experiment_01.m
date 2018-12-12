clear all
close all
clc

%% Parameter f�r die �bertragungsfunktion 
%(w1 und w2 k�nnen beim open loop gain vernachl�ssigt werden)
A0 = 10000;
w1 = 1;
w2 = 1;
GB = A0*w1;
w0 = 4000000;
%% Formel f�r den G�te Faktor 
Q = 1/((sqrt(w2/GB)) + ((1/A0)*(sqrt(GB/w2))));

%% Z�hler und Nennerpolynom der �bertragungsfunktion
num = 1;
den = [1, 1/(w0*Q), 1/((w0)^2)];
%% Plot der Ergebnisse
freqs(num, den);
title('magnitude and phase response of an open loop amplifier')