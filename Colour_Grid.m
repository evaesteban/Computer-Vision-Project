function V=Colour_Grid(img, Nrows, Ncols)

%% This function performs gridding of the image into the indicated number 
%% of rows and columns. It then calculates the average red, green and blue
%% values for each grid
%% INPUT: img, an RGB image with pixel values in the range 0-255
%% INPUT: Nrows, the number of rows in which to divide the image
%% INPUT: Ncols, the number of columns in which to divide the image 

% Calculate horizontal and vertical size of image
sizeRows = size(img(:,1,1));
sizeCols = size(img(1,:,1));

% Extract the number of rows and columns in the image
rows = sizeRows(:,1);
cols = sizeCols(:,2);

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
                ctrCols = ctrCols + 1;
            end
        end
        ctrRows = ctrRows + 1;
        ctrCols = 0;
    end
end

% Return complete array
V = concatArray;
