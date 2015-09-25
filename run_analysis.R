## download file from URL

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

## downloaded file in "UCI HAR Dataset" directory
if (!file.exists("UCI HAR Dataset")) {
	download.file(fileUrl, dest="dataset.zip", mode="wb") 
	unzip ("dataset.zip")
	}

## read 3 tables from test folder
setwd("./UCI HAR Dataset/test")
subject_test <- read.table("subject_test.txt")
label_test <- read.table("y_test.txt")
test <- read.table("X_test.txt")

## bind subject, label, and testdata into one file
testbind <- cbind(subject_test, label_test, test)

## get column name from features.txt
setwd("..")
feature <- read.table("features.txt")
avector <- as.character(feature[,2])
name <- c("Subject", "ActivityLabel", avector)


## add column name to test file 
colnames(testbind) <- name
testbind["Group"] <- NA 
testbind$Group <- "Test"

setwd("..")

## read 3 tables from train folder
setwd("./UCI HAR Dataset/train")
subject_train <- read.table("subject_train.txt")
label_train <- read.table("y_train.txt")
train <- read.table("X_train.txt")

## bind subject, label, and testdata into one file
trainbind <- cbind(subject_train, label_train, train)

## add column name to train file 
colnames(trainbind) <- name
trainbind["Group"] <- NA 
trainbind$Group <- "Train"

setwd("..")

## bind test data with train data
total <- rbind(testbind, trainbind)

# Extract only the measurements on the mean and standard deviation for each measurement. 
colname <- colnames(total)
mean_std <- grepl("mean\\>|std", colname) 
mean_std[1] <- TRUE
mean_std[2] <- TRUE
mean_std[length(mean_std)] <- TRUE

extract <- total[, mean_std]

setwd("..")

## 3.Uses descriptive activity names to name the activities in the data set
activity_values <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

extract$Activity <- activity_values[extract$ActivityLabel]

## reorder the column in extract
## Appropriately labels the data set with descriptive variable names. 
extract_mean_std <- extract[, c(1, ncol(extract), 3:(ncol(extract)-2))]

names(extract_mean_std)<-gsub("^t", "time", names(extract_mean_std))
names(extract_mean_std)<-gsub("^f", "frequency", names(extract_mean_std))
names(extract_mean_std)<-gsub("Acc", "Accelerometer", names(extract_mean_std))
names(extract_mean_std)<-gsub("Gyro", "Gyroscope", names(extract_mean_std))
names(extract_mean_std)<-gsub("Mag", "Magnitude", names(extract_mean_std))
names(extract_mean_std)<-gsub("BodyBody", "Body", names(extract_mean_std))


## From the data set in step 4, creates a second, independent tidy data set 
## with the average of ea4 library(reshape2) ch variable for each activity and each subject.

library(plyr)
new_data <-aggregate(. ~Subject + Activity, extract_mean_std, mean)
new_data <-new_data[order(new_data$Subject, new_data$Activity),]
write.table(new_data, file = "tidydata.txt",row.name=FALSE)