im = imread('Images/bwlabel_exc.jpg');

im = im2bw(im, graythresh(im));
im=~im;
bw= bwlabel(im);
R = regionprops(bw ,'Eccentricity');


idx = find([R.Eccentricity] > 0.6);
% On garde tout les éléments récupérés sur les indices
bw2 = ismember(bw, idx);

imshow(bw2);



