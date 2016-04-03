i=imread('3-1.png');
f=ones(3,3)/9;
i1 = filter2(f,i,'same');
%imshow(i1/255);
f1=fspecial('average',[3,3]);
i2 = filter2(f1,i,'same');
%figure, imshow(i2/255);
i2=filter2(f1,i,'full');
%figure,imshow(i2/255);
f3=fspecial('average',11);
i3=filter2(f3,i,'same');
figure,imshow(i3/100);

imwrite(i3/100,'3-2.png');