# Evaluation of Lesion Segmentation Algorithms

This github repository contains the data and analysis files we used to evaluate automated 
segmentations against one another (ALI, lesion_gnb, and LINDA). 

Please reference this [this paper](https://onlinelibrary.wiley.com/doi/full/10.1002/hbm.24729) for more detail:

Ito, K. L., Kim, H., & Liew, S. L. (2019). A comparison of automated lesion segmentation approaches for chronic stroke T1‐weighted MRI data. Human brain mapping, 40(16), 4669-4685.


__Raw automated lesion mask files can be found under the zipped file "lesion_masks".__ Please see [this paper](https://doi-org.libproxy1.usc.edu/10.1038/sdata.2018.11) for raw T1w MRIs and manual lesion tracings. 

__/Evaluation_Metrics__
- this directory contains matlab files for calculating the Dice Coefficient, Hausdorff's Distance, Average Symmetric Surface Distance, Precision, and Recall for any two nifti mask files.

__/Image_Metrics__
- this directory contains the csv file with the image metrics we analyzed ("Image_Metrics_132subj.csv"dice, assd, hausdorff's distance, precision, recall); and the R markdown file that performed Friedman's Tests on each metric, followed by pairwise comparisons.
- Figures 2 and 3 were generated from this manuscript
- 132 subjects are included (of the original 181), as cases with 1. no detected lesioned voxels (39) and 2. cases in which all 3 algorithms had 0 overlap between automated mask and manual segmentation (10) were removed.

__/Lesion_Volumes__
- this directory contains the analyses and data used to compare lesion volumes of automated masks and manual segmentations.
- The R markdown file contains correlations between lesion volumes for each automated  method, with and without adjusting for outliers using cook's distance
- again, 132 subjects were included in this analysis
	
__/Lesion_Characteristics__
- this directory contains data and analyses for the Fisher's exact tests used to analyze whether performance on automated methods varied by lesion size or stroke territory
- the csv file contains data for all 181 subjects

	```
	key:
	strokeType: 1= cortical, 2=subcortical, 3=brainstem, 4=cerebellar
	LesHem: 0=left hemisphere stroke, 1=right hemisphere stroke
	LesVol_Categorical: 1=small, 2=medium, 3=large
	```
	
__/Minimum_Distance__
- this directory contains the R script used to create Figure 4 in the manuscript. 
- We provide minimum distance as descriptive data; no statistical analysis is performed as the number of lesions that misclassified lesions (i.e., had 0 overlap between automated mask and manual segmentations) were not equal between methods
	

	

	
	
