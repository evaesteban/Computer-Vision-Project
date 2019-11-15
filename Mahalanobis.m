function dst=Mahalanobis(F1, F2, EVAL)

%% This function calculates the Mahalanobis distance between points
%% F1 and F2 in the feature space i.e image descriptors
%% INPUT: F1, first feature vector
%% INPUT: F2, second feature vector
%% INPUT: EVAL, eigenvalues vector

x = F1 - F2;
x = x.^2;
x = x ./ EVAL';
x = sum(x);
dst = sqrt(x);

return;