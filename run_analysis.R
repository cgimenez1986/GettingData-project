#Adds the libraries, if necessary
library("data.table")
library("reshape2")
library("plyr")

#It is assumed that the ZIP file is downloaded and extracted in the Working Directory
#Reads the train files: Activity, main data and subject

trainX<-read.table("./UCI HAR Dataset/train/X_train.txt")
trainY<-read.table("./UCI HAR Dataset/train/Y_train.txt")
trainsubj<-read.table("./UCI HAR Dataset/train/subject_train.txt")

#Reads the test files: Main data, activity labels and subject

testX<-read.table("./UCI HAR Dataset/test/X_test.txt")
testY<-read.table("./UCI HAR Dataset/test/Y_test.txt")
testsubj<-read.table("./UCI HAR Dataset/test/subject_test.txt")

#Merges the train and test data sets to create one complete set 

data_X<-rbind(trainX,testX)
data_Y<-rbind(trainY,testY)
data_subj<-rbind(trainsubj,testsubj)

#Labels the columns of the activity and subject id. Later these columns will be modified.

colnames(data_Y)<-c("activity_id")
colnames(data_subj)<-c("subject_id")

#Reads the labels of activities so that each id will be matched with one of the six activities.

activities<-read.table("./UCI HAR Dataset/activity_labels.txt")
data_Y$activity_id<-activities[data_Y$activity_id,2]

#Reads the names of the features
#Changes the id of the columns to have the names of the features

features<-read.table("./UCI HAR Dataset/features.txt")
colnames(features)<-c("feature_id","feature_name")
features$feature_id<-paste("V",features$feature_id,sep="")

#Filters only the features having mean or std in the label.

ef<-features[grepl("mean",features$feature_name,ignore.case=TRUE) | 
                 grepl("std",features$feature_name,ignore.case=TRUE),]

#Creates a new table to have only the features previously asked (those with mean or std)

dataX2<-data_X[,ef$feature_id]
colnames(dataX2)<-ef$feature_name

#Combines the columns of subject, activity and the data of train and test merged.

data_act<-cbind(data_subj,data_Y,dataX2)

#Calculates the average of each subject and activity

tidy_data<-ddply(data_act,.(subject_id,activity_id),colwise(mean))

#Writes the final result in a TXT file

write.table(tidy_data, file = "tidydata.txt", quote=FALSE, row.names=FALSE)
    
