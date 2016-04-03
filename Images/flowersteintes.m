clear all; close all;
Img=imread('flowers.tif');
subplot(411);
imshow(Img);
imgR=Img;
imgB=Img;
imgV=Img;

subplot(412);
imgR(:,:,2:3)=0;
imshow(imgR);

subplot(413);
imgV(:,:,1)=0;
imgV(:,:,3)=0;
imshow(imgV);

subplot(414);
imgB(:,:,1:2)=0;
imshow(imgB);