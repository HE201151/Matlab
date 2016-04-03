Fs=8000;
F=440;
F2=1500;
Fc=440;
t=0:1/Fs:2;

Wn = Fc/(Fs/2);

s=sin(2*pi*F*t);
s2=sin(2*pi*F2*t);
ss=s+s2;
[b,a]=butter(3,Wn,'low');
sy= filter(b,a,ss);
sound(ss);
sound(sy);
sound(s);


