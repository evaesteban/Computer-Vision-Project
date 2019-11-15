function dst=Canberra(F1, F2)

%% This function calculates the Canberra distance between points
%% F1 and F2 in the feature space
%% INPUT: F1, first feature vector
%% INPUT: F2, second feature vector

xabs = abs(F1 - F2);
x = xabs / (abs(F1) + abs(F2));
dst = sum(x);

return;