I=imread('pout.tif');
subplot(2,2,1);
imshow(I);
% 2.
im=I*1.2; % on augmente l'intensité
subplot(2,2,2);
imshow(im);
im=histeq(I); % égalisation histogramme
subplot(2,2,3);
imshow(im);
% 3.
I=imread('pout.tif');
im=imadjust(I); % correction gamma
subplot(2,2,4);
imshow(im);