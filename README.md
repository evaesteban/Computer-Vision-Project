The visual searches can be run with >> [outdisplay r p ap] = "Visual Search File Name"(queryName, dist, PCA)
where the queryName is the filename of the query (not the whole path), dist is the distance measure and 
PCA is a boolean equal to true if PCA has to be performed on the data. 

The distance is determined by 'E' for Euclidean, 'L1' for L1 norm, 'L3' for L3 norm, 'B' for Bray Curtis and 'C' for Canberra distance.

The function returns the top 10 results (outdisplay), an array containing the recall values for all the images in the database (r), 
an array containing the precision values for all the images in the database (p), and the Average Precision value (ap) for the input query. 

The "Visual Search File Name" can be VS\_CG for the colour grid, VS\_EOH for the edge orientation histogram, VS\_CG\_EOH for the colour grid
combined with the edge orientation histogram, VS\_M for the colour moment, VS\_GCH\_M for the global colour histogram combined with colour moment and 
VS\_NEW for the new technique.

The The project includes seven test files to ensure the correct functioning of each technique: 
'Test\_GCH.m' for the global colour histogram, 
'Test\_CG.m' for the colour grid, 'Test\_EOH.m' for the edge orientation histogram,
'Test\_CG\_EOH.m' for the colour grid combined with the edge orientation histogram, 
'Test\_M.m' for the colour moment descriptor, 'Test\_GCH\_M.m' for the global colour histogram
with colour moments, and 'Test\_NEW.m' for the new technique. 

Each test outputs a figure showing the top 10 results and the PR curves for each query with their corresponding 
MAP values (average of the five used queries' AP values). 

I completed this project at the University of Surrey, UK. A full description of this tool can be found on [Link to Report](Esteban_Eva_CV.pdf)
