# Getting and Cleaning Data

## Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 
You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps to run this project

1. Download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unpack on your local drive. You will have ```UCI HAR Dataset``` folder with all the files in the required structure.
2. Open ```run_analysis.R``` and set ```UCI HAR Dataset``` folder as your working directory using ```setwd()``` function.
3. Run ```run_analysis.R``` and it will generate a file ```tiny.txt``` in your working directory.

## Dependencies

```run_analysis.R``` depends on ```reshape2``` and ```data.table``` libraries. 

## Code Book

The CodeBook.md file describes steps for transformation, resulting data and variables.
