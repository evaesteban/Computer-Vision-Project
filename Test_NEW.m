%% Test_NEW.m
%% This code will perform visual search on the data using colour grid descriptors. It will compare the results 
%% using different queries, distance measures and grid sizes.

queryCow = '5_14_s';
queryTree = '2_7_s';
queryPlane = '4_12_s';
queryBook = '13_14_s';
queryBench = '14_15_s';

 % Using Euclidean distance and 4 columns 4 rows
 
 Compute_Descriptors_NEW(4,4); % Compute descriptors
 
 [outdisplay_1 r_1 p_1 ap_1] = VS_NEW(queryCow,'E', false);
 [outdisplay_2 r_2 p_2 ap_2] = VS_NEW(queryTree,'E', false);
 [outdisplay_3 r_3 p_3 ap_3] = VS_NEW(queryPlane,'E', false);
 [outdisplay_4 r_4 p_4 ap_4] = VS_NEW(queryBook,'E', false);
 [outdisplay_5 r_5 p_5 ap_5] = VS_NEW(queryBench,'E', false);
 
 % % Compute the Mean Average Precision (MAP)
 MAP_1 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;
  
 % Show top results for all the queries
 figure('Name', 'Top 10 results for Euclidean distance and 4 columns 4 rows');
 plot1 = subplot(5,1,1), imshow(outdisplay_1); 
 strTitle = sprintf('Top 10 results for Euclidean distance and 4 columns 4 rows');%
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
 legend(gca, 'show');
 hold off;
 
 % Using Euclidean distance and 16 columns 16 rows
 
 Compute_Descriptors_NEW(16,16); % Compute descriptors
 
[outdisplay_1 r_1 p_1 ap_1] = VS_NEW(queryCow,'E', false);
[outdisplay_2 r_2 p_2 ap_2] = VS_NEW(queryTree,'E', false);
[outdisplay_3 r_3 p_3 ap_3] = VS_NEW(queryPlane,'E', false);
[outdisplay_4 r_4 p_4 ap_4] = VS_NEW(queryBook,'E', false);
[outdisplay_5 r_5 p_5 ap_5] = VS_NEW(queryBench,'E', false);
 
 % Compute the Mean Average Precision (MAP)
 MAP_2 = (ap_1 + ap_2 + ap_3 + ap_4 + ap_5)/5;
  
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
strTitle = sprintf('Euclidean distance and 16 columns 16 rows, MAP = %.2d',  round(MAP_2,3));
title(strTitle);
legend(gca, 'show');
hold off;


