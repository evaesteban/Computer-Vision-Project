function V=Global_Colour_Hist_M(img,Q)

%% This function returns a histogram that encodes the global colour of the
%% image
%% INPUT: img, an RGB image
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

% Extract red, green and blue components of the image
red=img(:,:,1);
green=img(:,:,2);
blue=img(:,:,3);
 
% Each colour is stored in a 1D vector
red = reshape(red,1,[]);
green = reshape(green,1,[]);
blue = reshape(blue,1,[]);

% Calculate the average red, green and blue values of the image
averageRed = mean(red);
averageGreen = mean(green);
averageBlue = mean(blue);

% Calculate the standard deviation for the red, green and blue components of the image
stdRed = std(red);
stdGreen = std(green);
stdBlue = std(blue);

% Calculate the skewness for the red, green and blue components of the image
skewRed = skewness(red);
skewGreen = skewness(green);
skewBlue = skewness(blue);

% Store all values in 1D vector
I=[averageRed averageGreen averageBlue stdRed stdGreen stdBlue skewRed skewGreen skewBlue]; 

V = [H I];


