library(plyr)

# Step 0
# Download files, unzip and load training and test files

rootDir <- "./data"
if(!file.exists(rootDir)){
    dir.create(rootDir)
}
datasetFullPath <- paste0(rootDir,"/Dataset.zip")
if(!file.exists(datasetFullPath)){
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile = datasetFullPath)
}

subRootDir <- paste0(rootDir,"/UCI HAR Dataset")
if(!file.exists(subRootDir)){
    unzip(zipfile = datasetFullPath,exdir= rootDir)
}

xTraining <- read.table(paste0(subRootDir,"/train/X_train.txt"))

yTraining <- read.table(paste0(subRootDir,"/train/y_train.txt"))

subjectTraining <- read.table(paste0(subRootDir,"/train/subject_train.txt"))

xTest <- read.table(paste0(subRootDir,"/test/X_test.txt"))

yTest <- read.table(paste0(subRootDir,"/test/y_test.txt"))

subjectTest <- read.table(paste0(subRootDir,"/test/subject_test.txt"))

# Step 1
# Merge training and test sets to create one data set

trainingData <- cbind(xTraining,yTraining,subjectTraining)

testData <- cbind(xTest,yTest,subjectTest)

mergedData <- rbind(trainingData,testData)

# Step 2
# Extract only the measurements on the mean and standard deviation for each measurement

features <- read.table(paste0(subRootDir,"/features.txt"),colClasses = c("character"))

# Add Activity and Subject rows to features as we have added activity and subject to merged dataset
features <- rbind(rbind(features, c(562, "Activity")), c(563, "Subject"))

names(mergedData)<- features$V2

meanAndStdFilter <- grepl("mean|std|Activity|Subject", names(mergedData))

meanAndStdFilteredData <- mergedData[, meanAndStdFilter]

# Step 3
# Uses descriptive activity names to name the activities in the data set

activityLabels <- read.table(paste0(subRootDir,"/activity_labels.txt"))

meanAndStdFilteredData$Activity <- activityLabels[meanAndStdFilteredData$Activity,2]

# Step 4
#Appropriately labels the data set with descriptive variable names

names(meanAndStdFilteredData) <- gsub('^t',"TimeDomain-",names(meanAndStdFilteredData))

names(meanAndStdFilteredData) <- gsub('^f',"FrequencyDomain-",names(meanAndStdFilteredData))

names(meanAndStdFilteredData) <- gsub('Acc',"Accelerometer",names(meanAndStdFilteredData))

names(meanAndStdFilteredData) <- gsub('Gyro',"Gyroscope",names(meanAndStdFilteredData))

names(meanAndStdFilteredData) <- gsub('Mag',"Magnitude",names(meanAndStdFilteredData))

names(meanAndStdFilteredData) <- gsub('mean\\()',"Mean",names(meanAndStdFilteredData))

names(meanAndStdFilteredData) <- gsub('std\\()',"Standard Deviation",names(meanAndStdFilteredData))

names(meanAndStdFilteredData) <- gsub('Freq\\()',"Frequency",names(meanAndStdFilteredData))

names(meanAndStdFilteredData) <- gsub('BodyBody',"Body",names(meanAndStdFilteredData))

# Step 5
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

averageByActivityAndSubject <- ddply(meanAndStdFilteredData, .(Activity,Subject), numcolwise(mean))
write.table(averageByActivityAndSubject, file = paste0(rootDir,"/tidyData.txt"),row.name=FALSE)
