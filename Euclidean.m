function dst=Euclidean(F1, F2)

%% This function calculates the L2 norm or Euclidean distance between points
%% F1 and F2 in the feature space 
%% INPUT: F1, first feature vector
%% INPUT: F2, second feature vector

x = F1 - F2;
x = x.^2;
x = sum(x);
dst = sqrt(x);

return;