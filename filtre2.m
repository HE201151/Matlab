clear all; close all; clc;
im=imread('Images/lenna.bmp');
im=im2double(im);
subplot(2,2,1); imshow(im);

im(23,56)=0;
im(23,150)=0;
im(53,56)=0;
im(168,83)=0;
im(200,156)=0;

subplot(2,2,2); imshow(im);

im3=imfilter(im,[[1/9 1/9 1/9] [1/9 1/9 1/9] [1/9 1/9 1/9]]);

subplot(2,2,3); imshow(im3);

im4=medfilt2(im,[3 3]);

subplot(2,2,4); imshow(im4);