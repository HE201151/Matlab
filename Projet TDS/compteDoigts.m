% Récupère l'image 1 de base.
function compteDoigts(image1, image2)
% Converti l'image RGB en YCBCR.
image=rgb2ycbcr(image1);
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
% Permet de dilater l'objet. 
imageBW = imdilate(imageBW,strel('disk',5)); 
% Permet de supprimer les parties d'image qui ont moins de 10 000 pixels.
imageBW = bwareaopen(imageBW, 10000);
% Remplit les trous dans l'image binaire pour que la forme soit remplie.
imageBW = imfill(imageBW,'holes');
% Permet d'éroder l'image binaire.
% La fonction strel va appliquer une forme arrondie lors du rognage.
imageBW = imerode(imageBW,strel('disk',15)); 
% Permet de dilater l'objet. 
imageBW = imdilate(imageBW,strel('disk',10));  
% Calcule les centroïdes des composants connectés à l'image
stat = regionprops(imageBW,'centroid');

% Va stocker dans la variable x la position sur la droite des abcisses du
% centroïdes.
x = stat(1).Centroid(1);
% Va stocker dans la variable y la position sur la droite des abcisses du
% centroïdes.
y = stat(1).Centroid(2);

% Sert à tracer le contour extérieur d'un objet.
contour = bwboundaries(imageBW);
minDist=2*640*640;
   
minX=x; % Valeur minimum pour x
minY=y; % Valeur minimum pour y
image2=uint8(zeros(480,640)); % Créé une image aux dimansions 640x480 remplies de zéros
for i=1:length(contour) 
    point=contour{i,1}; 
    for j=1:length(point)
        y2=point(j,1);
        x2=point(j,2);
        carreDist=(x-x2)*(x-x2)+(y-y2)*(y-y2);
        image2(x2,y2)=255;
        if(carreDist<minDist) % Si la distance minimum est plus grande.
            minDist=carreDist; % On la remplace par carreDist.
            minX=x2;
            minY=y2;
        end
    end    
end

% Créé un rond qui part du centroïde jusqu'à la distance minimum.
rond=strel('disk',round(sqrt(minDist)/2));
% Enlève tout ce qu'il y a autour du rond.
image=imerode(imageBW,rond);
% Enlève les petits objets de l'image qui on moins de 200 pixels.
image=bwareaopen(image,200);
% Permet de dilater l'objet. 
image=imdilate(image,rond);
% Soustrait image de imageBW.
image=imageBW-image;
% Enlève les petits objets de l'image qui on moins de 200 pixels.
image=bwareaopen(image,200);
% Permet d'éroder l'image binaire.
image=imerode(image,strel('disk',5));
% Enlève les petits objets de l'image qui on moins de 400 pixels.
image=bwareaopen(image,400);
% Enlève les petits objets sur le contour de l'image.
image=imclearborder(image,8);
% Calcule les centroïdes des composants connectés à l'image
Centroid = regionprops(image,'centroid'); 
% Place dans la variable numDoigts le nombre de centroïdes trouvés.
numDoigts = size(Centroid,1)
    
if(numDoigts == 2) % Si on a bien affcher deux doigts 
    detectmove(image1,image2);  % Alors on passe au traitement suivant
else    % Si non la porte reste fermée.
    'La porte reste close'
end
end
