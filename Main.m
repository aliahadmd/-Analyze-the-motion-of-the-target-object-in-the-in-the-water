%MD AHAD ALI- 20183290242
%Foreground Detection

d= vision.ForegroundDetector(...
    'NumTrainingFrames', 20,...
    'InitialVariance', 50*50);

r= vision.VideoFileReader('sample.mp4', ...
    'VideoOutputDataType', 'uint8');
blob=vision.BlobAnalysis('MinimumBlobArea', 1100);
player= vision.DeployableVideoPlayer;


while~isDone(r)
    frame=step(r);
    fgMask= step(d, frame);
    [~,~, bbox]= step(blob, fgMask);
    J=insertShape(frame, 'rectangle', bbox);
    step(player, J);
    
    pause(0.01);
    
end



release(d);
release(r);
release(blob);
release(player);


%.........................
clear
close all

dfocus = 0.035; %Focal distance in m

%Study of movement like Get path, velocity and acceleration.

video3 = VideoReader('sample.mp4');
[ mov3, CG3, vel3, acc3, FPS3, replay3, detection3, difference3 ] = studyOfMovement( video3, 1, floor(video3.NumberOfFrames/2),video3.NumberOfFrames, 20, 10, 26, 500, 25, 1, 0.065, dfocus, 1, 1, 100, 20 );

implay(difference3, FPS3);
implay(detection3, FPS3);
implay(replay3, FPS3);

writeReport('Video3REPORT',vel3,acc3,1);
exportVideo(replay3,video3.NumberOfFrames,video3.Width,'Video3Replay');

graphics(CG3, vel3, acc3, video3.NumberOfFrames, 1, 40, 10,1);


