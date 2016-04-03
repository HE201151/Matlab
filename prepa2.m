f=8000;
f1=440;
f2=50;
T=10;
A1=1;
A2=0.5;

t=0:1/f:T;
w=2*pi*f1;
w2=2*pi*f2;

T1=A1*sin(w*t);
T2=A2*sin(w2*t);

TT=T1+T2;
sptool;
