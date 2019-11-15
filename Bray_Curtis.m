function dst=Bray_Curtis(F1, F2)

%% This function calculates the Bray Curtis distance between points
%% F1 and F2 in the feature space 
%% INPUT: F1, first feature vector
%% INPUT: F2, second feature vector

xabs = abs(F1 - F2);
dst = sum(xabs);

return;