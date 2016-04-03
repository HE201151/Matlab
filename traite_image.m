clc;
close all;
clear all;
I = imread('Images/flowers.tif');

%subplot(1,3,1);
%imshow(I);


I=im2double(I);
I2(:,:) = 0.299*I(:,:,1)+0.587*I(:,:,2)+0.114*I(:,:,3);

%subplot(1,3,2);
%imshow(I2);

I3=rgb2gray(I);

[X,Y]=meshgrid(1:151,1:208);
I3(1:10,1:10)=1;
%subplot(1,3,3);
mesh(I3);

V=zeros(400,400,3);
V(1:400,1:400,1:3)=255;

V(1:100,1:100,3)=I(end-5,end-5,3);
V(1:100,1:100,2)=I(end-5,end-5,2);
V(1:100,1:100,1)=I(end-5,end-5,1);

V(300:400,300:400,1:3)=0;
V(300:400,300:400,2)=255;
