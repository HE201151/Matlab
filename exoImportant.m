clear all;
close all;
fs = 8000;
t = 0: 1/fs : 0.5;
f = 261.6;
y = [];
for i=1 : 6
f1 = f;
for i=1 : 3
w = 2 * pi * f1;
x = 0.01 * sin(w*t);
y = [y,x]; % concatenation en 1 ligne
f1 = f1*2^(1/6); % note suivante
end ;
f=f*2; % octave suivante
end;
%sound(y,fs) ;
debut = 6.053125*fs;
fin = 9.002125*fs;
BRUIT = y(debut:fin);
Fc = 2000;
Wn1 = (Fc-1999)/(fs/2);
Wn2 = (Fc+1999)/(fs/2);
Wn = [Wn1 Wn2];
[b,a]= butter(1,Wn,'stop') ; %on met un coupe bande
deBRUIT = filter(b,a,BRUIT);
%sound(BRUIT);
%sound(deBRUIT); %son du signal atténué
y(debut:fin)=deBRUIT;
sound(y,fs) ;