==================================================================
Coursera Data Science Course: Getting and Cleaning Data (Course Project)
Coded and Created by: Sanjeet Harpalani
Date: 8/24/2014
==================================================================

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to 
prepare tidy data that can be used for later analysis. 

Project data files was downloaded from the following location and save to the local R workspace:

   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description of the project data can be found in the following files contained within the downloaded zip file:

   README.txt
   activity_labels.txt
   features.txt
   features_info.txt   

The project repository includes the following files:   
========================================

- 'README.md'

- 'CodeBook.md': contains the data dictionary and work performed to clean up the data

- 'run_analysis.R': contains the script (extraction, transformation and cleansing) to create the two tidy data sets

- 'tidy_data.txt': file contains the combined training and test data set with only the mean and standard deviation measurement 
                   column extracted for each of the 30 subjects by each activities performed (6 activities).  Each row within this data set 
                   represents data collected during one time slice while the subject was performing a specific activity. 

- 'tidy_data2.txt': contains the average of each mean and standard deviation variable from the tidy data set created in the first tidy 
                    data set described above.  This data is aggregate by subject and activity so the average represents the column
                    mean across all time slices collected during the activity.
