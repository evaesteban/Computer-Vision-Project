%% Test_EOH.m
%% This code will perform visual search on the data using edge orientation histogram descriptors. It will compare the results 
%% using different queries, distance measures, grid sizes and angular quantisation levels.

queryCow = '5_14_s';
queryTree = '2_7_s';
queryPlane = '4_12_s';
queryBook = '13_14_s';
queryBench = '14_15_s';

% Using Euclidean distance, 4 columns 4 rows, and an angular quantisation
%of 8
Compute_Descriptors_EOH(4,4,8); % Compute descriptors

[outdisplay_1 r_1 p_1 ap_1] = VS_EOH(queryCow,'E', false);
[outdisplay_2 r_2 p_2 ap_2] = VS_EOH(queryTree,'E', false);
[outdisplay_3 r_3 p_3 ap_3] = VS_EOH(queryPlane,'E', false);
[outdisplay_4 r_4 p_4 ap_4] = VS_EOH(queryBook,'E', false);
[outdisplay_5 r_5 p_5 ap_5] = VS_EOH(queryBench,'E', false);

% Compute the Mean Average Precision (MAP)
MAP_1 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;
 
% Show top results for all the queries
figure('Name', 'Top 10 results for Euclidean distance, 4 columns 4 rows, and Q=8');
plot1 = subplot(5,1,1), imshow(outdisplay_1); 
strTitle = sprintf('Top 10 results for Euclidean distance, 4 columns 4 rows and Q=8');
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

figure('Name', 'PR Statistics for Euclidean distance, 4 columns 4 rows, and Q=8');
plot(r_1,p_1,'DisplayName', 'Cow');
hold on;
plot(r_2,p_2, 'DisplayName', 'Tree');
hold on;
plot(r_3,p_3, 'DisplayName', 'Plane');
hold on;
plot(r_4,p_4, 'DisplayName', 'Book');
hold on;
plot(r_5,p_5, 'DisplayName', 'Bench');
strTitle = sprintf('Euclidean distance, 4 columns 4 rows and Q=8, MAP = %.2d',  round(MAP_1,3));
title(strTitle);
xlabel('Recall');
ylabel('Precision');
legend(gca, 'show');
hold off;

% Using L1 norm distance, a size of 4 columns 4 rows and a quatisation level of 8
[outdisplay_1 r_1 p_1 ap_1] = VS_EOH(queryCow,'L1', false);
[outdisplay_2 r_2 p_2 ap_2] = VS_EOH(queryTree,'L1', false);
[outdisplay_3 r_3 p_3 ap_3] = VS_EOH(queryPlane,'L1', false);
[outdisplay_4 r_4 p_4 ap_4] = VS_EOH(queryBook,'L1', false);
[outdisplay_5 r_5 p_5 ap_5] = VS_EOH(queryBench,'L1', false);

% Compute the Mean Average Precision (MAP)
MAP_2 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;
 
% Show top results for all the queries
figure('Name', 'Top 10 results for L1 norm distance, 4 columns 4 rows and Q=8');
plot1 = subplot(5,1,1), imshow(outdisplay_1); 
strTitle = sprintf('Top 10 results for L1 norm distance, 4 columns 4 rows and Q=8');
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

figure('Name', 'PR Statistics for L1 norm distance, 4 columns 4 rows and Q=8');
plot(r_1,p_1,'DisplayName', 'Cow');
hold on;
plot(r_2,p_2, 'DisplayName', 'Tree');
hold on;
plot(r_3,p_3, 'DisplayName', 'Plane');
hold on;
plot(r_4,p_4, 'DisplayName', 'Book');
hold on;
plot(r_5,p_5, 'DisplayName', 'Bench');
strTitle = sprintf('L1 norm distance, 4 columns 4 rows and Q=8, MAP = %.2d',  round(MAP_2,3));
title(strTitle);
xlabel('Recall');
ylabel('Precision');
legend(gca, 'show');
hold off;

% Using L3 norm distance, 16 columns 16 rows and a quantisation level of 8
[outdisplay_1 r_1 p_1 ap_1] = VS_EOH(queryCow,'L3', false);
[outdisplay_2 r_2 p_2 ap_2] = VS_EOH(queryTree,'L3', false);
[outdisplay_3 r_3 p_3 ap_3] = VS_EOH(queryPlane,'L3', false);
[outdisplay_4 r_4 p_4 ap_4] = VS_EOH(queryBook,'L3', false);
[outdisplay_5 r_5 p_5 ap_5] = VS_EOH(queryBench,'L3', false);

% Compute the Mean Average Precision (MAP)
MAP_3 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;
 
% Show top results for all the queries
figure('Name', 'Top 10 results for L3 norm distance, 4 columns 4 rows and Q=8');
plot1 = subplot(5,1,1), imshow(outdisplay_1); 
strTitle = sprintf('Top 10 results for L3 norm distance, 4 columns 4 rows and Q=8');
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

figure('Name', 'PR Statistics for L3 norm distance, 4 columns 4 rows and Q=8');
plot(r_1,p_1,'DisplayName', 'Cow');
hold on;
plot(r_2,p_2, 'DisplayName', 'Tree');
hold on;
plot(r_3,p_3, 'DisplayName', 'Plane');
hold on;
plot(r_4,p_4, 'DisplayName', 'Book');
hold on;
plot(r_5,p_5, 'DisplayName', 'Bench');
strTitle = sprintf('L3 norm distance, 4 columns 4 rows and Q=8, MAP = %.2d',  round(MAP_3,3));
title(strTitle);
xlabel('Recall');
ylabel('Precision');
legend(gca, 'show');
hold off;

% Using Bray Curtis distance, 16 columns 16 rows and a quantisation level
% of 8
[outdisplay_1 r_1 p_1 ap_1] = VS_EOH(queryCow,'B', false);
[outdisplay_2 r_2 p_2 ap_2] = VS_EOH(queryTree,'B', false);
[outdisplay_3 r_3 p_3 ap_3] = VS_EOH(queryPlane,'B', false);
[outdisplay_4 r_4 p_4 ap_4] = VS_EOH(queryBook,'B', false);
[outdisplay_5 r_5 p_5 ap_5] = VS_EOH(queryBench,'B', false);

% Compute the Mean Average Precision (MAP)
MAP_4 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;

% Show top results for all the queries
figure('Name', 'Top 10 results for Bray Curtis distance, 4 columns 4 rows and Q=8');
plot1 = subplot(5,1,1), imshow(outdisplay_1); 
strTitle = sprintf('Top 10 results for Bray Curtis distance, 4 columns 4 rows and Q=8');
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

figure('Name', 'PR Statistics for Bray Curtis distance, 4 columns 4 rows and Q=8');
plot(r_1,p_1,'DisplayName', 'Cow');
hold on;
plot(r_2,p_2, 'DisplayName', 'Tree');
hold on;
plot(r_3,p_3, 'DisplayName', 'Plane');
hold on;
plot(r_4,p_4, 'DisplayName', 'Book');
hold on;
plot(r_5,p_5, 'DisplayName', 'Bench');
strTitle = sprintf('Euclidean distance, 4 columns 4 rows and Q=8, MAP = %.2d',  round(MAP_4,3));
title(strTitle);
xlabel('Recall');
ylabel('Precision');
legend(gca, 'show');
hold off;

% Using Canberra distance, 4 columns 4 rows and a quantisation level of 8
[outdisplay_1 r_1 p_1 ap_1] = VS_EOH(queryCow,'C', false);
[outdisplay_2 r_2 p_2 ap_2] = VS_EOH(queryTree,'C', false);
[outdisplay_3 r_3 p_3 ap_3] = VS_EOH(queryPlane,'C', false);
[outdisplay_4 r_4 p_4 ap_4] = VS_EOH(queryBook,'C', false);
[outdisplay_5 r_5 p_5 ap_5] = VS_EOH(queryBench,'C', false);

% Compute the Mean Average Precision (MAP)
MAP_5 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;
 
% Show top results for all the queries
figure('Name', 'Top 10 results for Canberra distance, 4 columns 4 rows and Q=8');
plot1 = subplot(5,1,1), imshow(outdisplay_1); 
strTitle = sprintf('Top 10 results for Canberra distance, 4 columns 4 rows and Q=8');
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

figure('Name', 'PR Statistics for Canberra distance, 4 columns 4 rows and Q=8');
plot(r_1,p_1,'DisplayName', 'Cow');
hold on;
plot(r_2,p_2, 'DisplayName', 'Tree');
hold on;
plot(r_3,p_3, 'DisplayName', 'Plane');
hold on;
plot(r_4,p_4, 'DisplayName', 'Book');
hold on;
plot(r_5,p_5, 'DisplayName', 'Bench');
strTitle = sprintf('Canberra distance, 4 columns 4 rows and Q=8, MAP = %.2d',  round(MAP_5,3));
title(strTitle);
xlabel('Recall');
ylabel('Precision');
legend(gca, 'show');
hold off;

% Using Euclidean distance, 16 columns 16 rows and a quantisation level
% of 4
Compute_Descriptors_EOH(16,16,8); % Compute descriptors
[outdisplay_1 r_1 p_1 ap_1] = VS_EOH(queryCow,'E', false);
[outdisplay_2 r_2 p_2 ap_2] = VS_EOH(queryTree,'E', false);
[outdisplay_3 r_3 p_3 ap_3] = VS_EOH(queryPlane,'E', false);
[outdisplay_4 r_4 p_4 ap_4] = VS_EOH(queryBook,'E', false);
[outdisplay_5 r_5 p_5 ap_5] = VS_EOH(queryBench,'E', false);

% Compute the Mean Average Precision (MAP)
MAP_6 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;
 
% Show top results for all the queries
figure('Name', 'Top 10 results for Euclidean distance, 16 columns 16 rows and Q=8');
plot1 = subplot(5,1,1), imshow(outdisplay_1); 
strTitle = sprintf('Top 10 results for Euclidean distance, 16 columns 16 rows and Q=8');
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

figure('Name', 'PR Statistics for Euclidean distance, 16 columns 16 rows and Q=8');
plot(r_1,p_1,'DisplayName', 'Cow');
hold on;
plot(r_2,p_2, 'DisplayName', 'Tree');
hold on;
plot(r_3,p_3, 'DisplayName', 'Plane');
hold on;
plot(r_4,p_4, 'DisplayName', 'Book');
hold on;
plot(r_5,p_5, 'DisplayName', 'Bench');
strTitle = sprintf('Euclidean distance, 16 columns 16 rows and Q=8, MAP = %.2d',  round(MAP_6,3));
title(strTitle);
xlabel('Recall');
ylabel('Precision');
legend(gca, 'show');
hold off;

% Using Euclidean distance, 4 columns 4 rows and a quantisation level
% of 256
Compute_Descriptors_EOH(4,4,256); % Compute descriptors

[outdisplay_1 r_1 p_1 ap_1] = VS_EOH(queryCow,'E', false);
[outdisplay_2 r_2 p_2 ap_2] = VS_EOH(queryTree,'E', false);
[outdisplay_3 r_3 p_3 ap_3] = VS_EOH(queryPlane,'E',  false);
[outdisplay_4 r_4 p_4 ap_4] = VS_EOH(queryBook,'E', false);
[outdisplay_5 r_5 p_5 ap_5] = VS_EOH(queryBench,'E', false);

% Compute the Mean Average Precision (MAP)
MAP_7 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;
 
% Show top results for all the queries
figure('Name', 'Top 10 results for Euclidean distance, 4 columns 4 rows and Q=256');
plot1 = subplot(5,1,1), imshow(outdisplay_1); 
strTitle = sprintf('Top 10 results for Euclidean distance, 4 columns 4 rows and Q=256');
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

figure('Name', 'PR Statistics for Euclidean distance, 4 columns 4 rows and Q=256');
plot(r_1,p_1,'DisplayName', 'Cow');
hold on;
plot(r_2,p_2, 'DisplayName', 'Tree');
hold on;
plot(r_3,p_3, 'DisplayName', 'Plane');
hold on;
plot(r_4,p_4, 'DisplayName', 'Book');
hold on;
plot(r_5,p_5, 'DisplayName', 'Bench');
strTitle = sprintf('Euclidean distance, 4 columns 4 rows and Q=256, MAP = %.2d',  round(MAP_7,3));
title(strTitle);
xlabel('Recall');
ylabel('Precision');
legend(gca, 'show');
hold off;

% Using Euclidean distance, 4 columns 4 rows and a quantisation level
% of 256 after PCA

[outdisplay_1 r_1 p_1 ap_1] = VS_EOH(queryCow,'E', true);
[outdisplay_2 r_2 p_2 ap_2] = VS_EOH(queryTree,'E', true);
[outdisplay_3 r_3 p_3 ap_3] = VS_EOH(queryPlane,'E',  true);
[outdisplay_4 r_4 p_4 ap_4] = VS_EOH(queryBook,'E', true);
[outdisplay_5 r_5 p_5 ap_5] = VS_EOH(queryBench,'E', true);

% Compute the Mean Average Precision (MAP)
MAP_8 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;
 
% Show top results for all the queries
figure('Name', 'Top 10 results for Euclidean distance, 4 columns 4 rows and Q=256 after PCA');
plot1 = subplot(5,1,1), imshow(outdisplay_1); 
strTitle = sprintf('Top 10 results for Euclidean distance, 4 columns 4 rows and Q=256 after PCA');
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

figure('Name', 'PR Statistics for Euclidean distance, 4 columns 4 rows and Q=256 after PCA');
plot(r_1,p_1,'DisplayName', 'Cow');
hold on;
plot(r_2,p_2, 'DisplayName', 'Tree');
hold on;
plot(r_3,p_3, 'DisplayName', 'Plane');
hold on;
plot(r_4,p_4, 'DisplayName', 'Book');
hold on;
plot(r_5,p_5, 'DisplayName', 'Bench');
strTitle = sprintf('Euclidean distance, 4 columns 4 rows and Q=256 after PCA, MAP = %.2d',  round(MAP_8,3));
title(strTitle);
xlabel('Recall');
ylabel('Precision');
legend(gca, 'show');
hold off;

% Using Mahalanobis distance, 4 columns 4 rows and a quantisation level
% of 256 after PCA

[outdisplay_1 r_1 p_1 ap_1] = VS_EOH(queryCow,'M', true);
[outdisplay_2 r_2 p_2 ap_2] = VS_EOH(queryTree,'M', true);
[outdisplay_3 r_3 p_3 ap_3] = VS_EOH(queryPlane,'M',  true);
[outdisplay_4 r_4 p_4 ap_4] = VS_EOH(queryBook,'M', true);
[outdisplay_5 r_5 p_5 ap_5] = VS_EOH(queryBench,'M', true);

% Compute the Mean Average Precision (MAP)
MAP_9 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;
 
% Show top results for all the queries
figure('Name', 'Top 10 results for Mahalanobis distance, 4 columns 4 rows and Q=256 after PCA');
plot1 = subplot(5,1,1), imshow(outdisplay_1); 
strTitle = sprintf('Top 10 results for Mahalanobis distance, 4 columns 4 rows and Q=256 after PCA');
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

figure('Name', 'PR Statistics for Mahalanobis distance, 4 columns 4 rows and Q=256 after PCA');
plot(r_1,p_1,'DisplayName', 'Cow');
hold on;
plot(r_2,p_2, 'DisplayName', 'Tree');
hold on;
plot(r_3,p_3, 'DisplayName', 'Plane');
hold on;
plot(r_4,p_4, 'DisplayName', 'Book');
hold on;
plot(r_5,p_5, 'DisplayName', 'Bench');
strTitle = sprintf('Mahalanobis distance, 4 columns 4 rows and Q=256, MAP = %.2d',  round(MAP_9,3));
title(strTitle);
xlabel('Recall');
ylabel('Precision');
legend(gca, 'show');
hold off;