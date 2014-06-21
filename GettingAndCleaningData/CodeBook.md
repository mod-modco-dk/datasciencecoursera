# Preamble
The following is produced as part of the Course Project in the Cursera course
Getting and Cleaning Data.
Description of the course can be found here:
http://www.coursera.org/course/getdata

# Study Design
The data the produced dataset are derived from are described on this web page: 
Human Activity Recognition Using Smartphones Data Set 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data Set Information:
The experiments have been carried out with a group of 30 volunteers within an age 
bracket of 19-48 years. Each person performed six activities (WALKING, 
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone 
(Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant 
rate of 50Hz. The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the 
volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise 
filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap 
(128 readings/window). The sensor acceleration signal, which has gravitational and 
body motion components, was separated using a Butterworth low-pass filter into body 
acceleration and gravity. The gravitational force is assumed to have only low 
frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From 
each window, a vector of features was obtained by calculating variables from the time 
and frequency domain. 

*This is a quote from the link above.*

The data is obtained from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Code book
This data set consists of two files
The two files have the same column layout, described below.
- "activity_obeservations.csv" are data for all observations
- "activity_aggregates.csv" aggravated data over subject and activity.

The first two columns are:
- subject_id: integer value identifying the subject that was measured (id in (1:30))
- activity_label: text label describe the activity measured label in (WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING)  

The other features selected for these datasets come from the accelerometer and gyroscope 
3-axial raw signals tAcc_XYZ and tGyro_XYZ. These time domain signals (prefix 't' to 
denote time) were captured at a constant rate of 50 Hz. Then they were filtered using 
a median filter and a 3rd order low pass Butterworth filter with a corner frequency 
of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into 
body and gravity acceleration signals (tBodyAcc_XYZ and tGravityAcc_XYZ) using 
another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time 
to obtain Jerk signals (tBodyAccJerk_XYZ and tBodyGyroJerk_XYZ). Also the magnitude 
of these three-dimensional signals were calculated using the Euclidean norm 
(tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing 
fBodyAcc_XYZ, fBodyAccJerk_XYZ, fBodyGyro_XYZ, fBodyAccJerkMag, fBodyGyroMag, 
fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'_XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc_XYZ
- tGravityAcc_XYZ
- tBodyAccJerk_XYZ
- tBodyGyro_XYZ
- tBodyGyroJerk_XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc_XYZ
- fBodyAccJerk_XYZ
- fBodyGyro_XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean: Mean value
- std: Standard deviation
- angle: Angle between two vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These 
are used on the angle variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean


The complete list of variables of each feature vector is available in the header of the csv files.

*The above is taken from "features_info.txt" in the downloaded zip file.*






