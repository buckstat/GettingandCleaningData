# 

## Getting and Cleaning Data Project

Author: Ted Buckless

#### **Information about the Design of the Data Set**

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

### Variables collected and modified for the TidyData file for this project

[**subjectId**]{.ul} - a numeric value from [1 - 30] representing a unique subject enrolled in the smartPhone experiment.

[**activity**]{.ul} - a character string value [ LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS] representing the type of activity the subject was performing when the measurements were taking. These values recode the original [1-6] values from the smartphone data set.

[**measurements**]{.ul}**- labeled fd (finished data) in the R script** - a numeric value representing then mean values taken from the mean and standard deviations measurements based on the subject and the activity. There are 66 measurement variables taken from the smartphone data set based on whether they contain the Identifier mean() or std.

The variable (features) selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

[**Variables**]{.ul} (features) included measurements are numeric contained in the interval [-1,1].

tBodyAccMeanX Average of means for body acceleration on x axis\
tBodyAccMeanY Average of means for body acceleration on y axis\
tBodyAccMeanZ Average of means for body acceleration on z axis\
tBodyAccStdX ...\
tBodyAccStdY\
tBodyAccStdZ\
tGravityAccMeanX\
tGravityAccMeanY\
tGravityAccMeanZ\
tGravityAccStdX\
tGravityAccStdY\
tGravityAccStdZ\
tBodyAccJerkMeanX\
tBodyAccJerkMeanY\
tBodyAccJerkMeanZ\
tBodyAccJerkStdX\
tBodyAccJerkStdY\
tBodyAccJerkStdZ\
tBodyGyroMeanX\
tBodyGyroMeanY\
tBodyGyroMeanZ\
tBodyGyroStdX\
tBodyGyroStdY\
tBodyGyroStdZ\
tBodyGyroJerkMeanX\
tBodyGyroJerkMeanY\
tBodyGyroJerkMeanZ\
tBodyGyroJerkStdX\
tBodyGyroJerkStdY\
tBodyGyroJerkStdZ\
tBodyAccMagMean\
tBodyAccMagStd\
tGravityAccMagMean\
tGravityAccMagStd\
tBodyAccJerkMagMean\
tBodyAccJerkMagStd\
tBodyGyroMagMean\
tBodyGyroMagStd\
tBodyGyroJerkMagMean\
tBodyGyroJerkMagStd\
fBodyAccMeanX\
fBodyAccMeanY\
fBodyAccMeanZ\
fBodyAccStdX\
fBodyAccStdY\
fBodyAccStdZ\
fBodyAccJerkMeanX\
fBodyAccJerkMeanY\
fBodyAccJerkMeanZ\
fBodyAccJerkStdX\
fBodyAccJerkStdY\
fBodyAccJerkStdZ\
fBodyGyroMeanX\
fBodyGyroMeanY\
fBodyGyroMeanZ\
fBodyGyroStdX\
fBodyGyroStdY\
fBodyGyroStdZ\
fBodyAccMagMean\
fBodyAccMagStd\
fBodyAccJerkMagMean\
fBodyAccJerkMagStd\
fBodyGyroMagMean\
fBodyGyroMagStd\
fBodyGyroJerkMagMean\
fBodyGyroJerkMagStd

#### See the README.md to see how the the below were implemented:

1.  How the test and training sets are merged.
2.  Extracts only the measurements on the mean() and std for each measurement.
3.  Uses the descriptive activity names to name the activities in th data set.
4.  Labels the data sets with descriptive variable names.
5.  Creates a tidy data set with the average of each variable for each activity and each subject.

#### Transformations or work performed to clean up data:

1.  All variables that didn't include mean() or std were removed from the original data set
2.  The activity codes were replaced with the appropriate labels I.E - SITTING, STANDING etc.
3.  The variable (feature) names were cleaned up to be more readable.
4.  The means were computed from the variable data grouped by subjectID and activity.
