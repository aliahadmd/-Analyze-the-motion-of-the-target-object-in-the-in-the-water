function [ acc ] = getAcc( vel, timeFrame, nFrames,flag )


for i=2:nFrames-2
        acc(i).x = (vel(i).x-vel(i-1).x)/(timeFrame);
        acc(i).y = (vel(i).y-vel(i-1).y)/(timeFrame);
        acc(i).mag = sqrt(acc(i).x^2+acc(i).y^2);
        if flag==0
            acc(i).z=(vel(i).z-vel(i-1).z)/(timeFrame);
        end
end

