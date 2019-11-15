function dst=L1_norm(F1, F2)

%% This function calculates the L1 norm or City Block distance between points
%% F1 and F2 in the feature space 
%% INPUT: F1, first feature vector
%% INPUT: F2, second feature vector

 x = F1 - F2;
 x = abs(x);
 x = sum(x);
 dst = x;
 
 return;