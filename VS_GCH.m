function [selectedImg R P AP] = VS_GCH(queryName, distMeasure, PCA)

%% This function will use the global colour histogram descriptors and the specified distance measure to rank the database images according to the similarity to the specified query image.
%% It has been derived from the skeleton code for the EEE3032 coursework assignment.
%% INPUT: queryName, the query filename
%% INPUT: distMeasure, 'E' for Euclidean, 'L1' for L1 norm, 'L3' for L3 norm, 'B' for Bray Curtis, 'C' for Canberra and 'M' for Mahalanobis
%% INPUT: PCA, will equal true if PCA should be performed
%% OUTPUT: selectedImg, the top 10 results to display
%% OUTPUT: R, recall array
%% OUTPUT: P, precision array
%% AP: Average Precision value for the query

%% Set the address for the database folder 
DATASET_FOLDER = 'C:\Users\Eva Esteban\Desktop\CV_Coursework\Assignment\Assignment\MSRC_ObjCategImageDatabase_v2';

%% Set the address for the results folder 
DESCRIPTOR_FOLDER = 'C:\Users\Eva Esteban\Desktop\CV_Coursework\Assignment\Assignment\descriptors';

%% Set the address to the descriptors folder
DESCRIPTOR_SUBFOLDER='globalColourHisto';

%% Load all the descriptors into "ALLFEAT"
ALLFEAT=[];
ALLFILES=cell(1,0);
ALLFILENAMES=cell(1,0);
ctr=1;
allfiles=dir (fullfile([DATASET_FOLDER,'/Images/*.bmp']));

%% Load query image
featFileQuery=[DESCRIPTOR_FOLDER,'/',DESCRIPTOR_SUBFOLDER,'/',queryName,'.mat'];
load(featFileQuery, 'F_GCH');
featFileQueryData=F_GCH;
queryToken=strtok(queryName,'_');

%% Load all image descriptors into ALLFEAT
m_dist=[];
relTotal = 0; % Counter to store the number of images in the database that belong to the same class as the query

for filenum=1:length(allfiles) % Iterate through array containing all the image files
    fname=allfiles(filenum).name;
    fileToken=strtok(fname,'_'); 
    if(strcmp(queryToken,fileToken)) % Extract the class of the image and count the number of relevant images (ground truth)
        relTotal = relTotal + 1;
    end
    ALLFILENAMES{ctr}=fname;
    imgfname_full=([DATASET_FOLDER,'/Images/',fname]);
    img=double(imread(imgfname_full));
    thesefeat=[];
    featfile=[DESCRIPTOR_FOLDER,'/',DESCRIPTOR_SUBFOLDER,'/',fname(1:end-4),'.mat'];  % Load the image descriptor for the corresponding image file
    load(featfile,'F_GCH');
    ALLFILES{ctr}=imgfname_full;
    ALLFEAT=[ALLFEAT ; F_GCH];
    ctr=ctr+1; % Increment variable to iterate through ALLFILES array
end

%% If specified, perform PCA analysis on the feature data to select only the directions in
%% which the data varies significantly
if(PCA == true)
    e = Eigen_Build(ALLFEAT'); % Build Eigenmodel for all the image features
    ctrNotNull = 0; % Variable to store the number of significant eigenvalues in the Eigenmodel

    sumE = sum(e.val); % Add eigenvalues up
    sumE = sumE*0.915; % Determine the amount of eigenvalues to keep
    sumEImg = 0;
    
    % Iterate through the eigenvalues to determine the null space 
    for(i=1:size(e.val))
            if(sumEImg < sumE)
            sumEImg = sumEImg + e.val(i);
            ctrNotNull = ctrNotNull + 1;
            end 
    end

    % Eliminate null space from the Eigenmodel matrix and project the data to
    % the new space composed only by the directions in which the data varies
    % significantly
    e = Eigen_Deflate(e,'keepn',ctrNotNull);
    ALLFEAT=Eigen_Project(ALLFEAT',e)';

    %% Perform the same PCA procedure on the query image
    featFileQueryData=Eigen_Project(featFileQueryData',e)';
end

%% Compute the distance of image to the query
NIMG=size(ALLFEAT,1); % Number of images in collection
dst=[];

for i=1:NIMG  
    candidate=ALLFEAT(i,:);
    if(distMeasure == 'E')
        % Compute Euclidean or L2 norm distance to the query
       thedst=Euclidean(featFileQueryData,candidate);
    elseif(distMeasure == 'L1')
       % Compute L1 norm distance to the query
       thedst=L1_norm(featFileQueryData,candidate);
    elseif(distMeasure == 'L3')
       % Compute L3 norm distance to the query
       thedst=L3_norm(featFileQueryData,candidate);
    elseif(distMeasure == 'B')
       % Compute Bray Curtis distance to the query
       thedst=Bray_Curtis(featFileQueryData,candidate);
    elseif(distMeasure == 'C')
       % Compute L1 norm distance to the query
       thedst=Canberra(featFileQueryData,candidate);  
    elseif(distMeasure == 'M')
       % Compute Mahalanobis distance to the query
       thedst=Mahalanobis(featFileQueryData,candidate, e.val);
    end  
    %Store distance of each file to query in an array
    dst=[dst ; [thedst i]];
end

% Sort the distance arrays
dst=sortrows(dst,1);  

%% Visualise the results for Euclidean distance
% Arrange results to display 
SHOW=10; % Show top 10 results
outdisplay=[];

for i=1:SHOW % All dst arrays have been truncated to have the same number of rows
   % First query
   img=imread(ALLFILES{dst(i,2)});
   img=img(1:2:end,1:2:end,:); % make image a quarter size
   img=img(1:81,:,:); % crop image to uniform size vertically (some MSVC images are different heights)
   outdisplay=[outdisplay img];
end

%% Compute Precision-Recall (PR) statistics and Average Precision (AP) values for
%% the system using the Euclidean distance results
ANALYSE=591; % Number of results to analyse

% Arrays to store precision and recall data
p=[];
r=[];  
 
% Variables to store the number of results that are relevant to each
% query i.e similar to each query
relctr = 0;

% Variable to indicate whether the current value is relevant or not 
% to compute the AP values
rel = 0;

% Variable to store the sum of the precision of the relevant results for
% each query
sumP = 0;

for i=1:ANALYSE  % All dst arrays have been truncated to have the same number of rows
    
    filename = ALLFILENAMES{dst(i,2)};
    token=strtok(filename,'_');  
    if(strcmp(queryToken,token))
        relctr = relctr + 1;
        rel = 1;
    end
    p(i) = (relctr)/i;
    r(i) = (relctr)/relTotal; 
    sumP = sumP + (p(i) * rel);
    rel = 0; 
end

% Compute Average Precision (AP) values for each query after classification
AP = sumP / relTotal;

% Assign output variables
selectedImg = outdisplay;
R = r;
P = p;

%% Compute confusion matrix statistics for Euclidean distance results
% ANALYSE=30; % Number of results to analyse
% 
% % Array to store confusion matrix
% M = [];
% truth = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1; 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2; 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3; 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4];
% class = [];
% 
% for i=1:ANALYSE  % All dst arrays have been truncated to have the same number of rows
%     
%     % First query
%     filename=ALLFILENAMES{dst_1(i,2)};
%     token=strtok(filename,'_');
%     if(strcmp("6",token))
%         class(1,i) = 1;
%     elseif(strcmp("2",token))
%         class(1,i) = 2;
%     elseif(strcmp("4",token))
%         class(1,i) = 3;
%     elseif(strcmp("13",token))
%         class(1,i) = 4;
%     end
%     
%     % Second query
%     filename=ALLFILENAMES{dst_2(i,2)};
%     token=strtok(filename,'_');
%     if(strcmp("6",token))
%         class(2,i) = 1;
%     elseif(strcmp("2",token))
%         class(2,i) = 2;
%     elseif(strcmp("4",token))
%         class(2,i) = 3;
%     elseif(strcmp("13",token))
%         class(2,i) = 4;
%     end
%     
%     % Third query
%     filename=ALLFILENAMES{dst_3(i,2)};
%     if(strcmp("6",token))
%         class(3,i) = 1;
%     elseif(strcmp("2",token))
%         class(3,i) = 2;
%     elseif(strcmp("4",token))
%         class(3,i) = 3;
%     elseif(strcmp("13",token))
%         class(3,i) = 4;
%     end
%     
%     % Fourth query
%     filename=ALLFILENAMES{dst_4(i,2)};
%     token=strtok(filename,'_'); 
%     if(strcmp("6",token))
%         class(4,i) = 1;
%     elseif(strcmp("2",token))
%         class(4,i) = 2;
%     elseif(strcmp("4",token))
%         class(4,i) = 3;
%     elseif(strcmp("13",token))
%         class(4,i) = 4;
%     end
% end
% 
% class = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1; 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2; 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3; 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4];
% 
% M = Confusion_Matrix(truth, class);

