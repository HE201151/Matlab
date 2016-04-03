[s,Fs] = wavread('MORSE2.wav');


debut=3*Fs;
fin=9*Fs;
sBruit = s(debut:fin);

fc = 708;
w1=(fc-5) / (Fs/2);
w2=(fc+5) / (Fs/2);

wn = [w1 w2];

[b,a] = butter(1,wn);
filtre = filter(b,a,sBruit);
s(debut:fin)=filtre;


im = imread('Images/bwlabel_exc.jpg');

im = im2bw(im,graythresh(im));

imi = ~im;
subplot(3,2,1);
imshow(im);
subplot(3,2,2);
imshow(imi);

subplot(3,2,3);
edge(im,'sobel');

lab = bwlabel(imi);
R = regionprops(lab ,'Eccentricity');
idx = find([R.Eccentricity] < 0.1);
is = ismember(lab, idx);
subplot(3,2,4);
imshow(is);

area=bwareaopen(imi,450);

subplot(3,2,5);
imshow(area);


im2 = filter(im,

subplot(3,2,6);
imshow(area);





