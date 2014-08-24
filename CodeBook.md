Process Description:
===================

Using the downloaded project data as described in the project data files, the following steps were taken to create the data sets:

    1) Download project data file and save to local R workspace

    2) Read test and training files that contain data collected from activities performed by subjects

    3) Read test and training files that indicate the specific activity being performed by subject 

    4) Read test and training subject identifier (ID) that performed the activitiy recorded in data file

    5) Read file that can be used to translate activity ID to its corresponding descriptive label

    6) Bind test and training subject IDs, activity performed for to each data row collected from their activities 
       respective data files, then bind rows of each dataset into a combined dataset (combine data sets from steps 2 thru 5)

    7) Read file containing descriptive variable names for data collected during subject activities

    8) Rename columns in the combined data set (created in step 6) using descriptive labels read in step 7                     

    9) Identify column index for measurements on the mean and standard deviation; Also keep the first two columns becase 
       these identify the subject ID and activity respectively; finally, sort the index results                   

    10) Keep only the columns identified in step 9 from the combined results created in step 6                         

    11) Clean up final results by ordering rows by Subject ID and Activity 
                                                  
    12) Write the first tiday data set to output file "tidy_data.txt"

    13) Generate column mean for each selected measure by Subject ID and Activity

    14) Write aggregated column mean results to a second output file "tidy_data2.txt"
 
Project contains two tidy data set files:  
=========================================

     1) tidy_data.txt - 
            This file contains the combined training and test data set with only the mean and standard deviation measurement 
            column extracted for each of the 30 subjects by each activities performed (6 activities).  Each row within this data set 
            represents data collected during one time slice while the subject was performing a specific activity.  

     2) tidy_data2.txt - 
            This file contains the average of each mean and standard deviation variable from the tidy data set created in the first tidy 
            data set described above.  This data is aggregate by subject and activity so the average represents the column
            mean across all time slices collected during the activity.  

Data Dictionary 
=================

Both files contain the following variables:

     subject_ID - unique identifier representing the subject (volunteer) performing the activity
   
     activity - a descriptive label indicating the activity being performed by the subject during which the data was collected
   
     The following list is the subset of columns (86) that represent the mean and standard deviation measures extracted 
     from the original project data file (any column name that contained the string "mean" or "std" was assumed to represent
     a valid measure to be saved in the tidy data sets):

     tBodyAcc-mean()-X 
     tBodyAcc-mean()-Y 
     tBodyAcc-mean()-Z 
     tBodyAcc-std()-X  
     tBodyAcc-std()-Y  
     tBodyAcc-std()-Z  
     tGravityAcc-mean()-X 
     tGravityAcc-mean()-Y 
     tGravityAcc-mean()-Z 
     tGravityAcc-std()-X  
     tGravityAcc-std()-Y  
     tGravityAcc-std()-Z  
     tBodyAccJerk-mean()-X   
     tBodyAccJerk-mean()-Y   
     tBodyAccJerk-mean()-Z   
     tBodyAccJerk-std()-X 
     tBodyAccJerk-std()-Y 
     tBodyAccJerk-std()-Z 
     tBodyGyro-mean()-X   
     tBodyGyro-mean()-Y   
     tBodyGyro-mean()-Z   
     tBodyGyro-std()-X 
     tBodyGyro-std()-Y 
     tBodyGyro-std()-Z 
     tBodyGyroJerk-mean()-X  
     tBodyGyroJerk-mean()-Y  
     tBodyGyroJerk-mean()-Z  
     tBodyGyroJerk-std()-X   
     tBodyGyroJerk-std()-Y   
     tBodyGyroJerk-std()-Z   
     tBodyAccMag-mean()   
     tBodyAccMag-std() 
     tGravityAccMag-mean()   
     tGravityAccMag-std() 
     tBodyAccJerkMag-mean()  
     tBodyAccJerkMag-std()   
     tBodyGyroMag-mean()  
     tBodyGyroMag-std()   
     tBodyGyroJerkMag-mean() 
     tBodyGyroJerkMag-std()  
     fBodyAcc-mean()-X 
     fBodyAcc-mean()-Y 
     fBodyAcc-mean()-Z 
     fBodyAcc-std()-X  
     fBodyAcc-std()-Y  
     fBodyAcc-std()-Z  
     fBodyAcc-meanFreq()-X   
     fBodyAcc-meanFreq()-Y   
     fBodyAcc-meanFreq()-Z   
     fBodyAccJerk-mean()-X   
     fBodyAccJerk-mean()-Y   
     fBodyAccJerk-mean()-Z   
     fBodyAccJerk-std()-X 
     fBodyAccJerk-std()-Y 
     fBodyAccJerk-std()-Z 
     fBodyAccJerk-meanFreq()-X  
     fBodyAccJerk-meanFreq()-Y  
     fBodyAccJerk-meanFreq()-Z  
     fBodyGyro-mean()-X   
     fBodyGyro-mean()-Y   
     fBodyGyro-mean()-Z   
     fBodyGyro-std()-X 
     fBodyGyro-std()-Y 
     fBodyGyro-std()-Z 
     fBodyGyro-meanFreq()-X  
     fBodyGyro-meanFreq()-Y  
     fBodyGyro-meanFreq()-Z  
     fBodyAccMag-mean()   
     fBodyAccMag-std() 
     fBodyAccMag-meanFreq()  
     fBodyBodyAccJerkMag-mean() 
     fBodyBodyAccJerkMag-std()  
     fBodyBodyAccJerkMag-meanFreq()   
     fBodyBodyGyroMag-mean() 
     fBodyBodyGyroMag-std()  
     fBodyBodyGyroMag-meanFreq()   
     fBodyBodyGyroJerkMag-mean()   
     fBodyBodyGyroJerkMag-std() 
     fBodyBodyGyroJerkMag-meanFreq()  
     angle(tBodyAccMean,gravity)   
     angle(tBodyAccJerkMean),gravityMean)
     angle(tBodyGyroMean,gravityMean) 
     angle(tBodyGyroJerkMean,gravityMean)
     angle(X,gravityMean)
