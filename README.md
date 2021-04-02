# DataCleansingFinal
==================================================================
Human Activity Smartphone Data Summary
version 1.0
==================================================================
This project provides a script that summarizes data from the Human Activity Recognition Using Smartphones Dataset, Version 1.0 created by Jorge L. Reyes-Ortiz,  Davide Anguita, Alessandro Ghio, Luca Oneto. of:
	Smartlab - Non Linear Complex Systems Laboratory
	DITEN - Università degli Studi di Genova.
	Via Opera Pia 11A, I-16145, Genoa, Italy.
	activityrecognition@smartlab.ws
	www.smartlab.ws
==================================================================
The project contains the following files:
run_analysis.R
body_movement_observation_sample.csv
body_movement_observation_means.csv
README.txt
run_analysis_codebook.doc
run_analysis_codebook.pdf

==================================================================
run_analysis.R
*** Over View
Sets up the environment, reads in data from their observation data set, extracts standard deviations and means, and combine the test and training subject data and produces the two csv files.  

It uses the following files from getdata_projectfiles_UCI HAR Dataset.zip which can be downloaded from:
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
and assumes that the sub folder "UCI HAR Dataset" and its constituents has been copied into the project folder.

UCI HAR Dataset/features.txt
UCI HAR Dataset/activity_labels.txt
UCI HAR Dataset/train/X_train.txt
UCI HAR Dataset/train/y_train.txt
UCI HAR Dataset/train/subject_train.txt
UCI HAR Dataset/test/X_test.txt
UCI HAR Dataset/test/y_test.txt
UCI HAR Dataset/test/subject_test.txt

For more information about the source datasets contact: activityrecognition@smartlab.ws or refer to the README.txt file contained in the project zip file.

==================================================================
body_movement_observation_sample.csv
Contains just the mean and std deviation for each observation interval in the x_test and x_train files.  Observations are tagged with the subject id, the numeric activity code and the activity description (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).  Columns are labled with the descriptive labels found in features.txt.

==================================================================
body_movement_observation_means.csv
Provides the mean of each value for each activity and subject found in body_movement_observation_sample.csv


==================================================================
README.txt  - This file.
==================================================================
run_analysis_codebook.doc
MS word version of the codebook (for editing) 
==================================================================
run_analysis_codebook.pdf
pdf version of the codebook for distribution.  lists data fields found in each output file along with their sources and transformations.


Notes: 
======
Use of this data is governed by the following License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
