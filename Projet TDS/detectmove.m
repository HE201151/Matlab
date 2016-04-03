function detectmove(image1, image2)

%-----------------------------------------
%-------- Traitement de l'image 1 --------
%-----------------------------------------

% Converti l'image RGB en YCBCR.
image=rgb2ycbcr(image1);
image2=rgb2ycbcr(image2);

% Créé la matrice a qui représente Cb (Y' - bleu).
a=image(:,:,2);
% Créé la matrice b qui représente Cr (Y' - rouge).
b=image(:,:,3);

% Permet de parcourir l'image et de la transformer en image binaire.
for i=1:480
    for j=1:640
        if((a(i,j)>=70)&&(b(i,j)>=140)&&(a(i,j)<=150)&&(b(i,j)<=210))
            imageBW(i,j)=1; % Mets le pixel en blanc
        else imageBW(i,j)=0; % Mets le pixel en noir
        end
    end
end

% Permet de dilater les pixels.
imageBW = imdilate(imageBW,strel('disk',5)); 
% Permet de supprimer les parties d?image qui ont moins de 10 000 pixels.
imageBW = bwareaopen(imageBW, 10000);
% Remplit les trous dans l'image binaire pour que la forme soit remplie.
imageBW = imfill(imageBW,'holes');
% Permet d'éroder l'image binaire.
% La fonction strel va appliquer une forme arrondie lors du rognage.
imageBW = imerode(imageBW,strel('disk',15)); 
% Permet de dilater les pixels. 
imageBW = imdilate(imageBW,strel('disk',10));  
% Calcule les centroïdes des composants connectés à l'image
stat = regionprops(imageBW,'centroid');

% Va stocker dans la variable cx1 la position sur la droite des abcisses du
% centroïdes.
x1 = stat(1).Centroid(1);
% Va stocker dans la variable cy1 la position sur la droite des abcisses du
% centroïdes.
y1 = stat(1).Centroid(2);


%---------------------------------------
%--------Traitement de l'image 2--------
%---------------------------------------


% Créé la matrice a qui représente Cb (Y' - bleu).
a=image2(:,:,2);
% Créé la matrice b qui représente Cr (Y' - rouge).
b=image2(:,:,3);

% Permet de parcourir l'image et de la transformer en image binaire.
for i=1:480
    for j=1:640
        if((a(i,j)>=70)&&(b(i,j)>=140)&&(a(i,j)<=150)&&(b(i,j)<=210))
            imageBW(i,j)=1; % Mets le pixel en blanc
        else imageBW(i,j)=0; % Mets le pixel en noir
        end
    end
end

% Permet de dilater les pixels.
imageBW = imdilate(imageBW,strel('disk',5)); 
% Permet de supprimer les parties d?image qui ont moins de 10 000 pixels.
imageBW = bwareaopen(imageBW, 10000);
% Remplit les trous dans l'image binaire pour que la forme soit remplie.
imageBW = imfill(imageBW,'holes');
% Permet d'éroder l'image binaire.
% La fonction strel va appliquer une forme arrondie lors du rognage.
imageBW = imerode(imageBW,strel('disk',15)); 
% Permet de dilater les pixels. 
imageBW = imdilate(imageBW,strel('disk',10));  
% Calcule les centroïdes des composants connectés à l'image
stat = regionprops(imageBW,'centroid');

% Va stocker dans la variable cx2 la position sur la droite des abcisses du
% centroïdes.
x2 = stat(1).Centroid(1);
% Va stocker dans la variable cy2 la position sur la droite des abcisses du
% centroïdes.
y2 = stat(1).Centroid(2);



% Vérifie la position du premier centroïde sur l'axe X par rapport au 
% deuxième.
if(x1<x2) % mouvement vers la gauche.
    diff = x2-x1;
    if(diff > 150)
        'La porte s''ouvre'
    else % mouvement vers la droite.
        'La porte reste fermée...'
    end
end
end
