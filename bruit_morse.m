[morse, Fs] = wavread('MORSE2.wav');

% La fr�quence principale semble �tre 708
Fc = 1383;
% Fen�trage autour de 5Hz de la fr�quence � garder
Wn1 = (Fc-5)/(Fs/2);
Wn2 = (Fc+5)/(Fs/2);
Wn = [Wn1 Wn2];
[b,a] = butter(1, Wn);
clean = filter(b,a,morse);
sound(clean);