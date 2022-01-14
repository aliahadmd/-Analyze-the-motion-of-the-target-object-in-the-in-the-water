function [ balls, nCG, difference ] = detectBall( frame, background, conn, f, pix_min, nd )


difference = imabsdiff(frame, background);
differenceMed = mean(mean(double(difference)));

dif = double(difference).^2-differenceMed^2;
difMed = mean(mean(dif));

bw = (dif>difMed*f);
bw = bwareaopen(bw, pix_min, conn);
SE = strel('disk', nd);
bw = imclose(bw, SE);
[balls, nCG] = bwlabeln(bw, conn);

med = 0;
for i=1:nCG
    m = mean(mean(dif(balls == i)));
    if m > med
        med = mean(mean(dif(balls == i)));
        balls = (balls == i);
    end
end

end
