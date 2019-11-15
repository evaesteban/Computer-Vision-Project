function dst=L3_norm(F1, F2)

%% This function calculates the L3 norm distance between points
%% F1 and F2 in the feature space i.e image descriptors
%% INPUT: F1, first feature vector
%% INPUT: F2, second feature vector

x = F1 - F2;
x = x.^3;
x = sum(x);
dst = x.^(1/3);
 
 return;