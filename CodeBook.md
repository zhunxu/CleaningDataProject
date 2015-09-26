# Project Description 

This is the course project for Coursera Getteing and Cleaning Data.  The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. 

You will be required to submit: 

1) a tidy data set as described below, 

2) a link to a Github repository with your script for performing the analysis,

3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.   



# Data Source and Description 

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.  A full description is available at the site where the data was obtained:  

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  

Here are the data for the project:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

 

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

# Code book
  
  name: Subject                                       : subject ID
  
  name: Activity                                      : activity being measured
  
  name: timeBodyAccelerometer-mean()-X                : 
  
  name: timeBodyAccelerometer-mean()-Y                : 
  
  name: timeBodyAccelerometer-mean()-Z                : 
  
  name: timeBodyAccelerometer-std()-X                 : 
  
  name: timeBodyAccelerometer-std()-Y                 : 
  
  name: timeBodyAccelerometer-std()-Z                 : 
  
  name: timeGravityAccelerometer-mean()-X             : 
  
  name: timeGravityAccelerometer-mean()-Y             : 
  
  name: timeGravityAccelerometer-mean()-Z             : 
  
  name: timeGravityAccelerometer-std()-X              : 
  
  name: timeGravityAccelerometer-std()-Y              : 
  
  name: timeGravityAccelerometer-std()-Z              : 
  
  name: timeBodyAccelerometerJerk-mean()-X            : 
  
  name: timeBodyAccelerometerJerk-mean()-Y            : 
  
  name: timeBodyAccelerometerJerk-mean()-Z            : 
  
  name: timeBodyAccelerometerJerk-std()-X             : 
  
  name: timeBodyAccelerometerJerk-std()-Y             : 
  
  name: timeBodyAccelerometerJerk-std()-Z             : 
  
  name: timeBodyGyroscope-mean()-X                    : 
  
  name: timeBodyGyroscope-mean()-Y                    : 
  
  name: timeBodyGyroscope-mean()-Z                    :
  
  name: timeBodyGyroscope-std()-X                     : 
  
  name: timeBodyGyroscope-std()-Y                     : 
  
  name: timeBodyGyroscope-std()-Z                     : 
  
  name: timeBodyGyroscopeJerk-mean()-X                : 
  
  name: timeBodyGyroscopeJerk-mean()-Y                : 
  
  name: timeBodyGyroscopeJerk-mean()-Z                : 
  
  name: timeBodyGyroscopeJerk-std()-X                 : 
  
  name: timeBodyGyroscopeJerk-std()-Y                 :
  
  name: timeBodyGyroscopeJerk-std()-Z                 :
  
  name: timeBodyAccelerometerMagnitude-mean()         : 
  
  name: timeBodyAccelerometerMagnitude-std()          : 
  
  name: timeGravityAccelerometerMagnitude-mean()      : 
  
  name: timeGravityAccelerometerMagnitude-std()       : 
  
  name: timeBodyAccelerometerJerkMagnitude-mean()     : 
  
  name: timeBodyAccelerometerJerkMagnitude-std()      : 
  
  name: timeBodyGyroscopeMagnitude-mean()             : 
  
  name: timeBodyGyroscopeMagnitude-std()              : 
  
  name: timeBodyGyroscopeJerkMagnitude-mean()         : 
  
  name: timeBodyGyroscopeJerkMagnitude-std()          : 
  
  name: frequencyBodyAccelerometer-mean()-X           : 
  
  name: frequencyBodyAccelerometer-mean()-Y           : 
  
  name: frequencyBodyAccelerometer-mean()-Z           :
  
  name: frequencyBodyAccelerometer-std()-X            : 
  
  name: frequencyBodyAccelerometer-std()-Y            : 
  
  name: frequencyBodyAccelerometer-std()-Z            : 
  
  name: frequencyBodyAccelerometerJerk-mean()-X       : 
  
  name: frequencyBodyAccelerometerJerk-mean()-Y       : 
  
  name: frequencyBodyAccelerometerJerk-mean()-Z       : 
  
  name: frequencyBodyAccelerometerJerk-std()-X        : 
  
  name: frequencyBodyAccelerometerJerk-std()-Y        : 
  
  name: frequencyBodyAccelerometerJerk-std()-Z        : 
  
  name: frequencyBodyGyroscope-mean()-X               : 
  
  name: frequencyBodyGyroscope-mean()-Y               : 
  
  name: frequencyBodyGyroscope-mean()-Z               :
  
  name: frequencyBodyGyroscope-std()-X                : 
  
  name: frequencyBodyGyroscope-std()-Y                :
  
  name: frequencyBodyGyroscope-std()-Z                :
  
  name: frequencyBodyAccelerometerMagnitude-std()     : 
  
  name: frequencyBodyAccelerometerJerkMagnitude-mean(): 
  
  name: frequencyBodyAccelerometerJerkMagnitude-std() : 
  
  name: frequencyBodyGyroscopeMagnitude-mean()        : 
  
  name: frequencyBodyGyroscopeMagnitude-std()         : 
  
  name: frequencyBodyGyroscopeJerkMagnitude-mean()    : 
  
  name: frequencyBodyGyroscopeJerkMagnitude-std() 


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals timeAccelerometer-XYZ and timeGyroscope-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAccelerometer-XYZ and timeGravityAccelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccelerometerJerk-XYZ and timeBodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccelerometerMagnitude, timeGravityAccelerometerMagnitude, timeBodyAccelerometerJerkMagnitude, timeBodyGyroscopeMagnitude, timeBodyGyroscopeJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequencyBodyAccelerometer-XYZ, frequencyBodyAccelerometerJerk-XYZ, frequencyBodyGyroscope-XYZ, frequencyBodyAccelerometerJerkMagnitude, frequencyBodyGyroscopeMagnitude, frequencyBodyGyroscopeJerkMagnitude. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are: 

mean(): Mean value

std(): Standard deviation
