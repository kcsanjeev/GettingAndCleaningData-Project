# Overview

All the variables, the data, and any transformations or work performed to clean up the data are described in step by step manner. 


# Data Set for the project
The data set for the project was taken from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

(This information is taken from features_info.txt file inside the downloaded data set)

# Step 0: Download files, unzip and load training and test files
<b>Variables </b>
<ol>
<li>rootDir - holds relative path to data directory</li>
<li>datasetFullPath - holds relative path to Dataset.Zip file</li>
<li>subRootDir - holds relative path to 'UCI HAR Dataset' directory</li>
<li>xTraining - dataframe to hold data from X_train.txt</li> 
<li>yTraining - dataframe to hold data from y_train.txt</li> 
<li>subjectTraining - dataframe to hold data from subject_train.txt</li> 
<li>xTest - dataframe to hold data from x_test.txt</li> 
<li>yTest - dataframe to hold data from y_test.txt</li> 
<li>subjectTest - dataframe to hold data from subject_test.txt</li> 

</ol>

# Step 1: Download files, unzip and load training and test files
<b>Variables </b>
<ol>
<li>trainingData - holds data from column binding xTraining,yTraining, subjectTraining </li>
<li>testData - holds data from column binding xTest,yTest, subjectTest </li>
<li>mergedData - holds data from row binding trainingData and testData</li>
</ol>

# Step 2: Extract only the measurements on the mean and standard deviation for each measurement 
<b>Variables </b>
<ol>
<li>features - holds features loaded from features.txt  </li>
<li>meanAndStdFilter - filter to extract only the measurements on the mean and standard deviation for each measurement  </li>
<li>meanAndStdFilteredData - holds filtered data obtained by using meanAndStdFilter on mergedData</li>
</ol>
The features were applied as names for the mergedData dataframe.

# Step 3: Uses descriptive activity names to name the activities in the data set  
<b>Variables </b>
<ol>
<li>activityLabels - holds activity labels from activity_labels.txt</li>
</ol>
The activity labels were applied to activity in the mean and std filtered dataset

# Step 4: Appropriately labels the data set with descriptive variable names
Used gsub function for this purpose which does pattern replacement. The following substitutions were done:
<ol>
<li> "^t" with "TimeDomain-"</li>
<li>"^f" with "FrequencyDomain-"</li>
<li>"Acc" with"Accelerometer"</li>
<li>"Gyro" with "Gyroscope"</li>
<li>"Mag" with "Magnitude"</li>
<li>"mean ()" with "Mean"</li>
<li>'std ()" with "Standard Deviation"</li>
<li>"Freq ()" with "Frequency"</li>
<li>"BodyBody" with "Body"</li>
</ol>

# Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
<b>Variables </b>
<ol>
<li>averageByActivityAndSubject - holds the tidy data set obtained by applyihg average of each variable for each activity and each subject. </li>
</ol>
The tidy data set is written to tidyDat.csv file.
