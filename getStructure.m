function [ mov, nFrames ] = getStructure( video )


nFrames = video.NumberOfFrames;
% figure
for k = 1 : nFrames
    mov(k).rgb = read(video,k); %2* PERQUE PILLA PARELLES DE FRAMES IGUALS (ES AIXI A TOTS ELS VIDEOS?? 
    mov(k).gray = rgb2gray(mov(k).rgb);
%     imshow(mov(k).gray);
%     fprintf('%f', k);
end

movie.mov = mov;
movie.nFrames = nFrames;
end