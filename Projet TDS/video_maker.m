shuttleVideo = VideoReader('timelapsevideo.avi');

ii = 1;

while hasFrame(shuttleVideo)
   img = readFrame(shuttleVideo);
   filename = [sprintf('%03d',ii) '.png'];
   fullname = fullfile(workingDir,'images',filename);
   imwrite(img,fullname)    % Write out to a JPEG file (img1.jpg, img2.jpg, etc.)
   
   p=imread(fullname);
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


    imwrite(w,fullname)

   ii = ii+1;
end

imageNames = dir(fullfile(workingDir,'images','*.png'));
imageNames = {imageNames.name}';

outputVideo = VideoWriter(fullfile(workingDir,'shuttle_out.avi'));
outputVideo.FrameRate = shuttleVideo.FrameRate;
open(outputVideo)


for ii = 1:length(imageNames)
   img = imread(fullfile(workingDir,'images',imageNames{ii}));
   writeVideo(outputVideo,img)
end

close(outputVideo)

