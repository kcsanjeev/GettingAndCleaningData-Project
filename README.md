# Getting And Cleaning Data Course Project

# Project Overview
The purpose of this project is to demonstrate our ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The full description for the project can be found at: https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project

# Overview of run_analysis.R script file

The script file run_analysis.R does the following in seqential order:

<ol>
<li> Creates data folder if already not present in the current directory.
<li> Downloads the<a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"> data file </a> for this project if not present inside data folder(Created in step 1)
<li> Unzips the dataset into the data folder.
<li> Loads training and test sets into variables.
<li> Merges the training and the test sets to create one data set namely mergedData.
<li> Loads feature.txt into features dataframe and adds two rows manually for Activity and Subject column in the dataframe.
<li> Changes the names of the merged data set using features dataframe</li>
<li> Creates filter to extract only the measurements on the mean and standard deviation for each measurement along with Activity and Subject column from merged data set && extracts the data in new dataframe namely meanAndStdFilteredData .
<li> Loads activity_labels.txt into activityLabels and applies to Activity column in meanAndStdFilteredData dataframe.
<li> Appropriately labels the data set with descriptive variable names.
<li> Finally  creates an independent tidy data set with the average of each variable for each activity and each subject. The final result is shown in tidyData.csv file</li>
</ol>

Note: Uses plyr library for average calculation
