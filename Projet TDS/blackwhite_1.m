clear all;
close all;
clc;
p=imread('1.png');
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
imshow(w)

imwrite(w,'3-1.png')