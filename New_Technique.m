function V=New_Technique(img, Nrows, Ncols)

%% This function performs gridding of the image into the indicated number 
%% of rows and columns. It then calculates the average red, green and blue
%% values at 9 different positions in each grid
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

                % Check to concatenate any extra row pixels into the last row
                if(ctrRows == Nrows - 1)
                   row2 = rows; 
                end

                % Check to concatenate any extra column pixels into the
                % last column
                if(ctrCols == Ncols - 1)
                   col2 = cols; 
                end
                
                % For each grid extract 9 RGB values
                for(i=1:3)
                redTopLeft = img(row1,col1,i);
                redTopMid = img(row1,floor((col2-col1)/2),i);
                redTopRight = img(row1,col2,i);              
                redTopLeft = img(row1,col1,i);
                redTopMid = img(row1,floor((col2-col1)),i);
                redTopRight = img(row1,col2,i);
                
                redMidLeft = img(floor((row2-row1)/2),col1,i);
                redMidMid = img(floor((row2-row1)/2),floor((col2-col1)/2),i);
                redMidRight = img(floor((row2-row1)/2),col2,i);
                
                redBottomLeft = img(row2,col1,i);
                redBottomMid = img(row2,floor((col2-col1)/2),i);
                redBottomRight = img(row2, col2, i);

                % Store extracted values in array
                concatArray(gridIndex+1) = redTopLeft;
                concatArray(gridIndex+2) = redTopMid;
                concatArray(gridIndex+3) = redTopRight;
                concatArray(gridIndex+4) = redMidLeft;
                concatArray(gridIndex+5) = redMidMid;
                concatArray(gridIndex+6) = redMidRight;
                concatArray(gridIndex+7) = redBottomLeft;
                concatArray(gridIndex+8) = redBottomMid;
                concatArray(gridIndex+9) = redBottomRight;
                gridIndex = gridIndex + 10;               
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
