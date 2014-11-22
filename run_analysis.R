# I am assuming that the data is downloaded and unzipped

# 1. Merges the training and the test sets to create one data set.

# get the list of variable names from features.txt
vars <- read.table(file = "UCI HAR Dataset/features.txt", sep = " ", stringsAsFactors = FALSE)

# training data is to be read from 3 different files
trainingDF1 <- read.table(file = "UCI HAR Dataset/train/subject_train.txt", sep = "", stringsAsFactors = FALSE, col.names = "id")
trainingDF2 <- read.table(file = "UCI HAR Dataset/train/y_train.txt", sep = "", stringsAsFactors = FALSE, col.names = "activity")
trainingDF3 <- read.table(file = "UCI HAR Dataset/train/X_train.txt", sep = "", stringsAsFactors = FALSE, col.names = vars$V2)

trainingDF <- cbind(trainingDF1, trainingDF2, trainingDF3)

# training data is to be read from 3 different files
testDF1 <- read.table(file = "UCI HAR Dataset/test/subject_test.txt", sep = "", stringsAsFactors = FALSE, col.names = "id")
testDF2 <- read.table(file = "UCI HAR Dataset/test/y_test.txt", sep = "", stringsAsFactors = FALSE, col.names = "activity")
testDF3 <- read.table(file = "UCI HAR Dataset/test/X_test.txt", sep = "", stringsAsFactors = FALSE, col.names = vars$V2)

testDF <- cbind(testDF1, testDF2, testDF3)

# row binding both DF's and arranging on id
dataObs <- arrange(rbind(trainingDF, testDF), id)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
dataObsSubsetMeanStd <- dataObs[,c(1,2,grep("std", colnames(dataObs)), grep("mean", colnames(dataObs)))]

# 3. Uses descriptive activity names to name the activities in the data set
# reading activity labels from the file. ZIt contains activity id and activity label
actvtyLabels <- read.table(file = "UCI HAR Dataset/activity_labels.txt", sep = " ", stringsAsFactors = FALSE)

# 4. Appropriately labels the data set with descriptive variable names.
# from the data subset, factor the activity and convert the id to labels
dataObsSubsetMeanStd$activity <- factor(dataObsSubsetMeanStd$activity, 
                                        levels=actvtyLabels$V1, labels=actvtyLabels$V2)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject
library(plyr)
actvtyAvgData <- ddply(dataObsSubsetMeanStd, .(id, activity), 
                       .fun=function(x){ colMeans(x[,-c(1:2)]) })

# labeling the columns as _average, except id, activity columns
colnames(actvtyAvgData)[-c(1:2)] <- paste(colnames(actvtyAvgData)[-c(1:2)], "_average", sep="")

# writing the tidy data (as both csv and txt)
write.csv(actvtyAvgData, file = "Tidy_data.csv", row.names = FALSE)
write.table(actvtyAvgData, file = "Tidy_data.txt", row.names = FALSE)