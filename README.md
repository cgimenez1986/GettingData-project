Getting and Cleaning Data - Course Project
===================
##Introduction

This repo contains the Course Project for the Course "Getting and Cleaning Data". The purpose of this project is to collect, work with, and clean a data set, so it can be used for a further analysis.

##Assignment

You should create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

##Execution and files

1. Data should be downloaded from this site: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Then, it must be extracted in the working directory of RStudio
3. Run source("run_analysis.R"). It will create a file named "tidydata.txt" with the tidy data.

##Dependencies
This script uses the packages data.table, plyr and reshape2. This packages should be downloaded if they are not, with the command install.packages.

##Other

It includes three files:

1. The file run_analysis.R, which includes the script that creates the tidy data
2. The file codebook.md, which contains the explanation of the changes done in the data to obtain the tidy data set.
3. This file README.md, which explains the contents of the repo.
