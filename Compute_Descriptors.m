%% Compute_Descriptors.m
%%
%% This code will compute the globcal colour histogram, colour grid, edge orientation
%% histogram, moment, and new technique descriptors for all the images within the
%% specified database. It has been derived from the skeleton code for the 
%% EEE3032 coursework assignment.

close all;
clear all;

%% Specify dataset address
DATASET_FOLDER = 'C:\Users\Eva Esteban\Desktop\CV_Coursework\Assignment\Assignment\MSRC_ObjCategImageDatabase_v2';

%% Specify folder and subfolders to store the image descriptor results
OUT_FOLDER = 'C:\Users\Eva Esteban\Desktop\CV_Coursework\Assignment\Assignment\descriptors';
OUT_SUBFOLDER_GCH='globalColourHisto';
OUT_SUBFOLDER_CG='colourGrid';
OUT_SUBFOLDER_EOH='edgeOrientHisto';
OUT_SUBFOLDER_M='moment';
OUT_SUBFOLDER_NEW='newTech';
OUT_SUBFOLDER_CG_EOH='colourGridEOH';

allfiles=dir (fullfile([DATASET_FOLDER,'/Images/*.bmp']));

%% Compute and save the different image descriptors for all the images in the database
for filenum=1:length(allfiles)
    fname=allfiles(filenum).name;
    fprintf('Processing file %d/%d - %s\n',filenum,length(allfiles),fname);
    tic;
    imgfname_full=([DATASET_FOLDER,'/Images/',fname]);
    img=double(imread(imgfname_full));
    fout_GCH=[OUT_FOLDER,'/',OUT_SUBFOLDER_GCH,'/',fname(1:end-4),'.mat'];
    fout_CG=[OUT_FOLDER,'/',OUT_SUBFOLDER_CG,'/',fname(1:end-4),'.mat'];
    fout_EOH=[OUT_FOLDER,'/',OUT_SUBFOLDER_EOH,'/',fname(1:end-4),'.mat'];
    fout_M=[OUT_FOLDER,'/',OUT_SUBFOLDER_M,'/',fname(1:end-4),'.mat'];
    fout_NEW=[OUT_FOLDER,'/',OUT_SUBFOLDER_NEW,'/',fname(1:end-4),'.mat'];
    fout_CG_EOH=[OUT_FOLDER,'/',OUT_SUBFOLDER_CG_EOH,'/',fname(1:end-4),'.mat'];
 
    F_GCH = Global_Colour_Hist(img, 4);
    F_CG = Colour_Grid(img,30,30);
    F_EOH = EOH(img,4,4,8);
    F_M = Moment_Descriptor(img);
    F_NEW = New_Technique(img,4,4);
    F_CG_EOH = Colour_Grid_EOH(img,4,4,8);
    save(fout_GCH,'F_GCH');
    save(fout_CG,'F_CG');
    save(fout_EOH,'F_EOH');
    save(fout_M,'F_M');
    save(fout_NEW,'F_NEW');
    save(fout_CG_EOH,'F_CG_EOH');
    toc
end
