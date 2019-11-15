%% Test_CG.m
%% This code will perform visual search on the data using colour grid descriptors. It will compare the results 
%% using different queries, distance measures and grid sizes.

queryCow = '5_14_s';
queryTree = '2_7_s';
queryPlane = '4_12_s';
queryBook = '13_14_s';
queryBench = '14_15_s';

% Using Euclidean distance and 4 columns 4 rows
Compute_Descriptors_CG(4,4); % Compute descriptors
[outdisplay_1 r_1 p_1 ap_1] = VS_CG(queryCow,'E', false);
[outdisplay_2 r_2 p_2 ap_2] = VS_CG(queryTree,'E', false);
[outdisplay_3 r_3 p_3 ap_3] = VS_CG(queryPlane,'E', false);
[outdisplay_4 r_4 p_4 ap_4] = VS_CG(queryBook,'E', false);
[outdisplay_5 r_5 p_5 ap_5] = VS_CG(queryBench,'E', false);

% Compute the Mean Average Precision (MAP)
MAP_1 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;
 
% Show top results for all the queries
figure('Name', 'Top 10 results for Euclidean distance and 4 columns 4 rows');

plot1 = subplot(5,1,1), imshow(outdisplay_1); 
strTitle = sprintf('Top 10 results for Euclidean distance and 4 columns 4 rows');
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

figure('Name', 'PR Statistics for Euclidean distance and 4 columns 4 rows');
plot(r_1,p_1,'DisplayName', 'Cow');
hold on;
plot(r_2,p_2, 'DisplayName', 'Tree');
hold on;
plot(r_3,p_3, 'DisplayName', 'Plane');
hold on;
plot(r_4,p_4, 'DisplayName', 'Book');
hold on;
plot(r_5,p_5, 'DisplayName', 'Bench');
strTitle = sprintf('Euclidean distance and 4 columns 4 rows, MAP = %.2d',  round(MAP_1,3));
title(strTitle);
xlabel('Recall');
ylabel('Precision');
legend(gca, 'show');
hold off;

% Using L1 norm distance and 4 columns 4 rows

Compute_Descriptors_CG(4,4); % Compute descriptors

[outdisplay_1 r_1 p_1 ap_1] = VS_CG(queryCow,'L1', false);
[outdisplay_2 r_2 p_2 ap_2] = VS_CG(queryTree,'L1', false);
[outdisplay_3 r_3 p_3 ap_3] = VS_CG(queryPlane,'L1', false);
[outdisplay_4 r_4 p_4 ap_4] = VS_CG(queryBook,'L1', false);
[outdisplay_5 r_5 p_5 ap_5] = VS_CG(queryBench,'L1', false);

% Compute the Mean Average Precision (MAP)
MAP_2 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;
 
% Show top results for all the queries
figure('Name', 'Top 10 results for L1 norm distance and 4 columns 4 rows');

plot1 = subplot(5,1,1), imshow(outdisplay_1); 
strTitle = sprintf('Top 10 results for L1 norm distance and 4 columns 4 rows');
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

figure('Name', 'PR Statistics for L1 norm distance and 4 columns 4 rows');
plot(r_1,p_1,'DisplayName', 'Cow');
hold on;
plot(r_2,p_2, 'DisplayName', 'Tree');
hold on;
plot(r_3,p_3, 'DisplayName', 'Plane');
hold on;
plot(r_4,p_4, 'DisplayName', 'Book');
hold on;
plot(r_5,p_5, 'DisplayName', 'Bench');
strTitle = sprintf('L1 norm distance and 4 columns 4 rows, MAP = %.2d',  round(MAP_2,3));
title(strTitle);
xlabel('Recall');
ylabel('Precision');
legend(gca, 'show');
hold off;

% Using L3 norm distance and 4 columns 4 rows

Compute_Descriptors_CG(4,4); % Compute descriptors

[outdisplay_1 r_1 p_1 ap_1] = VS_CG(queryCow,'L3', false);
[outdisplay_2 r_2 p_2 ap_2] = VS_CG(queryTree,'L3', false);
[outdisplay_3 r_3 p_3 ap_3] = VS_CG(queryPlane,'L3', false);
[outdisplay_4 r_4 p_4 ap_4] = VS_CG(queryBook,'L3', false);
[outdisplay_5 r_5 p_5 ap_5] = VS_CG(queryBench,'L3', false);

% Compute the Mean Average Precision (MAP)
MAP_3 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;
 
% Show top results for all the queries
figure('Name', 'Top 10 results for L3 norm distance and 4 columns 4 rows');

plot1 = subplot(5,1,1), imshow(outdisplay_1); 
strTitle = sprintf('Top 10 results for L3 norm distance and 4 columns 4 rows');
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

figure('Name', 'PR Statistics for L3 norm distance and 4 columns 4 rows');
plot(r_1,p_1,'DisplayName', 'Cow');
hold on;
plot(r_2,p_2, 'DisplayName', 'Tree');
hold on;
plot(r_3,p_3, 'DisplayName', 'Plane');
hold on;
plot(r_4,p_4, 'DisplayName', 'Book');
hold on;
plot(r_5,p_5, 'DisplayName', 'Bench');
strTitle = sprintf('L3 norm distance and 4 columns 4 rows, MAP = %.2d',  round(MAP_3,3));
title(strTitle);
xlabel('Recall');
ylabel('Precision');
legend(gca, 'show');
hold off;

% Using Bray Curtis distance and 4 columns 4 rows

Compute_Descriptors_CG(4,4); % Compute descriptors

[outdisplay_1 r_1 p_1 ap_1] = VS_CG(queryCow,'B', false);
[outdisplay_2 r_2 p_2 ap_2] = VS_CG(queryTree,'B', false);
[outdisplay_3 r_3 p_3 ap_3] = VS_CG(queryPlane,'B', false);
[outdisplay_4 r_4 p_4 ap_4] = VS_CG(queryBook,'B', false);
[outdisplay_5 r_5 p_5 ap_5] = VS_CG(queryBench,'B', false);

% Compute the Mean Average Precision (MAP)
MAP_4 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;
 
% Show top results for all the queries
figure('Name', 'Top 10 results for Bray Curtis distance and 4 columns 4 rows');

plot1 = subplot(5,1,1), imshow(outdisplay_1); 
strTitle = sprintf('Top 10 results for Bray Curtis distance and 4 columns 4 rows');
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

figure('Name', 'PR Statistics for Bray Curtis distance and 4 columns 4 rows');
plot(r_1,p_1,'DisplayName', 'Cow');
hold on;
plot(r_2,p_2, 'DisplayName', 'Tree');
hold on;
plot(r_3,p_3, 'DisplayName', 'Plane');
hold on;
plot(r_4,p_4, 'DisplayName', 'Book');
hold on;
plot(r_5,p_5, 'DisplayName', 'Bench');
strTitle = sprintf('Bray Curtis distance and 4 columns 4 rows, MAP = %.2d',  round(MAP_4,3));
title(strTitle);
xlabel('Recall');
ylabel('Precision');
legend(gca, 'show');
hold off;

% Using Canberra distance and 4 columns 4 rows

Compute_Descriptors_CG(4,4); % Compute descriptors

[outdisplay_1 r_1 p_1 ap_1] = VS_CG(queryCow,'C', false);
[outdisplay_2 r_2 p_2 ap_2] = VS_CG(queryTree,'C', false);
[outdisplay_3 r_3 p_3 ap_3] = VS_CG(queryPlane,'C', false);
[outdisplay_4 r_4 p_4 ap_4] = VS_CG(queryBook,'C', false);
[outdisplay_5 r_5 p_5 ap_5] = VS_CG(queryBench,'C', false);

% Compute the Mean Average Precision (MAP)
MAP_5 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;
 
% Show top results for all the queries
figure('Name', 'Top 10 results for Canberra distance and 4 columns 4 rows');

plot1 = subplot(5,1,1), imshow(outdisplay_1); 
strTitle = sprintf('Top 10 results for Canberra distance and 4 columns 4 rows');
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

figure('Name', 'PR Statistics for Canberra distance and 4 columns 4 rows');
plot(r_1,p_1,'DisplayName', 'Cow');
hold on;
plot(r_2,p_2, 'DisplayName', 'Tree');
hold on;
plot(r_3,p_3, 'DisplayName', 'Plane');
hold on;
plot(r_4,p_4, 'DisplayName', 'Book');
hold on;
plot(r_5,p_5, 'DisplayName', 'Bench');
strTitle = sprintf('Canberra distance and 4 columns 4 rows, MAP = %.2d',  round(MAP_5,3));
title(strTitle);
xlabel('Recall');
ylabel('Precision');
legend(gca, 'show');
hold off;

%% Compute results after PCA
% Using Euclidean distance and a 4 columns 4 rows
[outdisplay_1 r_1 p_1 ap_1] = VS_CG(queryCow,'E', true);
[outdisplay_2 r_2 p_2 ap_2] = VS_CG(queryTree,'E', true);
[outdisplay_3 r_3 p_3 ap_3] = VS_CG(queryPlane,'E', true);
[outdisplay_4 r_4 p_4 ap_4] = VS_CG(queryBook,'E', true);
[outdisplay_5 r_5 p_5 ap_5] = VS_CG(queryBench,'E', true);

% Compute the Mean Average Precision (MAP)
MAP_6 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;
 
% Show top results for all the queries
figure('Name', 'Top 10 results for Euclidean distance and 4 columns 4 rows after PCA');
plot1 = subplot(5,1,1), imshow(outdisplay_1);
strTitle = sprintf('Top 10 results for Euclidean distance and 4 columns 4 rows after PCA');
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

figure('Name', 'PR Statistics for Euclidean distance and 4 columns 4 rows after PCA');
plot(r_1,p_1,'DisplayName', 'Cow');
hold on;
plot(r_2,p_2, 'DisplayName', 'Tree');
hold on;
plot(r_3,p_3, 'DisplayName', 'Plane');
hold on;
plot(r_4,p_4, 'DisplayName', 'Book');
hold on;
plot(r_5,p_5, 'DisplayName', 'Bench');
strTitle = sprintf('Euclidean distance and 4 columns 4 rows after PCA, MAP = %.2d',  round(MAP_6,3));
title(strTitle);
xlabel('Recall');
ylabel('Precision');
legend(gca, 'show');
hold off;

% Using Mahalanobis distance and a 4 columns 4 rows
Compute_Descriptors_CG(4,4);

[outdisplay_1 r_1 p_1 ap_1] = VS_CG(queryCow,'M', true);
[outdisplay_2 r_2 p_2 ap_2] = VS_CG(queryTree,'M', true);
[outdisplay_3 r_3 p_3 ap_3] = VS_CG(queryPlane,'M', true);
[outdisplay_4 r_4 p_4 ap_4] = VS_CG(queryBook,'M', true);
[outdisplay_5 r_5 p_5 ap_5] = VS_CG(queryBench,'M', true);

% Compute the Mean Average Precision (MAP)
MAP_7 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;
 
% Show top results for all the queries
figure('Name', 'Top 10 results for Mahalanobis distance and 4 columns 4 rows after PCA');
plot1 = subplot(5,1,1), imshow(outdisplay_1);
strTitle = sprintf('Top 10 results for Mahalanobis distance and 4 columns 4 rows after PCA');
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

figure('Name', 'PR Statistics for Mahalnobis distance and 4 columns 4 rows after PCA');
plot(r_1,p_1,'DisplayName', 'Cow');
hold on;
plot(r_2,p_2, 'DisplayName', 'Tree');
hold on;
plot(r_3,p_3, 'DisplayName', 'Plane');
hold on;
plot(r_4,p_4, 'DisplayName', 'Book');
hold on;
plot(r_5,p_5, 'DisplayName', 'Bench');
strTitle = sprintf('Euclidean distance and 4 columns 4 rows after PCA, MAP = %.2d',  round(MAP_7,3));
title(strTitle);
xlabel('Recall');
ylabel('Precision');
legend(gca, 'show');
hold off;

% Using Euclidean distance and a size of 16 columns 16 rows

Compute_Descriptors_CG(16,16); % Compute descriptors
[outdisplay_1 r_1 p_1 ap_1] = VS_CG(queryCow,'E', false);
[outdisplay_2 r_2 p_2 ap_2] = VS_CG(queryTree,'E', false);
[outdisplay_3 r_3 p_3 ap_3] = VS_CG(queryPlane,'E', false);
[outdisplay_4 r_4 p_4 ap_4] = VS_CG(queryBook,'E', false);
[outdisplay_5 r_5 p_5 ap_5] = VS_CG(queryBench,'E', false);

% Compute the Mean Average Precision (MAP)
MAP_8 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;
 
% Show top results for all the queries
figure('Name', 'Top 10 results for Euclidean distance and 16 columns 16 rows');
plot1 = subplot(5,1,1), imshow(outdisplay_1); 
strTitle = sprintf('Top 10 results for Euclidean distance and 16 columns 16 rows');
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

figure('Name', 'PR Statistics for Euclidean distance and 16 columns 16 rows');
plot(r_1,p_1,'DisplayName', 'Cow');
hold on;
plot(r_2,p_2, 'DisplayName', 'Tree');
hold on;
plot(r_3,p_3, 'DisplayName', 'Plane');
hold on;
plot(r_4,p_4, 'DisplayName', 'Book');
hold on;
plot(r_5,p_5, 'DisplayName', 'Bench');
strTitle = sprintf('Euclidean distance and 16 columns 16 rows, MAP = %.2d',  round(MAP_8,3));
title(strTitle);
xlabel('Recall');
ylabel('Precision');
legend(gca, 'show');
hold off;

% Using Euclidean distance and 32 columns 32 rows
Compute_Descriptors_CG(32,32); % Compute Descriptors
[outdisplay_1 r_1 p_1 ap_1] = VS_CG(queryCow,'E', false);
[outdisplay_2 r_2 p_2 ap_2] = VS_CG(queryTree,'E', false);
[outdisplay_3 r_3 p_3 ap_3] = VS_CG(queryPlane,'E', false);
[outdisplay_4 r_4 p_4 ap_4] = VS_CG(queryBook,'E', false);
[outdisplay_5 r_5 p_5 ap_5] = VS_CG(queryBench,'E', false);

% Compute the Mean Average Precision (MAP)
MAP_9 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;
 
% Show top results for all the queries
figure('Name', 'Top 10 results for Euclidean distance and 32 columns 32 rows');
plot1 = subplot(5,1,1), imshow(outdisplay_1); 
strTitle = sprintf('Top 10 results for Euclidean distance and 32 columns 32 rows');
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

figure('Name', 'PR Statistics for Euclidean distance and 32 columns 32 rows');
plot(r_1,p_1,'DisplayName', 'Cow');
hold on;
plot(r_2,p_2, 'DisplayName', 'Tree');
hold on;
plot(r_3,p_3, 'DisplayName', 'Plane');
hold on;
plot(r_4,p_4, 'DisplayName', 'Book');
hold on;
plot(r_5,p_5, 'DisplayName', 'Bench');
strTitle = sprintf('Euclidean distance and 32 columns 32 rows, MAP = %.2d',  round(MAP_9,3));
title(strTitle);
xlabel('Recall');
ylabel('Precision');
legend(gca, 'show');
hold off;

