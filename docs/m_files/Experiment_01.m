clear all
close all
clc

%% Parameter f�r die �bertragungsfunktion 
%(w1 und w2 k�nnen beim open loop gain vernachl�ssigt werden)
A0 = 100000;
f_un = 3e6;
f_3_db = f_un/A0;
w1 = f_3_db*pi*2;
w2 = f_un*pi*2;
GB = A0*w1;
w0 = 3e6*pi*2;
%% Formel f�r den G�te Faktor 
Q = 1/((sqrt(w2/GB)) + ((1/A0)*(sqrt(GB/w2))));

%% Z�hler und Nennerpolynom der �bertragungsfunktion
num = 1;
den = [1, 1/(w1*Q), 1/((w1)^2)];
%% Plot der Ergebnisse
f = linspace(0,4e6,1001);
w = 2*pi*f;

freqs(num, den, w);

title('magnitude and phase response of an open loop amplifier')