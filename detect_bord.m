close all; clear all; clc;

I=imread('pout.tif');

subplot(2,3,3);
edge(I,'sobel');
subplot(2,3,4);
edge(I,'canny');

 h=fspecial('sobel');
 
I= imfilter(I,h);
subplot(2,3,5);
imshow(I);