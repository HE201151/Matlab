clc;

I=imread('Images/albireo.bmp');
subplot(2,3,1); imshow(I);


I2=im2bw(I);
%subplot(1,3,2); imshow(I2);


I3=im2bw(I,graythresh(I));
I3=~I3;
subplot(2,3,2); imshow(I3);

X = bwlabel(I3);
x=regionprops(X);

i = find(x == 1);
subplot(2,3,4); imshow(i);

Y = ismember(I3,X);

subplot(2,3,3); imshow(Y);