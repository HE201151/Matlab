I=imread('3-1.png');
i=imread('1.png');
size(I);
size(i);

se90 = strel('line', 4, 90);
se0 = strel('line', 4, 0);

BW = edge(I,'sobel',0.1) ;

BWsdil = imdilate(BW, [se90 se0]);

BWdfill = imfill(BWsdil, 'holes');

seD = strel('diamond',1);
BWfinal = imerode(BWdfill,seD);
BWfinal = imerode(BWfinal,seD);

BWoutline = bwperim(BWfinal);
Segout = i;
Segout(BWoutline) = 255;
imshow(Segout)
