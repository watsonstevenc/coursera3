==================================================================
Coursera Data Gathering Course Project
Version 1.0
==================================================================
Steven Watson
watsonstevenc@gmail.com
02-17-2015
==================================================================
This dataset and R script were developed using the Human Activity Recognition on Smartphones data by Jorge L. Reyes-Ortiz and others
It was completed as required for the Coursera Data Gathering Course Project (Feb-15)
The R script assumes that you have all of the data required for the project which can be found here https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
======================================
There is only one R script (finaldatamean.r).
This script takes the following data sets (all .txt):
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

For technical details on the script, or an explanation of the data, please see the Code Book (CodeBook.md)
The script will have to be modified slightly to pick up the files from the correct location depending on user setup
==================================================================
Notes: 

This is the data of various smartphone readings taken at different times in a combination of subjects and activities.
Combined, the test and training data have over 10k observations for each reading. These observations are split among 180 subject/activity combinations.
There were 30 subjects who participated in 6 activities. Each subject participated in all activities for the required time.
The R script does the following:
    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement (79 variables). 
    Uses descriptive activity names to name the 6 activities in the data set
    Appropriately labels the data set with descriptive variable names. 
    Creates a second, independent tidy data set with the average of each variable for each activity and each subject (180 values for each variable).

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
