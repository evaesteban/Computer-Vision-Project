%% Test_GCH_M.m
%% This code will perform visual search on the data using  the global colour histogram and moment descriptors. It will compare the results 
%% using different queries.

queryCow = '5_14_s';
queryTree = '2_7_s';
queryPlane = '4_12_s';
queryBook = '13_14_s';
queryBench = '14_15_s';

% Using Euclidean distance and a quantisation level of 4

Compute_Descriptors_GCH_M(4); % Compute descriptors

[outdisplay_1 r_1 p_1 ap_1] = VS_GCH_M(queryCow,'E', 4, false);
[outdisplay_2 r_2 p_2 ap_2] = VS_GCH_M(queryTree,'E', 4, false);
[outdisplay_3 r_3 p_3 ap_3] = VS_GCH_M(queryPlane,'E', 4, false);
[outdisplay_4 r_4 p_4 ap_4] = VS_GCH_M(queryBook,'E', 4, false);
[outdisplay_5 r_5 p_5 ap_5] = VS_GCH_M(queryBench,'E', 4, false);

% Compute the Mean Average Precision (MAP)
MAP_1 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;
 
% Show top results for all the queries
figure('Name', 'Top 10 results for Euclidean distance and Q=4');
plot1 = subplot(5,1,1), imshow(outdisplay_1); 
strTitle = sprintf('Top 10 results for Euclidean distance and Q=4');
title(strTitle);
plot2 = subplot(5,1,2), imshow(outdisplay_2);
plot3 = subplot(5,1,3), imshow(outdisplay_3); 
plot4 = subplot(5,1,4), imshow(outdisplay_4);
plot5 = subplot(5,1,5), imshow(outdisplay_5);

set(plot1, 'Position', [0 0.3 1 1]);
set(plot2, 'Position', [0 0.2 1 1]);
set(plot3,'Position',[0 0.1 1 1]);
set(plot4,'Position', [0 0 1 1]);
set(plot5,'Position', [0 -0.1 1 1]);

figure('Name', 'PR Statistics for Euclidean distance and Q=4');
plot(r_1,p_1,'DisplayName', 'Cow');
hold on;
plot(r_2,p_2, 'DisplayName', 'Tree');
hold on;
plot(r_3,p_3, 'DisplayName', 'Plane');
hold on;
plot(r_4,p_4, 'DisplayName', 'Book');
hold on;
plot(r_5,p_5, 'DisplayName', 'Bench');
hold on;
strTitle = sprintf('Euclidean distance and Q=4, MAP = %.2d',  round(MAP_1,3));
title(strTitle);
xlabel('Recall');
ylabel('Precision');
legend(gca, 'show');
hold off;
