The variables
==================================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation


Activity variable described the activity assigned from the subject video records.
Subject denotes volunteer performing the particular activity.


The data and transformations made to create the clean data set part 1
=====================================================================
The data transformation script begins with reading in the test and training sets, associated activites, subjects and the activity descriptive name codebook. 
Neither training nor test set did contain NA values. The subject and activity data columns were attached to the test and training sets. Afterwards, the both data sets were merged. Feature names were changed to descriptive names and the Activity column was recoded from numeric values to descriptive names. Finally, only the mean and the standard deviation columns for each variable were kept in the merged dataset. 
The resulting dataset contains 10 299 data entries on 66 variables and associated subject numeric code and activity description.

The data and transformations made to create the clean data set part 2
=====================================================================
The averaged dataset was created from the previosly described merged dataset before reduction of the features. The unique activities and subject numeric codes were used to select a subset of values for the specified activity and subject. This subset was then averaged for each feature and stored in the new dataset. This was done for all combinations of subject and activity pairs.
