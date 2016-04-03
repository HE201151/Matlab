clear all;
close all;
clc;
im = imread('Images/circuit1.tif');

im = im2bw(im, graythresh(im));
% Labellisation de l'image
[bw, num] = bwlabeln(im);
subplot(2,2,1);
imshow(bw);
% On délimite les régions des objets
r = regionprops(bw);
% On va rechercher les objets supérieurs à une région x
idx = find([r.Area] > 10);
subplot(2,2,3);
imshow(idx);
% On garde tout les éléments récupérés sur les indices
bw2 = ismember(bw, idx);
%%%
% Version avec bwareaopen
%bw2 = bwareaopen(bw,10);
subplot(2,2,2);
imshow(bw2);