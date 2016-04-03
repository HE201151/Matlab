clear all; close all; clc;
im=imread('Images/diapo1.jpg');

subplot(2,2,1); imshow(im);

im(:,:,1)=im(:,:,1)*0.9;
im(:,:,2)=im(:,:,2)*1.5;
im(:,:,3)=im(:,:,3)*1.2;

subplot(2,2,2); imshow(im);

im(:,:,1)=im(:,:,1)*0.9;
im(:,:,2)=im(:,:,2)*1.0;
im(:,:,3)=im(:,:,3)*0.2;

subplot(2,2,3); imshow(im);

%edge(im, 'sobel');
im=-im;

subplot(2,2,4); imshow(im);
