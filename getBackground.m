function [ background ] = getBackground( mov, fr_ind1, fr_ind2, back_ind, n )


frame1 = mov(fr_ind1).gray;
frame2 = mov(fr_ind2).gray;
back = mov(back_ind).gray;

sz = size(frame1);
background = zeros(sz(1), sz(2));

%----------------SUBSTRACT FRAMES------------------------------------------
difference = imabsdiff(frame1,frame2);
thresh = graythresh(difference); %Computes the gray intensity of the difference image
bw = (difference >= thresh * 255);
pix = 20; conn = 26;
% removes from a binary image all connected components (objects) that have
% fewer than P pixels
subs = bwareaopen(bw, pix, conn);




%--------------------------------------------------------------------------


subs = imdilate(subs, ones(n,n));
background(~subs) = frame1(~subs);
background(subs) = back(subs);
background = uint8(background);


end

