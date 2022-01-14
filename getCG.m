function [ centroids ] = getCG( body )

if max(max(body))==0
    centroids = [];
else
    measurements = regionprops(body, 'Centroid');
    centroids = cat(3,measurements.Centroid);
end

end

