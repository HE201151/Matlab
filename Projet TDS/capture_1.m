imaqhwinfo
V=imaq.VideoDevice('winvideo',1,'YCbCr422_640x480');
V.ReturnedColorSpace='rgb';
V.ReturnedDataType='uint8';
preview(V);
pause;
closepreview(V);
I=step(V);
imshow(I);
delete(V);
clear V;
imwrite(I,'1.png')






