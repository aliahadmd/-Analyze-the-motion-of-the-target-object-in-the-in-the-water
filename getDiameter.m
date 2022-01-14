function [ diameter ] = getDiameter( body )

if max(max(body))==0
    diameter = [];
else
    measurements = regionprops(body, 'MajorAxisLength');
    diameter =(measurements.MajorAxisLength);
end

end

