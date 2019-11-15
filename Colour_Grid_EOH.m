function V=Colour_Grid_EOH(img, Nrows, Ncols, Q)

%% This function computes an Edge Orientation Histogram of the image with 
%% the indicated level of angular quantisation
%% INPUT: img, an RGB image with pixel values in the range 0-255
%% INPUT: Nrows, the number of rows in which to divide the image
%% INPUT: Ncols, the number of columns in which to divide the image 
%% INPUT: Q, the level of angular quantisation for the histogram

% Sobel filter to detect horizontal edges
SobelY = [1 2 1; 0 0 0; -1 -2 -1];

% Sobel filter to detect vertical edges
SobelX = SobelY';

% Convert input RGB image to greyscale image and to normalised RGB image
imgGrey = RGB_To_Gray(img);

% Calculate the number of rows and columns of the image and store as
% single numbers
sizeRows = size(img(:,1,1));
sizeCols = size(img(1,:,1));
rows = sizeRows(:,1);
cols = sizeCols(:,2);

% Find the vertical and horizontal edges of the image using the Sobel
% filter
verticEdgesImg = conv2(imgGrey, SobelX, 'same');
horizEdgesImg = conv2(imgGrey, SobelY, 'same');

% Calculate the angle of the edges
angleImg = atan2(horizEdgesImg, verticEdgesImg);

% Convert angle to range 0 to 2pi to perform processing on the data
for(i=1:sizeRows)
    for(j=1:sizeCols)
        if(angleImg(i,j)<0)
            angleImg = 2*pi - abs(angleImg);
        end
    end
end

% Calculate the magnitude of the edges
verticEdgesSquaredImg = verticEdgesImg.^2;
horizEdgesSquaredImg = horizEdgesImg.^2;
magnitudeImg = sqrt(verticEdgesSquaredImg + horizEdgesSquaredImg);

% Normalise the angle values
maxAngleImg = max(max(angleImg));
angleImg=double(angleImg)./ (maxAngleImg+1); % Plus 1?
angleImg =floor(angleImg.*Q);

% Counters to store current position of iteration within the image and 
% the array to store the values in
ctrRows = 0;
ctrCols = 0;
gridIndex = 1;

% Calculate horizontal and vertical size of each grid
gridRows = floor(rows/Nrows);
gridCols = floor(cols/Ncols);

% Array to store average values for each grid and counter to 
% iterate through it
concatArray = [];

% Iterate through the image and divide into grids
for row = 1 : gridRows : rows
    if(ctrRows ~= Nrows)
        for col = 1 : gridCols : cols
            if(ctrCols ~= Ncols)
                row1 = row;
                row2 = row1 + gridRows - 1;
                col1 = col;
                col2 = col1 + gridCols - 1;   

                % Check to concatenate any extra column pixels into the last row
                if(ctrRows == Nrows - 1)
                   row2 = rows; 
                end
                
                % Check to concatenate any extra row pixels into the last
                % column
                if(ctrCols == Ncols - 1)
                   col2 = cols; 
                end
                
                % Set the threshold to select only the strong edges
                thresAnglesImg = angleImg;
                meanMagnitude = mean2(mean(magnitudeImg));
                stdDevMagnitude = std2(magnitudeImg);
                threshold = meanMagnitude - stdDevMagnitude; 

                % Array to store the angle values above the set threshold and counter to
                % iterate through it
                thresAnglesImg = angleImg;
                k = 1;

                % Loop to extract the angles of the edges with a magnitude above the
                % threshold
                for(i=1:size(magnitudeImg,1))
                    for(j=1:size(magnitudeImg,2))      
                        if(magnitudeImg(i,j) > threshold)
                            thresAnglesImg(k) = angleImg(i,j);
                            k = k+1;
                        end
                    end
                end
                
                                % For each grid extract the average RGB values and store in
                % the array
                red = img(row1:row2, col1:col2, 1);
                red = reshape(red,1,[]);
                averageRed = mean(red);
                green = img(row1:row2, col1:col2, 2);
                green = reshape(green,1,[]);
                averageGreen = mean(green);
                blue = img(row1:row2, col1:col2, 3);
                blue = reshape(blue,1,[]);
                averageBlue = mean(blue);
                concatArray(gridIndex) = averageRed;
                concatArray(gridIndex+1) = averageGreen;
                concatArray(gridIndex+2) = averageBlue;
                gridIndex = gridIndex + 3; 
                
                % Extract the angle values for each grid                  
                histValsImg = thresAnglesImg(row1:row2, col1:col2);
                
                % Store angle values in 1D array                
                histValsImg = reshape(histValsImg,size(histValsImg,1)*size(histValsImg,2),1);
                
                % Compute histogram of the values
                histImg = Hist_Array(histValsImg,Q);
                
                % Concatenate histogram values for each cell into an array
                %concatArray(gridIndex,:) = histImg;
                %gridIndex = gridIndex + 1;
                
                for(p=1:length(histImg))
                  concatArray(gridIndex) = histImg(p);
                  gridIndex = gridIndex + 1;
                end                                              
                ctrCols = ctrCols + 1;
            end
        end
        ctrRows = ctrRows + 1;
        ctrCols = 0;
    end
end
                
% Return complete array
V = concatArray;
