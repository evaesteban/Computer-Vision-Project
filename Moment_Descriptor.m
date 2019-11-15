function V=Moment_Descriptor(img)

%% This function returns a vector that contains the average, standard 
%% deviation and skewness for the R,G and B pixels of the image
%% INPUT: img, an RGB image 

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
V=[averageRed averageGreen averageBlue stdRed stdGreen stdBlue skewRed skewGreen skewBlue]; 
