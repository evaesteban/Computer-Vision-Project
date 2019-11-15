function M=Confusion_Matrix(truth, class)

%% This function calculates the confusion matrix of the provided vectors
%% INPUT: truth, an array containing the ground truth values in which each 
%% category of items is indicated by an integer numberç
%% INPUT: class, an array containing the classifier results in which each 
%% category of items is indicated by an integer number

% Array to store the confusion matrix
M = zeros(4,4);
% Add one to the correct category in the confusion matrix
%for(i=1:size(truth))
for(i=1:size(truth(:,1)))
    for(j=1:size(truth(:,2)))
        % The row is defined by the ground trkth and the column is
        % indicated by the classifier result
        M(truth(i,j),class(i,j)) = M(truth(i,j),class(i,j)) + 1; 
    end
end

A = [];
% Normalise and return the confusion matrix
for(k=1:size(M,1))
    sumRow=sum(M(k,:));
    M(k,:) = (M(k,:))./sumRow;
    end
end

