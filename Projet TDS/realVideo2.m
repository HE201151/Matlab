function realVideo()
 
% Définit le nombre d'image par seconde
NumberFrameDisplayPerSecond=10;
 
% ouvre une fenêtre 
hFigure=figure(1);
 
% Choix webcam 
try
   % windows (MJPG_1280x720)
   vid = videoinput('winvideo', 1);
   
catch
   try
      % macs.
      vid = videoinput('macvideo', 1);
   catch
      errordlg('No webcam available');
   end
end
 
% Paramètres de la video
% Acquiert une image par seconde
set(vid,'FramesPerTrigger',1);
% Fonctionne jusqu'à l'arrêt
set(vid,'TriggerRepeat',Inf);
% Paramètre du déclenchement de la video
triggerconfig(vid, 'Manual');
 
% Acquiert l'objet timer
TimerData=timer('TimerFcn', {@FrameRateDisplay,vid},'Period',1/NumberFrameDisplayPerSecond,'ExecutionMode','fixedRate','BusyMode','drop');
 
% Lance la video et le timer
start(vid);
start(TimerData);
a=2; 
% Tant que a pas égal à 1
while(a==1)
    % On comtpe le nombre de frame
    vid.FramesAcquired
    % Après 100 frames (10 secondes)
    if(vid.FramesAcquired==100)
        % Prend une photo
        p = getsnapshot(vid); 
        
    end
    
    if(vid.FramesAcquired==130)
        % Prend une photo
        p1 = getsnapshot(vid); 
        figure,imshow(p1); 
        % Filtre, compte le nombre de doigts et detecte le mouvement
        compteDoigts(p,p1);
        a=1;
    end
end
 
% On continue la video tant que la fenêtre n'est pas fermée
uiwait(hFigure);


% Ferme et supprime le timer et la video
stop(TimerData);
delete(TimerData);
stop(vid);
delete(vid);
% Ferme les variables persistantes
clear functions;

 
% Cette fonction est appellée par le timer pour voir une image à la fois 
 
function FrameRateDisplay(obj, event,vid)
persistent IM;
persistent handlesRaw;
trigger(vid);
IM=getdata(vid,1,'uint8');
 
if isempty(handlesRaw)
   % Si c'est la première exécution, on crée l'image
   subplot(2,1,1);
   handlesRaw=imagesc(IM);
   title('CurrentImage');
   

else
   % Sinon on met à jour l'image
   set(handlesRaw,'CData',IM);
   Value=mean(IM(:));
end