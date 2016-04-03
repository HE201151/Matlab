
[alien,Fs,nbits] = wavread('alien_bruit1.wav');
debut = 6*Fs;
fin = 15*Fs;
alienBruit = alien(debut:fin);
%sptool;
%sound(alienBruit);

Fc=2500;

Wn1 = (Fc-1) / (Fs/2);
Wn2 = (Fc+1) / (Fs/2);

Wn = [Wn1 Wn2];

[b,a]=butter(2,Wn,'stop');

bruitFilter = filter (b,a,alienBruit);

%sound(ans);
%sound(bruitFilter);
%sound(alienBruit);
alien(debut:fin) = bruitFilter ;
%sound(alien);

[alien2, FS ,nbits] = wavread('alien_bruit2.wav');
%sound(alien2);
debut = 6*Fs;
fin = 15*Fs;
bruit2 = alien2(debut:fin);

Fc = 1050;

w1=(Fc-1) / (Fs/2);
w2=(Fc+1) / (Fs/2);

Wn2 = [w1 w2];

[b,a]= butter(2,Wn2,'stop');
bruit2Filter = filter(b,a,bruit2);

%sound(ans);
%sound(bruit2Filter);
alien2(debut:fin)=bruit2Filter;
sptool;
