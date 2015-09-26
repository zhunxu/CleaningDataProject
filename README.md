# CleaningDataProject
Coursera Getting and Cleaning Data Course Project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example  this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 

5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Good luck!

# Run_analysis.r Step by Step: 

1.Merges the training and the test sets to create one data set. 

To merge the test data

--get subject id from "subject_test.txt"

--get activity label from "y_test.txt"

--get test data from "X_test.txt" 

--column bind three files into testbind

--apply first column name as Subject, apply second column name as ActivityLabel, apply rest variable names from "features.txt"

To merge the train data

--get subject id from "subject_train.txt"

--get activity label from "y_train.txt"

--get test data from "X_train.txt" 

--column bind three files into trainbind

--apply first column name as Subject, apply second column name as ActivityLabel, apply rest variable names from "features.txt"

Rowbind testbind and trainbind files into total file

2.Extracts only the measurements on the mean and standard deviation for each measurement. 

--using column name from total file, find vaiables name contain "mean" or "std", make sure "meanFreq" is excluded

--extract from total files that variable name is TRUE from previous step, puls Subject and ActivityLabel columns

3.Uses descriptive activity names to name the activities in the data set 

--create new column Activity based on ActivityLabel

4.Appropriately labels the data set with descriptive variable names. 

--prefix t is replaced by time

--Acc is replaced by Accelerometer

--Gyro is replaced by Gyroscope

--prefix f is replaced by frequency

--Mag is replaced by Magnitude

--BodyBody is replaced by Body

5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

--calculate the average of each variable by activity and subject using aggregate function

--create tidydata.txt file using write.table function
