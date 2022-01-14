function [ px2m ] = getpx2m( CG, Dimball )

%diamax = max([CG.diameter]);
diamean=mean([CG.diameter]);
px2m = Dimball/diamean;

end

