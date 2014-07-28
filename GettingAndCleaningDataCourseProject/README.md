This repository contains R code that downloads and does some preprocessing on Human
Activity Recognition data set. The full description and the data can be found
[here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

See `CodeBook.md` for details.

How to run this program in R console:
* source('~/datasciencecoursera/GettingAndCleaningDataCourseProject/run_analysis.R'); //Please modify this as per your folder structure.
* cleanData();

Logic:
* Download the zipped file from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* Download, save and unzip the downloaded zip file in data folder. The folder is created if it is not present
* Merge training and test datasets
* Extract only the measurements of the mean and standard deviation for each measurement
* Use descriptive activity names to name the activities in the dataset
* Use descriptive column name for subjects
* Combine mean-std values (x), activities (y) and subjects into one data frame
* Given X values, y values and subjects, create an independent tidy dataset with the average of each variable for each activity and each subject. This is done using "ddply" function in "plyr" library.
* Write tidy dataset as csv. The output file name is "UCI_HAR_tidy.csv".
