clear all; close all; clc;


% "La" multipli�
fs = 11025;                     % �chantillonage a 11Khz, FS = sampling frequency
t = 0: 1/fs : 0.1;              % de 0 � 0.1 secondes (assez rapide)
f = 440;                        % fr�quence de base
y = [];

for i=1 : 18
w = 2 * pi * f;                 % omega = 2*pi*f
x = 0.5 * sin(w*t);             % calcul du sinus = A*sin(wt)
y = [y,x];                      % concatenation en 1 ligne
f = f*2^(1/6);                  % passer a la note suivante
end ;
%sound(y,fs) ;


% BRUIT
FS = 22000;                     %Fr�quence d��chantillonnage
t = 0 : 1/FS : 4;
f = 440 ;                       %fr�quence
w = 2*pi*f;                     %vitesse angulaire
A = 0.1 ;                       %petite amplitude pour pas s'exloser les timpans
y = sin(w*t);                   %calcul du sinus = A*sin(wt)
                                %l'amplitude sera ajout� au signal bruit�
r = rand(size(y));              %G�n�re une matrice avec des valeurs
                                %al�atoires (bruit)
y = (y + r)*A;
%sound(y,FS);


% AMMORTIS
f=440;                          %la fr�quence des signaux amorties
fs = 10000;                     %fr�quence d'�chantillonnage
t=0:1/fs:0.5;                   %le cylcle d'oscillation = 0.5s
delta=10;                       %le facteur d'amortissement est de 10
s=exp(-delta*t).*sin(2*pi*f*t); %Signal amorti
s2=[];                          %tableau qui va regrouper toutes les signaux amortis
for i=1:10                      %succession d'oscillations amorties
s2=[s2,s];
end
%plot(s2);
%sound(s2,fs);







