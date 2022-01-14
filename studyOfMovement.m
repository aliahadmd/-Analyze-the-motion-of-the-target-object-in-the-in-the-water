function [ mov, CG, vel, acc, FPS, replay, detection, difference ] = studyOfMovement( video, back_f1, back_f2, back_fb, nb, nd, conn, pix_min, f, flag, dimBall, dfocus, z0, framedim0, SFv, SFa )


FPS = video.FrameRate;
timeFrame = 1/FPS;
[ mov, nFrames] = getStructure(video);

background = getBackground(mov, back_f1, back_f2, back_fb, nb);
figure, imshow(background);

for i=1:nFrames
    [ mov(i).ball, mov(i).nCG, mov(i).difference ] = detectfish( mov(i).gray, background, conn, f, pix_min, nd );
    pos = getCG(mov(i).ball);
    CG(i).diameter = getDiameter(mov(i).ball);
    if isempty(pos)
        CG(i).x = [];
        CG(i).y = [];
        if flag == 0
            CG(i).z=[];
        end
    else
        CG(i).x = pos(1);
        CG(i).y = pos(2);
    end
end
switch flag
    case 0
        dim0=CG(framedim0).diameter;
        for i=1:nFrames
            CG(i).z = getProf(dfocus, z0, dimBall, CG(i).diameter,dim0);
            px2m = dimBall/(z0*dim0);
        end
    case 1
        px2m = getpx2m( CG, dimBall ); %m(real)/pixel
end

vel = getVel(CG, px2m, timeFrame, nFrames,flag );
acc = getAcc( vel, timeFrame, nFrames,flag );

[ replay, detection, difference ] = makeVideo( mov, CG, vel, acc, nFrames, SFv, SFa );

end

