
### Original data:

- [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
- [description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


### Data Transformation Steps

Following data transformations are carried out by the `run_analysis.R` script.

1. For each of the training and test datasets, 
    1. Read the `X` values
    2. Take a subset of the columns representing only the mean and standard deviation values. Subsetting is done early on to conserve memory.
    3. Associate additional columns to represent activity IDs and subject IDs read from `y_<dataset>.txt` and `subject_<dataset>.txt` files respectively.
    4. Assign column names by manipulating the measurement names in `features.txt` to remove spaces and convert them to camel case.
2. Merge the training and the test sets, read as in step 1 to create one data set.
3. Associate an additional column with descriptive activity names as specified in `activity_labels.txt`.
4. Melt the dataset by specifying activity ID, name and subject ID as the only ID variables.
5. Re cast the melted dataset with activity name and subject id as the only IDs and `mean` as the aggregator function.
6. Save the result in re-casted dataset as `tidy.txt`


### Variable Descriptions

The data for this data set was derived from sources mentioned in the "Original data" section of this document. Part of the description below has been taken from the original data description.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are:
- mean: Mean value
- std: Standard deviation

## ID Fields

* `subject` - The participant ("subject") ID
* `activity` - The label of the activity performed when the corresponding measurements were taken

## Extracted Feature Fields

* `tBodyAcc-mean()-X` (column `1`)
* `tBodyAcc-mean()-Y` (column `2`)
* `tBodyAcc-mean()-Z` (column `3`)
* `tBodyAcc-std()-X` (column `4`)
* `tBodyAcc-std()-Y` (column `5`)
* `tBodyAcc-std()-Z` (column `6`)
* `tGravityAcc-mean()-X` (column `41`)
* `tGravityAcc-mean()-Y` (column `42`)
* `tGravityAcc-mean()-Z` (column `43`)
* `tGravityAcc-std()-X` (column `44`)
* `tGravityAcc-std()-Y` (column `45`)
* `tGravityAcc-std()-Z` (column `46`)
* `tBodyAccJerk-mean()-X` (column `81`)
* `tBodyAccJerk-mean()-Y` (column `82`)
* `tBodyAccJerk-mean()-Z` (column `83`)
* `tBodyAccJerk-std()-X` (column `84`)
* `tBodyAccJerk-std()-Y` (column `85`)
* `tBodyAccJerk-std()-Z` (column `86`)
* `tBodyGyro-mean()-X` (column `121`)
* `tBodyGyro-mean()-Y` (column `122`)
* `tBodyGyro-mean()-Z` (column `123`)
* `tBodyGyro-std()-X` (column `124`)
* `tBodyGyro-std()-Y` (column `125`)
* `tBodyGyro-std()-Z` (column `126`)
* `tBodyGyroJerk-mean()-X` (column `161`)
* `tBodyGyroJerk-mean()-Y` (column `162`)
* `tBodyGyroJerk-mean()-Z` (column `163`)
* `tBodyGyroJerk-std()-X` (column `164`)
* `tBodyGyroJerk-std()-Y` (column `165`)
* `tBodyGyroJerk-std()-Z` (column `166`)
* `tBodyAccMag-mean()` (column `201`)
* `tBodyAccMag-std()` (column `202`)
* `tGravityAccMag-mean()` (column `214`)
* `tGravityAccMag-std()` (column `215`)
* `tBodyAccJerkMag-mean()` (column `227`)
* `tBodyAccJerkMag-std()` (column `228`)
* `tBodyGyroMag-mean()` (column `240`)
* `tBodyGyroMag-std()` (column `241`)
* `tBodyGyroJerkMag-mean()` (column `253`)
* `tBodyGyroJerkMag-std()` (column `254`)
* `fBodyAcc-mean()-X` (column `266`)
* `fBodyAcc-mean()-Y` (column `267`)
* `fBodyAcc-mean()-Z` (column `268`)
* `fBodyAcc-std()-X` (column `269`)
* `fBodyAcc-std()-Y` (column `270`)
* `fBodyAcc-std()-Z` (column `271`)
* `fBodyAccJerk-mean()-X` (column `345`)
* `fBodyAccJerk-mean()-Y` (column `346`)
* `fBodyAccJerk-mean()-Z` (column `347`)
* `fBodyAccJerk-std()-X` (column `348`)
* `fBodyAccJerk-std()-Y` (column `349`)
* `fBodyAccJerk-std()-Z` (column `350`)
* `fBodyGyro-mean()-X` (column `424`)
* `fBodyGyro-mean()-Y` (column `425`)
* `fBodyGyro-mean()-Z` (column `426`)
* `fBodyGyro-std()-X` (column `427`)
* `fBodyGyro-std()-Y` (column `428`)
* `fBodyGyro-std()-Z` (column `429`)
* `fBodyAccMag-mean()` (column `503`)
* `fBodyAccMag-std()` (column `504`)
* `fBodyBodyAccJerkMag-mean()` (column `516`)
* `fBodyBodyAccJerkMag-std()` (column `517`)
* `fBodyBodyGyroMag-mean()` (column `529`)
* `fBodyBodyGyroMag-std()` (column `530`)
* `fBodyBodyGyroJerkMag-mean()` (column `542`)
* `fBodyBodyGyroJerkMag-std()` (column `543`)

## Activity Labels

* `WALKING` (value `1`)
* `WALKING_UPSTAIRS` (value `2`)
* `WALKING_DOWNSTAIRS` (value `3`)
* `SITTING` (value `4`)
* `STANDING` (value `5`)
* `LAYING` (value `6`)

## Extracted Features Vector

```R
c(1, 2, 3, 4, 5, 6, 41, 42, 43, 44, 45, 46, 81, 82, 83, 84, 85, 86, 121, 122, 123, 124, 125, 126, 161, 162, 163, 164, 165, 166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 266, 267, 268, 269, 270, 271, 345, 346, 347, 348, 349, 350, 424, 425, 426, 427, 428, 429, 503, 504, 516, 517, 529, 530, 542, 543)
```

## Extracted Feature Names Vector

```R
c("tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z", "tBodyAcc-std()-X", "tBodyAcc-std()-Y", "tBodyAcc-std()-Z", "tGravityAcc-mean()-X", "tGravityAcc-mean()-Y", "tGravityAcc-mean()-Z", "tGravityAcc-std()-X", "tGravityAcc-std()-Y", "tGravityAcc-std()-Z", "tBodyAccJerk-mean()-X", "tBodyAccJerk-mean()-Y", "tBodyAccJerk-mean()-Z", "tBodyAccJerk-std()-X", "tBodyAccJerk-std()-Y", "tBodyAccJerk-std()-Z", "tBodyGyro-mean()-X", "tBodyGyro-mean()-Y", "tBodyGyro-mean()-Z", "tBodyGyro-std()-X", "tBodyGyro-std()-Y", "tBodyGyro-std()-Z", "tBodyGyroJerk-mean()-X", "tBodyGyroJerk-mean()-Y", "tBodyGyroJerk-mean()-Z", "tBodyGyroJerk-std()-X", "tBodyGyroJerk-std()-Y", "tBodyGyroJerk-std()-Z", "tBodyAccMag-mean()", "tBodyAccMag-std()", "tGravityAccMag-mean()", "tGravityAccMag-std()", "tBodyAccJerkMag-mean()", "tBodyAccJerkMag-std()", "tBodyGyroMag-mean()", "tBodyGyroMag-std()", "tBodyGyroJerkMag-mean()", "tBodyGyroJerkMag-std()", "fBodyAcc-mean()-X", "fBodyAcc-mean()-Y", "fBodyAcc-mean()-Z", "fBodyAcc-std()-X", "fBodyAcc-std()-Y", "fBodyAcc-std()-Z", "fBodyAccJerk-mean()-X", "fBodyAccJerk-mean()-Y", "fBodyAccJerk-mean()-Z", "fBodyAccJerk-std()-X", "fBodyAccJerk-std()-Y", "fBodyAccJerk-std()-Z", "fBodyGyro-mean()-X", "fBodyGyro-mean()-Y", "fBodyGyro-mean()-Z", "fBodyGyro-std()-X", "fBodyGyro-std()-Y", "fBodyGyro-std()-Z", "fBodyAccMag-mean()", "fBodyAccMag-std()", "fBodyBodyAccJerkMag-mean()", "fBodyBodyAccJerkMag-std()", "fBodyBodyGyroMag-mean()", "fBodyBodyGyroMag-std()", "fBodyBodyGyroJerkMag-mean()", "fBodyBodyGyroJerkMag-std()")
```

## Activities Vector

```R
c(1, 2, 3, 4, 5, 6)
```

## Activity Names Vector

```R
c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
```

