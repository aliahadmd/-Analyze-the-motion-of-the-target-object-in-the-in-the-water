function [ substraction ] = substractFrames( frame1, frame2 )



difference = imabsdiff(frame1,frame2);

CV = cov(difference);
CVmed = mean(mean(COV));

bw = (difference > f*CVmed);

substraction = bwareaopen(bw, pix, conn);

end

