faceDetector = vision.CascadeObjectDetector();

%Get the input device using image acquisition toolbox,resolution = 640x480 to improve performance
obj =imaq.VideoDevice('winvideo', 1,'YUY2_320x240','ROI', [1 1 320 240]);
set(obj,'ReturnedColorSpace', 'rgb');
figure('menubar','none','tag','webcam');

while (true)

while (1)
    


% Extract the next video frame
    frame = step(obj);
% RGB -> HSV
    [hueChannel,~,~] = rgb2hsv(frame);

    % Track using the Hue channel data
    bbox = step(tracker, hueChannel);

    % Insert a bounding box around the object being tracked
    videoOut = step(boxInserter, frame, bbox);

    %Insert text coordinates

    % Display the annotated video frame using the video player object
    step(videoPlayer, videoOut);
    pause (.2)
end

% Release resources
release(obj);
release(videoPlayer);

        close(gcf)
        
        

        
        break
    end
    pause(0.05)
end
release(obj)