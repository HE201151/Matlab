clear all;
close all;

[alien, Fs] = audioread('sound/alien_bruit2.wav');

debut = 6*Fs;
fin = 15*Fs;

noise = alien(debut:fin);

% Trois fréquences parasites présentes
Fc1 = 1050;
Fc2 = 810;
Fc3 = 484;

Wn1a = (Fc1-1)/(Fs/2);
Wn1b = (Fc1+1)/(Fs/2);
Wn2a = (Fc2-1)/(Fs/2);
Wn2b = (Fc2+1)/(Fs/2);
Wn3a = (Fc3-1)/(Fs/2);
Wn3b = (Fc3+1)/(Fs/2);

%On crée les trois fenêtres
Wn1 = [Wn1a Wn1b];
Wn2 = [Wn2a Wn2b];
Wn3 = [Wn3a Wn3b];

%Filtrage successif Butterworth sur les trois fenêtres
[b,a] = butter(1,Wn1,'stop');
noise = filter(b,a,noise);
[b,a] = butter(1,Wn2,'stop');
noise = filter(b,a,noise);
[b,a] = butter(1,Wn3,'stop');
clean = filter(b,a,noise);

alien(debut:fin)=clean;

sound(alien);
