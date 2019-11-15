function histArray=Hist_Array(vals,binNumber)

%% This function returns a histogram of the values indicated
%% INPUT: vals, an array containing the normalised values of which to create the histogram
%% INPUT: binNumber, the number of bins in the histogram

% Create array to store histogram values
arrayToFill=zeros(1,binNumber); 

% Increment number of elements in each histogram bin according to the values in vals
for i=1:length(vals)
    arrayToFill(1,vals(i)+1)=arrayToFill(1,vals(i)+1)+1; 
end

% Return normalised histogram of values
histArray=arrayToFill; 
histArray = histArray ./sum(histArray); 
