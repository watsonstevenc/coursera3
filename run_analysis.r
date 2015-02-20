#this is an R script for the Coursera Data Gathering Course Project by Steven Watson 2/17/15
#this script assumes all files downloaded and untouched from the UCI HAR Dataset (just place the parent folder in the working directory)

subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep=" ", header=FALSE)  #this reads in the subject test data (person) 2947 obs of 1 var
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE) #this reads in the xtest data (variables)2947 obs of 561 var
ytest <- read.table("./UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE) #this reads in the ytest data (activity) 2947 obs of 1 var
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep=" ", header=FALSE) #this reads in the subject train data (person) 7352 obs of 1 var
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE) #this reads in the xtrain data (variables)7352 obs of 561 var
ytrain <- read.table("./UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE) #this reads in the ytrain data (activity) 7352 obs of 1 var
features <- read.table("./UCI HAR Dataset/features.txt", sep="", header=FALSE) #this reads in the headers for the 561 variables 561 obs of 2 var
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE) #this reads in the activities 6 obs of 2 var
library(dplyr) #loading the dplyr library. if not installed, go to install.packages("dplyr")
features<-select(features, V2) #convert features to 561 obs of 1 var
activities<-select(activities, V2) #convert features to 6 obs of 1 var
xtotal<-rbind(xtest,xtrain) #combine all the test and train data (10299 obs of 561 var)
ytotal<-rbind(ytest,ytrain) #combine all the test and train data for activity (10299 obs of 1 var)
subjecttotal<-rbind(subjecttest,subjecttrain) #combine all the test and train data for subject (10299 obs of 1 var)
finaldata<-cbind(xtotal,ytotal,subjecttotal) #combine x,y, and subject to create a final data set (10299 obs of 563 var, including activity and subject)
features1<-t(features) #transpose the headers to get them ready to apply to the data
names (finaldata) [1:561] <- features1[1:561] #apply the headers to the variable data
names (finaldata) [562:563] <- c("activity","subject") #apply the headers to the activity and subject data
activities<-rename(activities,activity=V2) #renames the activity header

# the for if else loop for the next 15 rows is applying the activity names to the activity column
for (ab in 1:10299) {
    if (finaldata$activity[ab]==1) {
        finaldata$activity[ab]="WALKING"}
    else if (finaldata$activity[ab]==2) {
        finaldata$activity[ab]="WALKING_UPSTAIRS"}
    else if (finaldata$activity[ab]==3){
        finaldata$activity[ab]="WALKING_DOWNSTAIRS"}
    else if (finaldata$activity[ab]==4) {
        finaldata$activity[ab]="SITTING"}
    else if (finaldata$activity[ab]==5) {
        finaldata$activity[ab]="STANDING"}
    else if (finaldata$activity[ab]==6) {
        finaldata$activity[ab]="LAYING"}
}
# end for if else loop

finaldata2<-finaldata[grep("mean|std|activity|subject",names(finaldata))] #converting the data into just the mean and std cols (along with activity and subject)
finaldata3<-group_by(finaldata2, activity, subject) #this groups the data by activity and subject (180 possible activity-subject combos)
finaldatamean<-ddply(finaldata2,c("activity","subject"),numcolwise(mean)) #this averages each variable for each of the 180 combinations
write.table(finaldatamean, file="C:/Users/Steven/Documents/finaldatamean.txt",row.names=FALSE) #writes the data to a .txt file