function [ ] = exportVideo( video, nFrames, width, name )


name = sprintf('sample.mp4', name);
writerObj = VideoWriter(name);
open(writerObj);
for i=1:nFrames-2
    frame = video(i).cdata;
    frame(:,width+2, :) = 0;
    writeVideo(writerObj, frame);
end
close(writerObj);

end

