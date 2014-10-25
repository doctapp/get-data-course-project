# Getting & Cleaning Data Course Project CookBook
This document describes the variables, the data, and any transformations or work that was performed to clean up a dataset into a tidy one in the context of the course project. The original dataset relates to [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). This reference also  provides the background information necessary to understand this document and the transformations applied to the [original dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Transformed Dataset
The following are the variables resulting from transforming the original dataset into the tidy dataset as found in the `out.txt` result file:
- activity
- subject
- tBodyAcc.[mean,std].[X,Y,Z]
- tGravityAcc.[mean,std].[X,Y,Z]
- tBodyAccJerk.[mean,std].[X,Y,Z]
- tBodyGyro.[mean,std].[X,Y,Z]
- tBodyGyroJerk.[mean,std].[X,Y,Z]
- tBodyAccMag.[mean,std]
- tGravityAccMag.[mean,std]
- tBodyAccJerkMag.[mean,std]
- tBodyGyroMag.[mean,std]
- tBodyGyroJerkMag.[mean,std]
- fBodyAcc.[mean,std].[X,Y,Z]
- fBodyAcc.meanFreq.[X,Y,Z]
- fBodyAccJerk.[mean,std].[X,Y,Z]
- fBodyAccJerk.meanFreq.[X,Y,Z]
- fBodyGyro.[mean,std].[X,Y,Z]
- fBodyGyro.meanFreq.[X,Y,Z]
- fBodyAccMag.[mean,std]
- fBodyAccMag.meanFreq
- fBodyBodyAccJerkMag.[mean,std]
- fBodyBodyAccJerkMag.meanFreq
- fBodyBodyGyroMag.[mean,std]
- fBodyBodyGyroMag.meanFreq
- fBodyBodyGyroJerkMag.[mean,std]
- fBodyBodyGyroJerkMag.meanFreq
- angletBodyAccMean.gravity
- angletBodyAccJerkMean.gravityMean
- angletBodyGyroMean.gravityMean
- angletBodyGyroJerkMean.gravityMean
- angle[X,Y,Z].gravityMean

where [mean,std] denotes that a variable has both 'mean' and 'std' versions,
and [X,Y,Z] implies distinct X, Y and Z values. For instance, tBodyAcc.[mean,std].[X,Y,Z] expands to:
- tBodyAcc.mean.X
- tBodyAcc.mean.Y
- tBodyAcc.mean.Z
- tBodyAcc.std.X
- tBodyAcc.std.Y
- tBodyAcc.std.Z

`activity` represents the activity performed by the test subject and is one of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, or LAYING.

`subject` represents the unique identity of the person who performed the `activity` and is an integer in the range [1, 30].

The full description and units of the other variables is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). This basically covers `mean` and standard deviation values (i.e. `std`) of various accelerations and angular velocities.

## Transformations
The following steps have been carried out over the [original dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) resulting in the output file `out.txt`:
- Download and unzip the dataset
- Merge the training and the test sets to create one dataset
- Extract only the measurements on the mean and standard deviation for each measurement
- Use descriptive activity names to name the activities in the dataset
- Appropriately label the dataset with descriptive variable names
- Create an independent tidy dataset with the average of each variable for each activity and each subject

These transformations are implemented in the `run_analysis.R` file which contains further details on each one of these steps.

## References
- [Original Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
- [Full Dataset Description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
- [Data Science, Wearable Computing and the Battle for the Throne as World’s Top Sports Brand](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand)
