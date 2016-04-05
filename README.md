#R script and dataset for "Getting and Cleaning Data Course Project"

## Input data
The input raw data is from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the link of the input data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## The repo includes the following files:

- 'run_analysis.R' : R script does the following: 
   -- 1.Merges the training and the test sets to create one data set. 
   -- 2.Extracts only the measurements on the mean and standard deviation for each measurement. 3.Uses descriptive activity names to name the activities in the data set 4.Appropriately labels the data set with descriptive variable names. 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

- 'feature_all.zip': zip file of feature_all.txt, which is the result of step1 of run_analysis.R. It contains columns of subject, activity code, activity labels and all features by merging the training and the test sets.

- 'feature_mean_std.txt':result of step2 of run_analysis.R. It contains columns of subject, activity code, activity labels and only the features on the mean and standard deviation from feature_all.txt.

- 'feature_ave.txt': result of step5 of run_analysis.R. subject, activity labels and  the average of each variable for each activity and each subject.

- 'CodeBook.md' : descripbe columns for feature_all.txt, feature_mean_std.txt and feature_ave.txt


##Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

##License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
