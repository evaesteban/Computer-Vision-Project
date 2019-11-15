function Compute_Descriptors_CG_EOH(x,y,Q)

%% This function will compute the colour grid and edge orientation histogram descriptors with the specified grid size and quantisation level for all the images within the
%% database. It has been derived from the skeleton code for the EEE3032 coursework assignment.
%% INPUT: x, the number of rows in which to divide the image
%% INPUT: y, the number of columns in which to divide the image
%% INPUT: Q, the quantisation level

%% Specify dataset address
DATASET_FOLDER = 'C:\Users\Eva Esteban\Desktop\CV_Coursework\Assignment\Assignment\MSRC_ObjCategImageDatabase_v2';

%% Specify folder and subfolders to store the image descriptor results
OUT_FOLDER = 'C:\Users\Eva Esteban\Desktop\CV_Coursework\Assignment\Assignment\descriptors';
OUT_SUBFOLDER_CG_EOH='colourGridEOH';

allfiles=dir (fullfile([DATASET_FOLDER,'/Images/*.bmp']));

%% Compute and save the image descriptors for all the images in the database
for filenum=1:length(allfiles)
    fname=allfiles(filenum).name;
    imgfname_full=([DATASET_FOLDER,'/Images/',fname]);
    img=double(imread(imgfname_full))./255;
    fout_CG_EOH=[OUT_FOLDER,'/',OUT_SUBFOLDER_CG_EOH,'/',fname(1:end-4),'.mat'];
    F_CG_EOH = Colour_Grid_EOH(img, x,y,Q);
    save(fout_CG_EOH,'F_CG_EOH');
end
