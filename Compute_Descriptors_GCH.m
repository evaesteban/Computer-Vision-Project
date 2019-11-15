function Compute_Descriptors_GCH(Q)

%% This function will compute the global colour histogram descriptors with the specified quantisation level for all the images within the
%% database. It has been derived from the skeleton code for the EEE3032 coursework assignment.

%% Specify dataset address
DATASET_FOLDER = 'C:\Users\Eva Esteban\Desktop\CV_Coursework\Assignment\Assignment\MSRC_ObjCategImageDatabase_v2';

%% Specify folder and subfolders to store the image descriptor results
OUT_FOLDER = 'C:\Users\Eva Esteban\Desktop\CV_Coursework\Assignment\Assignment\descriptors';
OUT_SUBFOLDER_GCH='globalColourHisto';

allfiles=dir (fullfile([DATASET_FOLDER,'/Images/*.bmp']));

%% Compute and save the image descriptors for all the images in the database
for filenum=1:length(allfiles)
    fname=allfiles(filenum).name;
    imgfname_full=([DATASET_FOLDER,'/Images/',fname]);
    img=double(imread(imgfname_full));
    fout_GCH=[OUT_FOLDER,'/',OUT_SUBFOLDER_GCH,'/',fname(1:end-4),'.mat'];
    F_GCH = Global_Colour_Hist(img, Q);
    save(fout_GCH,'F_GCH');
end
