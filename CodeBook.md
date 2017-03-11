# Code Book
This file is a code book for describes the variables and any transformations or work that you performed to clean up the data.

## Introduction
This experiment counted on 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 
This explanation is present in 'README.txt'.

## Features
This dataset have:
* Number of Instances: 10299
* Number of Attributes: 561
* No 'NA' values

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: Mean value, Standard deviation, Median absolute deviation, Largest value in array,Smallest value in array, Signal magnitude area, Energy measure. Sum of the squares divided by the number of values, Interquartile range, Signal entropy, Autorregresion coefficients with Burg order equal to 4, correlation coefficient between two signals, index of the frequency component with largest magnitude, Weighted average of the frequency components to obtain a mean frequency, skewness of the frequency domain signal, kurtosis of the frequency domain signal, Energy of a frequency interval within the 64 bins of the FFT of each window, Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

See more 'features_info.txt' (in zip file).

## Transformation details
* Merges the training and the test sets to create one data set.

I was loaded the train (70% of the volunteers) and test (30% of the volunteers) dataset and we concatenated these datasets.

* Extracts only the measurements on the mean and standard deviation for each measurement.

I extracted the measurements mean and sd from data with function grep.

* Uses descriptive activity names to name the activities in the data set

I loaded the data about descriptive activity names and applied the function merge by activity id.

* Appropriately labels the data set with descriptive variable names.

I loaded the data with variables names and i put it in the dataset. Morever, some functions have been applied to clear variable names.

* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

I created the tidy dataset from data used in step 4. In tidy dataset, i applyed function summary_all to calculate average of each variable for each activity and each subject.
