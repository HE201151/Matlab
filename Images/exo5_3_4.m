clear all;
close all;

I=imread('pout.tif');

subplot(231);
edge(I(:,:),'sobel');

subplot(232);
edge(I(:,:),'canny');