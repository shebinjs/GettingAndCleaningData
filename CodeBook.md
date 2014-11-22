# Code book

## Tidying up data

Description of the run_analysis.R process

1. Basic assumption for this program is that the required data set is downloaded, unzipped and kept in the working directory
    * Folder structure of the data set is as follows:
        * Data set root folder `UCI HAR Dataset`
        * Root folder contains `train` and `test` folders containing the training and testing data
* Reads the variable names from `features.txt`
* Reads and appends training data set from `X_train.txt`, `y_train.txt`, `subject_train.txt`
    * `subject_train` contains the ids
    * `y_train` contains the activity labels
    * `X_train` contains the data using the feature data set as columns
* Reads and appends test data set from `X_test.txt`, `y_test.txt`, `subject_test.txt`
    * `subject_test` contains the ids
    * `y_test` contains the activity labels
    * `X_test` contains the data using the feature data set as columns
* Appends both training and test data set to form the analysis data set
* Re-arranges analysis data set based on id
* Takes a subset of analysis data set which are mean and standard deviation measurements
* Reads activity labels from `activity_labels.txt`
* Changes the activity column of subset to use the activity labels
* Loads the plyr package
* Calculates the mean for each measure at an id, activity combination
* Labeled the measure columns as `_average`
* Writes this tidy data set to `Tidy_data.csv` and `Tidy_data.txt`

## Tidy_data.csv / Tidy_data.txt
contains 180 rows and 81 columns

### Columns
* id
* activity
* tBodyAcc.std...X_average
* tBodyAcc.std...Y_average
* tBodyAcc.std...Z_average
* tGravityAcc.std...X_average
* tGravityAcc.std...Y_average
* tGravityAcc.std...Z_average
* tBodyAccJerk.std...X_average
* tBodyAccJerk.std...Y_average
* tBodyAccJerk.std...Z_average
* tBodyGyro.std...X_average
* tBodyGyro.std...Y_average
* tBodyGyro.std...Z_average
* tBodyGyroJerk.std...X_average
* tBodyGyroJerk.std...Y_average
* tBodyGyroJerk.std...Z_average
* tBodyAccMag.std.._average
* tGravityAccMag.std.._average
* tBodyAccJerkMag.std.._average
* tBodyGyroMag.std.._average
* tBodyGyroJerkMag.std.._average
* fBodyAcc.std...X_average
* fBodyAcc.std...Y_average
* fBodyAcc.std...Z_average
* fBodyAccJerk.std...X_average
* fBodyAccJerk.std...Y_average
* fBodyAccJerk.std...Z_average
* fBodyGyro.std...X_average
* fBodyGyro.std...Y_average
* fBodyGyro.std...Z_average
* fBodyAccMag.std.._average
* fBodyBodyAccJerkMag.std.._average
* fBodyBodyGyroMag.std.._average
* fBodyBodyGyroJerkMag.std.._average
* tBodyAcc.mean...X_average
* tBodyAcc.mean...Y_average
* tBodyAcc.mean...Z_average
* tGravityAcc.mean...X_average
* tGravityAcc.mean...Y_average
* tGravityAcc.mean...Z_average
* tBodyAccJerk.mean...X_average
* tBodyAccJerk.mean...Y_average
* tBodyAccJerk.mean...Z_average
* tBodyGyro.mean...X_average
* tBodyGyro.mean...Y_average
* tBodyGyro.mean...Z_average
* tBodyGyroJerk.mean...X_average
* tBodyGyroJerk.mean...Y_average
* tBodyGyroJerk.mean...Z_average
* tBodyAccMag.mean.._average
* tGravityAccMag.mean.._average
* tBodyAccJerkMag.mean.._average
* tBodyGyroMag.mean.._average
* tBodyGyroJerkMag.mean.._average
* fBodyAcc.mean...X_average
* fBodyAcc.mean...Y_average
* fBodyAcc.mean...Z_average
* fBodyAcc.meanFreq...X_average
* fBodyAcc.meanFreq...Y_average
* fBodyAcc.meanFreq...Z_average
* fBodyAccJerk.mean...X_average
* fBodyAccJerk.mean...Y_average
* fBodyAccJerk.mean...Z_average
* fBodyAccJerk.meanFreq...X_average
* fBodyAccJerk.meanFreq...Y_average
* fBodyAccJerk.meanFreq...Z_average
* fBodyGyro.mean...X_average
* fBodyGyro.mean...Y_average
* fBodyGyro.mean...Z_average
* fBodyGyro.meanFreq...X_average
* fBodyGyro.meanFreq...Y_average
* fBodyGyro.meanFreq...Z_average
* fBodyAccMag.mean.._average
* fBodyAccMag.meanFreq.._average
* fBodyBodyAccJerkMag.mean.._average
* fBodyBodyAccJerkMag.meanFreq.._average
* fBodyBodyGyroMag.mean.._average
* fBodyBodyGyroMag.meanFreq.._average
* fBodyBodyGyroJerkMag.mean.._average
* fBodyBodyGyroJerkMag.meanFreq.._average