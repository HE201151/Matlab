clear all;
close all;
clc;
im = imread('Images/circuit1.tif');

im = im2bw(im, graythresh(im));
% Labellisation de l'image
[bw, num] = bwlabeln(im);
subplot(2,2,1);
imshow(bw);
% On d�limite les r�gions des objets
r = regionprops(bw);
% On va rechercher les objets sup�rieurs � une r�gion x
idx = find([r.Area] > 10);
subplot(2,2,3);
imshow(idx);
% On garde tout les �l�ments r�cup�r�s sur les indices
bw2 = ismember(bw, idx);
%%%
% Version avec bwareaopen
%bw2 = bwareaopen(bw,10);
subplot(2,2,2);
imshow(bw2);