function Y=RGB_To_Gray(img)

%% This function converts an input RGB image into a greyscale image
%% INPUT: img, an RGB image

Y = 0.30*img(:,:,1) + 0.59*img(:,:,2) + 0.11*img(:,:,3);
