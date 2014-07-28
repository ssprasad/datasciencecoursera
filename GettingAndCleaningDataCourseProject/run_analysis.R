# This R script gets and performs some cleaning on Human Activity Recognition database 
# built from the recordings of 30 subjects performing activities of daily living (ADL) 
# while carrying a waist-mounted smartphone with embedded inertial sensors.
# The full description of the data set is available at:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

library(plyr)

##Download the data from source. Unzip it in data folder
downloadData = function() {
    "Checks for data directory and creates one if it doesn't exist"
    if (!file.exists("data")) {
        message("Creating data directory")
        dir.create("data")
    }
    if (!file.exists("data/UCI HAR Dataset")) {
        # download the data
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        zipfile="data/UCI_HAR_data.zip"
        message("Downloading data")
        download.file(fileURL, destfile=zipfile, method="curl")
        unzip(zipfile, exdir="data")
    }
}

## Merge training and test datasets
mergeDatasets = function() {
    "Merge training and test datasets"
    # Read data
    message("reading X_train.txt")
    trainingX <- read.table("data/UCI HAR Dataset/train/X_train.txt")
    message("reading y_train.txt")
    trainingY <- read.table("data/UCI HAR Dataset/train/y_train.txt")
    message("reading subject_train.txt")
    trainingSubject <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
    message("reading X_test.txt")
    testX <- read.table("data/UCI HAR Dataset/test/X_test.txt")
    message("reading y_test.txt")
    testY <- read.table("data/UCI HAR Dataset/test/y_test.txt")
    message("reading subject_test.txt")
    testSubject <- read.table("data/UCI HAR Dataset/test/subject_test.txt")
    # Merge
    mergedX <- rbind(trainingX, testX)
    mergedY <- rbind(trainingY, testY)
    mergedSubject <- rbind(trainingSubject, testSubject)
    # merge train and test datasets and return
    list(x=mergedX, y=mergedY, subject=mergedSubject)
}

## Given the dataset (x values), extract only the measurements on the mean
## and standard deviation for each measurement.
extractMeanAndStd = function(df) {
    # Read the feature list file
    features <- read.table("data/UCI HAR Dataset/features.txt")
    # Find the mean and std columns
    meanCol <- sapply(features[,2], function(x) grepl("mean()", x, fixed=T))
    stdCol <- sapply(features[,2], function(x) grepl("std()", x, fixed=T))
    # Extract them from the data
    edf <- df[, (meanCol | stdCol)]
    colnames(edf) <- features[(meanCol | stdCol), 2]
    edf
}

## Use descriptive activity names to name the activities in the dataset
nameActivities = function(df) {
    colnames(df) <- "activity"
    df$activity[df$activity == 1] = "WALKING"
    df$activity[df$activity == 2] = "WALKING_UPSTAIRS"
    df$activity[df$activity == 3] = "WALKING_DOWNSTAIRS"
    df$activity[df$activity == 4] = "SITTING"
    df$activity[df$activity == 5] = "STANDING"
    df$activity[df$activity == 6] = "LAYING"
    df
}

##Function which needs to be called to create the tidy data
cleanData = function() {
    # Download data
    downloadData()
    # merge training and test datasets. merge.datasets function returns a list
    # of three dataframes: X, y, and subject
    merged <- mergeDatasets()
    # Extract only the measurements of the mean and standard deviation for each
    # measurement
    cx <- extractMeanAndStd(merged$x)
    # Name activities
    cy <- nameActivities(merged$y)
    # Use descriptive column name for subjects
    colnames(merged$subject) <- c("subject")
    #Combine mean-std values (x), activities (y) and subjects into one data frame
    combined <- cbind(cx, cy, merged$subject)
    # Given X values, y values and subjects, create an independent tidy dataset
    # with the average of each variable for each activity and each subject.
    tidy <- ddply(combined, .(subject, activity), function(x) colMeans(x[,1:60]))
    # Write tidy dataset as csv
    write.csv(tidy, "UCI_HAR_tidy.csv", row.names=FALSE)
}

