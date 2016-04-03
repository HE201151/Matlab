
 vid = VideoReader('timelapsevideo.avi');
 numImgs = get(vid, 'NumberOfFrames');
 frames = read(vid);
 obj=VideoWriter('BW.avi');
 open(obj);

 for i=1:numImgs
     movie(i).cdata=rgb2gray(frames(:,:,:,i));
     movie(i).colormap=gray;
 end

 writeVideo(obj,movie);
 close(obj);
 
  for k=1:numImgs
     movie(k).cdata=rgb2ycbcr(movie(k).cdata);
     %movie(i).colormap=gray;
     a=movie(k).cdata(:,:,2);
     b=movie(k).cdata(:,:,3);
     
    for i=1:480
        for j=1:640
            if((a(i,j)>=70)&&(b(i,j)>=140)&&(a(i,j)<=150)&&(b(i,j)<=210))
                w(i,j)=1;
            else w(i,j)=0;
            end
        end
    end
     
 end

 writeVideo(obj,movie);
 close(obj);
