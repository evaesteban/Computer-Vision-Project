function H=Global_Colour_Hist(img,Q)

%% This function returns a histogram that encodes the global colour of the
%% image
%% INPUT: img, an RGB image with pixel values in the range 0-255
%% INPUT: Q, the level of quantization of the RGB space

% Normalise the image in the range 0 to (Q-1)
qimg=double(img)./256;
qimg=floor(qimg.*Q);

% Create an integer value (in the range 0 to Q^3-1) for each pixel that contains the 
% RGB value

bin = qimg(:,:,1)*Q^2 + qimg(:,:,2)*Q^1 + qimg(:,:,3);

% Reshape matrix into 1D vector

vals=reshape(bin,size(bin,1)*size(bin,2),1);

% Create normalised histogram of the values
H = Hist_Array(vals,Q^3);


