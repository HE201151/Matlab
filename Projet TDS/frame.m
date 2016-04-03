obj = VideoReader('timelapsevideo.avi');
nFrames=obj.NumberOfFrames;
for k=1:nFrames
    img=read(obj,k);
    p=img;
    q=rgb2ycbcr(p);
    a=q(:,:,2);
    b=q(:,:,3);


    for i=1:480
        for j=1:640
            if((a(i,j)>=70)&&(b(i,j)>=140)&&(a(i,j)<=150)&&(b(i,j)<=210))
                w(i,j)=1;
            else w(i,j)=0;
            end
        end
    end
    
    IM3 = imdilate(w,strel('disk',5));  
IM3 = bwareaopen(IM3, 10000);

IM3 = imfill(IM3,'holes');
IM3 = imerode(IM3,strel('disk',15));                                        %erode image
IM3 = imdilate(IM3,strel('disk',10));                                       %dilate iamge
w = medfilt2(IM3, [5 5]);  

imwrite(w,'3-1.png');

 
stat = regionprops(w,'centroid');




cx = stat(1).Centroid(1)
cy = stat(1).Centroid(2)

boundary = bwboundaries(w)

minDist=2*640*640;
    mx=cx;
    my=cy;
    bImg=uint8(zeros(480,640));
    for i=1:length(boundary)
        cell=boundary{i,1};
        for j=1:length(cell)
            y=cell(j,1);
            x=cell(j,2);
            sqrDist=(cx-x)*(cx-x)+(cy-y)*(cy-y);
            bImg(x,y)=255;
            if(sqrDist<minDist)
                minDist=sqrDist;
                mx=x;
                my=y;
            end
        end    
    end
   
    sed=strel('disk',round(sqrt(minDist)/2));
 
    final=imerode(w,sed);
    
    final=bwareaopen(final,200);
    
    final=imdilate(final,sed);
   
    final=w-final;

    final=bwareaopen(final,200);
    
    final=imerode(final,strel('disk',5));
   
    final=bwareaopen(final,400);
   
    [L,num]=bwlabel(final,8);
    
    final=imclearborder(final,8);
    
    Centroid = regionprops(final,'centroid'); 
    numBlobs = size(Centroid,1) 

     imshow(final)
     
    figure(1),imshow(w,[]);
end




