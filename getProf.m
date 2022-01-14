function [ X ] = getProf (dfocus,x0,Dimball,diameter,dim0)

alpha=Dimball*dfocus/(x0*dim0); % meters/pixels
if ~isempty(diameter)
X=dfocus*Dimball/(diameter*alpha);
else
    X=[];
end
end