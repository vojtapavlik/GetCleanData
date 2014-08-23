GetCleanData
============

Course Assessment for the coursera class Getting and Cleaning Data.
Originally, the data collected by smart phones on 30 volunteers performing 6 different activities were downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip on Thu Aug 21 18:02:23 2014.


----------------------
The files in the repo GetCleanData:

README.md

run_analysis.R - the script to perform required changes, requires the R working directory to be set to "UCI HAR Dataset" folder 

CodeBook.md - describes the variables, the data and the transformations leading to clean data sets for part one and part two of the assignment



The data and transformations made to create the clean data set part 1
=====================================================================
The data transformation script begins with reading in the test and training sets, associated activites, subjects and the activity descriptive name codebook. 
Neither training nor test set did contain NA values. The subject and activity data columns were attached to the test and training sets. Afterwards, the both data sets were merged. Feature names were changed to descriptive names and the Activity column was recoded from numeric values to descriptive names. Finally, only the mean and the standard deviation columns for each variable were kept in the merged dataset. 
The resulting dataset contains 10 299 data entries on 66 variables and associated subject numeric code and activity description.

The data and transformations made to create the clean data set part 2
=====================================================================
The averaged dataset was created from the previously described merged dataset before reduction of the features. The unique activities and subject numeric codes were used to select a subset of values for the specified activity and subject. This subset was then averaged for each feature and stored in the new dataset. This was done for all combinations of subject and activity pairs.
This dataset contained apart from the subject numeric code and activity description another 561 columns of the measured variables and 180 rows (6 activites x 30 subjects). 

