
Code Book- Mean of Smartphone Activities

Note: This Code Book is designed:
-to explain how to get the raw .txt files from the Human Activity Recognition on Smartphones data by Jorge L. Reyes-Ortiz and others
-to transform that into a single data set
-to group the data and average it for output
-to explain the variables
For more information, including how to obtain the original source files, see the README.md file

-Raw data is first read in from the source files into the following data frames using the read.table function:
subjecttest, xtest, ytest, subjecttrain, xtrain, ytrain, features, activities (see R script for details)

-features and activities are converted into single column data frames with the select function

-xtotal, ytotal, and subjecttotal are created as combinations of the test and train data with the rbind function

-finaldata is created with a cbind function that combines xtotal, ytotal, and subjecttotal

-features is then transposes and applied as the header to the finaldata table (along with activity and subject)

-at this point, the script should have produced a finaldata table that includes over 10k rows and 563 columns
 
-an if else loop is used to change the activity number to actual activities

-grep is used to create a smaller table (finaldata2) which includes just the mean and std dev columns (79 plus activity and subject)

-finaldata2 is grouped by activity and subject in preparation for the final transformation

-ddply is used to find the mean of each variable for each subject/activity combinations

-write.table is used to output a finaldatamean.txt file as the tidy data set

================================================

A description of the variables is as follows. 
In all cases except for col 1 (activity) and col 2 (subject), the values represent the average over all data points for that specific activity/subject/variable combination

[1] "activity"  - The activity that the subject performed   
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING
 
[2] "subject" - The subject that was being tested
1-30. Corresponds with a specific individual
    
In columns [3-81] the values are the mean of the observation of the variable given the values of [1] and [2].
The variables may be understood in the following format:
t/f- time or frequency
Body/Gravity- whether we were recording the movement of the body or the force of gravity constant
Acc/Gyro- whether we were recording the accelerometer or the gyroscope measurement
mean()/std()- whether we were recording the mean or standard deviation
X/Y/Z- which axis we were measuring
		  
 [3] "tBodyAcc-mean()-X"               
 [4]"tBodyAcc-mean()-Y"              
 [5] "tBodyAcc-mean()-Z"               
 [6]"tBodyAcc-std()-X"               
 [7] "tBodyAcc-std()-Y"                
 [8]"tBodyAcc-std()-Z"               
 [9] "tGravityAcc-mean()-X"            
 [10]"tGravityAcc-mean()-Y"           
[11] "tGravityAcc-mean()-Z"            
[12]"tGravityAcc-std()-X"            
[13] "tGravityAcc-std()-Y"             
[14]"tGravityAcc-std()-Z"            
[15] "tBodyAccJerk-mean()-X"           
[16]"tBodyAccJerk-mean()-Y"          
[17] "tBodyAccJerk-mean()-Z"           
[18]"tBodyAccJerk-std()-X"           
[19] "tBodyAccJerk-std()-Y"            
[20]"tBodyAccJerk-std()-Z"           
[21] "tBodyGyro-mean()-X"              
[22]"tBodyGyro-mean()-Y"             
[23] "tBodyGyro-mean()-Z"              
[24]"tBodyGyro-std()-X"              
[25] "tBodyGyro-std()-Y"               
[26]"tBodyGyro-std()-Z"              
[27] "tBodyGyroJerk-mean()-X"          
[28]"tBodyGyroJerk-mean()-Y"         
[29] "tBodyGyroJerk-mean()-Z"          
[30]"tBodyGyroJerk-std()-X"          
[31] "tBodyGyroJerk-std()-Y"           
[32]"tBodyGyroJerk-std()-Z"          
[33] "tBodyAccMag-mean()"              
[34]"tBodyAccMag-std()"              
[35] "tGravityAccMag-mean()"           
[36]"tGravityAccMag-std()"           
[37] "tBodyAccJerkMag-mean()"          
[38]"tBodyAccJerkMag-std()"          
[39] "tBodyGyroMag-mean()"             
[40]"tBodyGyroMag-std()"             
[41] "tBodyGyroJerkMag-mean()"         
[42]"tBodyGyroJerkMag-std()"         
[43] "fBodyAcc-mean()-X"               
[44]"fBodyAcc-mean()-Y"              
[45] "fBodyAcc-mean()-Z"               
[46]"fBodyAcc-std()-X"               
[47] "fBodyAcc-std()-Y"                
[48]"fBodyAcc-std()-Z"               
[49] "fBodyAcc-meanFreq()-X"           
[50]"fBodyAcc-meanFreq()-Y"          
[51] "fBodyAcc-meanFreq()-Z"           
[52]"fBodyAccJerk-mean()-X"          
[53] "fBodyAccJerk-mean()-Y"           
[54]"fBodyAccJerk-mean()-Z"          
[55] "fBodyAccJerk-std()-X"            
[56]"fBodyAccJerk-std()-Y"           
[57] "fBodyAccJerk-std()-Z"            
[58]"fBodyAccJerk-meanFreq()-X"      
[59] "fBodyAccJerk-meanFreq()-Y"       
[60]"fBodyAccJerk-meanFreq()-Z"      
[61] "fBodyGyro-mean()-X"              
[62]"fBodyGyro-mean()-Y"             
[63] "fBodyGyro-mean()-Z"              
[64]"fBodyGyro-std()-X"              
[65] "fBodyGyro-std()-Y"               
[66]"fBodyGyro-std()-Z"              
[67] "fBodyGyro-meanFreq()-X"          
[68]"fBodyGyro-meanFreq()-Y"         
[69] "fBodyGyro-meanFreq()-Z"          
[70]"fBodyAccMag-mean()"             
[71] "fBodyAccMag-std()"               
[72]"fBodyAccMag-meanFreq()"         
[73] "fBodyBodyAccJerkMag-mean()"      
[74]"fBodyBodyAccJerkMag-std()"      
[75] "fBodyBodyAccJerkMag-meanFreq()"  
[76]"fBodyBodyGyroMag-mean()"        
[77] "fBodyBodyGyroMag-std()"          
[78]"fBodyBodyGyroMag-meanFreq()"    
[79] "fBodyBodyGyroJerkMag-mean()"     
[80]"fBodyBodyGyroJerkMag-std()"     
[81] "fBodyBodyGyroJerkMag-meanFreq()"
