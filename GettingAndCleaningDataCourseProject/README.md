This repository contains R code that downloads and does some preprocessing on Human
Activity Recognition data set. The full description and the data can be found
[here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

See `CodeBook.md` for details.

How to run this program in R console:
1. source('~/datasciencecoursera/GettingAndCleaningDataCourseProject/run_analysis.R'); //Please modify this as per your folder structure.
2. cleanData();

Logic:
1. Download the zipped file from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Download, save and unzip the downloaded zip file in data folder. The folder is created if it is not present
3. Merge training and test datasets
4. Extract only the measurements of the mean and standard deviation for each measurement
5. Use descriptive activity names to name the activities in the dataset
6. Use descriptive column name for subjects
7. Combine mean-std values (x), activities (y) and subjects into one data frame
8. Given X values, y values and subjects, create an independent tidy dataset with the average of each variable for each activity and each subject. This is done using "ddply" function in "plyr" library.
9. Write tidy dataset as csv. The output file name is "UCI_HAR_tidy.csv".
