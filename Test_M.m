%% Test_M.m
%% This code will perform visual search on the data using moment descriptors. It will compare the results 
%% using different queries, distance measures.

queryCow = '5_14_s';
queryTree = '2_7_s';
queryPlane = '4_12_s';
queryBook = '13_14_s';
queryBench = '14_15_s';

Compute_Descriptors_M(); % Compute descriptors

% Using Euclidean distance
[outdisplay_1 r_1 p_1 ap_1] = VS_M(queryCow,'E', false);
[outdisplay_2 r_2 p_2 ap_2] = VS_M(queryTree,'E', false);
[outdisplay_3 r_3 p_3 ap_3] = VS_M(queryPlane,'E', false);
[outdisplay_4 r_4 p_4 ap_4] = VS_M(queryBook,'E', false);
[outdisplay_5 r_5 p_5 ap_5] = VS_M(queryBench,'E', false);

% Compute the Mean Average Precision (MAP)
MAP_1 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;
 
% Show top results for all the queries
figure('Name', 'Top 10 results for Euclidean distance');
plot1 = subplot(5,1,1), imshow(outdisplay_1); 
strTitle = sprintf('Top 10 results for Euclidean distance');
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

figure('Name', 'PR Statistics for Euclidean distance');
plot(r_1,p_1,'DisplayName', 'Cow');
hold on;
plot(r_2,p_2, 'DisplayName', 'Tree');
hold on;
plot(r_3,p_3, 'DisplayName', 'Plane');
hold on;
plot(r_4,p_4, 'DisplayName', 'Book');
hold on;
plot(r_5,p_5, 'DisplayName', 'Bench');
strTitle = sprintf('Euclidean distance, MAP = %.2d',  round(MAP_1,3));
title(strTitle);
xlabel('Recall');
ylabel('Precision');
legend(gca, 'show');
hold off;

% Using L1 norm distance
[outdisplay_1 r_1 p_1 ap_1] = VS_M(queryCow,'L1', false);
[outdisplay_2 r_2 p_2 ap_2] = VS_M(queryTree,'L1', false);
[outdisplay_3 r_3 p_3 ap_3] = VS_M(queryPlane,'L1', false);
[outdisplay_4 r_4 p_4 ap_4] = VS_M(queryBook,'L1', false);
[outdisplay_5 r_5 p_5 ap_5] = VS_M(queryBench,'L1', false);

% Compute the Mean Average Precision (MAP)
MAP_2 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;
 
% Show top results for all the queries
figure('Name', 'Top 10 results for L1 norm distance');
plot1 = subplot(5,1,1), imshow(outdisplay_1); 
strTitle = sprintf('Top 10 results for L1 norm distance');
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

figure('Name', 'PR Statistics for L1 norm distance');
plot(r_1,p_1,'DisplayName', 'Cow');
hold on;
plot(r_2,p_2, 'DisplayName', 'Tree');
hold on;
plot(r_3,p_3, 'DisplayName', 'Plane');
hold on;
plot(r_4,p_4, 'DisplayName', 'Book');
hold on;
plot(r_5,p_5, 'DisplayName', 'Bench');
strTitle = sprintf('L1 norm distance, MAP = %.2d',  round(MAP_2,3));
title(strTitle);
xlabel('Recall');
ylabel('Precision');
legend(gca, 'show');
hold off;

% Using L3 norm distance
[outdisplay_1 r_1 p_1 ap_1] = VS_M(queryCow,'L3', false);
[outdisplay_2 r_2 p_2 ap_2] = VS_M(queryTree,'L3', false);
[outdisplay_3 r_3 p_3 ap_3] = VS_M(queryPlane,'L3', false);
[outdisplay_4 r_4 p_4 ap_4] = VS_M(queryBook,'L3', false);
[outdisplay_5 r_5 p_5 ap_5] = VS_M(queryBench,'L3', false);

% Compute the Mean Average Precision (MAP)
MAP_3 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;
 
% Show top results for all the queries
figure('Name', 'Top 10 results for L3 norm distance');
plot1 = subplot(5,1,1), imshow(outdisplay_1); 
strTitle = sprintf('Top 10 results for L3 norm distance');
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

figure('Name', 'PR Statistics for L3 norm distance');
plot(r_1,p_1,'DisplayName', 'Cow');
hold on;
plot(r_2,p_2, 'DisplayName', 'Tree');
hold on;
plot(r_3,p_3, 'DisplayName', 'Plane');
hold on;
plot(r_4,p_4, 'DisplayName', 'Book');
hold on;
plot(r_5,p_5, 'DisplayName', 'Bench');
strTitle = sprintf('L3 norm distance, MAP = %.2d',  round(MAP_3,3));
title(strTitle);
xlabel('Recall');
ylabel('Precision');
legend(gca, 'show');
hold off;

% Using Bray Curtis distance,
[outdisplay_1 r_1 p_1 ap_1] = VS_M(queryCow,'B', false);
[outdisplay_2 r_2 p_2 ap_2] = VS_M(queryTree,'B', false);
[outdisplay_3 r_3 p_3 ap_3] = VS_M(queryPlane,'B', false);
[outdisplay_4 r_4 p_4 ap_4] = VS_M(queryBook,'B', false);
[outdisplay_5 r_5 p_5 ap_5] = VS_M(queryBench,'B', false);

% Compute the Mean Average Precision (MAP)
MAP_4 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;
 
% Show top results for all the queries
figure('Name', 'Top 10 results for Bray Curtis distance');
plot1 = subplot(4,1,1), imshow(outdisplay_1); 
strTitle = sprintf('Top 10 results for Bray Curtis distance');
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

figure('Name', 'PR Statistics for Bray Curtis distance');
plot(r_1,p_1,'DisplayName', 'Cow');
hold on;
plot(r_2,p_2, 'DisplayName', 'Tree');
hold on;
plot(r_3,p_3, 'DisplayName', 'Plane');
hold on;
plot(r_4,p_4, 'DisplayName', 'Book');
hold on;
plot(r_5,p_5, 'DisplayName', 'Bench');
strTitle = sprintf('Bray Curtis distance, MAP = %.2d',  round(MAP_4,3));
title(strTitle);
xlabel('Recall');
ylabel('Precision');
legend(gca, 'show');
hold off;

% Using Canberra distance
[outdisplay_1 r_1 p_1 ap_1] = VS_M(queryCow,'C', false);
[outdisplay_2 r_2 p_2 ap_2] = VS_M(queryTree,'C', false);
[outdisplay_3 r_3 p_3 ap_3] = VS_M(queryPlane,'C', false);
[outdisplay_4 r_4 p_4 ap_4] = VS_M(queryBook,'C', false);
[outdisplay_5 r_5 p_5 ap_5] = VS_M(queryBench,'C', false);

% Compute the Mean Average Precision (MAP)
MAP_5 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;
 
% Show top results for all the queries
figure('Name', 'Top 10 results for Canberra distance');
plot1 = subplot(5,1,1), imshow(outdisplay_1); 
strTitle = sprintf('Top 10 results for Canberra distance');
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

figure('Name', 'PR Statistics for Canberra distance');
plot(r_1,p_1,'DisplayName', 'Cow');
hold on;
plot(r_2,p_2, 'DisplayName', 'Tree');
hold on;
plot(r_3,p_3, 'DisplayName', 'Plane');
hold on;
plot(r_4,p_4, 'DisplayName', 'Book');
hold on;
plot(r_5,p_5, 'DisplayName', 'Bench');
strTitle = sprintf('Canberra distance, MAP = %.2d',  round(MAP_5,3));
title(strTitle);
xlabel('Recall');
ylabel('Precision');
legend(gca, 'show');
hold off;

%% PCA Results

% Using Euclidean distance
[outdisplay_1 r_1 p_1 ap_1] = VS_M(queryCow,'E', true);
[outdisplay_2 r_2 p_2 ap_2] = VS_M(queryTree,'E', true);
[outdisplay_3 r_3 p_3 ap_3] = VS_M(queryPlane,'E', true);
[outdisplay_4 r_4 p_4 ap_4] = VS_M(queryBook,'E', true);
[outdisplay_5 r_5 p_5 ap_5] = VS_M(queryBench,'E', true);

% Compute the Mean Average Precision (MAP)
MAP_6 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;
 
% Show top results for all the queries
figure('Name', 'Top 10 results for Euclidean distance after PCA');
plot1 = subplot(5,1,1), imshow(outdisplay_1); 
strTitle = sprintf('Top 10 results for Euclidean distance after PCA');
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

figure('Name', 'PR Statistics for Euclidean distance after PCA');
plot(r_1,p_1,'DisplayName', 'Cow');
hold on;
plot(r_2,p_2, 'DisplayName', 'Tree');
hold on;
plot(r_3,p_3, 'DisplayName', 'Plane');
hold on;
plot(r_4,p_4, 'DisplayName', 'Book');
hold on;
plot(r_5,p_5, 'DisplayName', 'Bench');
strTitle = sprintf('Euclidean distance after PCA, MAP = %.2d',  round(MAP_6,3));
title(strTitle);
xlabel('Recall');
ylabel('Precision');
legend(gca, 'show');
hold off;

% Using Mahalanobis distance
[outdisplay_1 r_1 p_1 ap_1] = VS_M(queryCow,'M', true);
[outdisplay_2 r_2 p_2 ap_2] = VS_M(queryTree,'M', true);
[outdisplay_3 r_3 p_3 ap_3] = VS_M(queryPlane,'M', true);
[outdisplay_4 r_4 p_4 ap_4] = VS_M(queryBook,'M', true);
[outdisplay_5 r_5 p_5 ap_5] = VS_M(queryBench,'M', true);

% Compute the Mean Average Precision (MAP)
MAP_7 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;
 
% Show top results for all the queries
figure('Name', 'Top 10 results for Mahalanobis distance after PCA');
plot1 = subplot(5,1,1), imshow(outdisplay_1); 
strTitle = sprintf('Top 10 results for Mahalanobis distance after PCA');
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

figure('Name', 'PR Statistics for Mahalanobis distance after PCA');
plot(r_1,p_1,'DisplayName', 'Cow');
hold on;
plot(r_2,p_2, 'DisplayName', 'Tree');
hold on;
plot(r_3,p_3, 'DisplayName', 'Plane');
hold on;
plot(r_4,p_4, 'DisplayName', 'Book');
hold on;
plot(r_5,p_5, 'DisplayName', 'Bench');
strTitle = sprintf('Mahalanobis distance after PCA, MAP = %.2d',  round(MAP_7,3));
title(strTitle);
xlabel('Recall');
ylabel('Precision');
legend(gca, 'show');
hold off;