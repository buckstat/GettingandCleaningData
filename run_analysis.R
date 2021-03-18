#  Ted Buckless   Getting and Cleaning Data Project
# Step1: load the necessary packages to run script

library(data.table)
library(dplyr)
library(reshape2)

# Step 2: create link to cellphone data, download it
# and unzip it


path <- getwd()
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, file.path(path, "dataFiles.zip"))
unzip(zipfile = "dataFiles.zip")

# create a data data table with the activity Names Standing, Sitting , etc ...
# create a data table with the variables names , tBodyaccmean, etc  .....

activityNames <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")


# Read in data for the test subjects and combine it
# into one file


subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
testCombined  <- cbind(subject_test, y_test, X_test)


# Read in the data for the training  subjects and combine it
# into one file


subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainCombined <- cbind(subject_train, y_train, X_train)

# Combine the data from the test and training subjects into one file
# then assign the variable names from the features file to the columns

allData <- rbind(testCombined, trainCombined)
colnames(allData) <- c("subjectId", "activity", features[,2])

# grab the data from the mean and std columns and store it in variable fd (finished data)
# also grab the categorical columns subjectId and Activity
# Replace the code values 1-6 in the activity column with the appropriate
# values,  Laying, Sitting, Standing, ...

fd <- select(allData,matches("mean\\(\\)|std|subjectId|activity"))
fd[, 2] <- activityNames[fd[,2], 2]

# Clean up the Column names, and make the more readable
# remove the (), - , capitalize Mean and Std, fix the typo BodyBody

colnames(fd) <- gsub('[()]', '', colnames(fd))
colnames(fd) <- gsub('[-]', '', colnames(fd))
colnames(fd) <- gsub('mean', 'Mean', colnames(fd))
colnames(fd) <- gsub('std', 'Std', colnames(fd))
colnames(fd) <- gsub('BodyBody', 'Body', colnames(fd))

# Reshape the data, grouping by the subjectId and activity variables
# Compute the means for the grouped data, tidy up the data

meltdata <- melt(fd, id = c('subjectId', 'activity'))
computeMean <- dcast(meltdata, subjectId + activity ~ variable, mean)

# Write the tidy data to a file

write.table(computeMean, "TidyData.txt", row.names = FALSE, quote = FALSE)

