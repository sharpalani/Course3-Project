# Set variable to point to location of project data files
datafile_location <- paste0(getwd(), "/UCI HAR Dataset")

# Set variable to point to location of test group's data (30% of the subjects) 
# within the project data files
testfile_location <- paste0(datafile_location, "/test")

# Set variable to point to location of training group's data (70% of the subjects)
# within the project data files
trainfile_location <- paste0(datafile_location, "/train")

# Read test and training files that hold the data collected from activities 
# performed by subjects (30 participants in all)
testdata <- read.table(paste0(testfile_location, "/X_test.txt" ))
traindata <- read.table(paste0(trainfile_location, "/X_train.txt" ))

# Read test and training files that indicate the specific activity being   
# performed by subject. Each row corresponds to the row of data collected  
# during the activity in the data file. 
testactivity_label <- read.table(paste0(testfile_location, "/y_test.txt" ))
trainactivity_label <- read.table(paste0(trainfile_location, "/y_train.txt" ))

# Read test and training subject identifier (ID) that performed the activitiy 
# recorded in data file. Each row corresponds to the row of data collected 
# during the activity in the data file.
testsubject <- read.table(paste0(testfile_location, "/subject_test.txt" ))
trainsubject <- read.table(paste0(trainfile_location, "/subject_train.txt" ))

# Read the file that can be used to translate the activity ID to its 
# corresponding descriptive label.
activity_label <- read.table(paste0(datafile_location, "/activity_labels.txt" ))

# Bind test and training subject IDs, activity performed for to each data row 
# collected from their activities respective data files, then bind rows of each
# dataset into a combined dataset
#     1) Binding subject ID to data row is performed by the cbind() function
#     2) Row binding each dataset into a combine dataset is performed by rbind()
combined_data <- rbind(
                       cbind(subject_ID = testsubject$V1, 
                             activity = activity_label$V2[testactivity_label[,1]],
                             testdata), 
                       cbind(subject_ID = trainsubject$V1, 
                             activity = activity_label$V2[trainactivity_label[,1]], 
                             traindata)
                      )

# Read file containing descriptive variable names for data collected during 
# subject activities
# datafeatures <- data.frame(read.table(paste0(datafile_location, "/features.txt")))
datafeatures <- read.table(paste0(datafile_location, "/features.txt"))

# Extract descriptive variable name to be used in renaming columns within the 
# combined data frame  
descriptive_var_name <- as.vector(datafeatures[,2])
                      
# Rename columns using descriptive labels                      
names(combined_data) <- c("subject_ID", "activity", descriptive_var_name)                      

# Identify column index for measurements on the mean                  
keep_column_idx <- grep("mean", names(combined_data), ignore.case = TRUE, 
                        perl = FALSE, value = FALSE, fixed = FALSE, 
                        useBytes = FALSE, invert = FALSE)

# Identify column index for measurements on the standard deviation and combine
# with column index for the mean measurements. Also keep the first two columns
# becase these identify the subject ID and activity respectively. Finally,
# sort the index results.                   
keep_column_idx <- sort(c(1, 2, keep_column_idx, 
                        grep("std", names(combined_data), ignore.case = TRUE, 
                        perl = FALSE, value = FALSE, fixed = FALSE, 
                        useBytes = FALSE, invert = FALSE)))                               

# Keep selected columns from combined data results                         
selected_data <- combined_data[keep_column_idx]
                        
# Clean up final results by ordering rows by Subject ID and Activity (first 2 columns)                          
tidy_data <- selected_data[order(selected_data$subject_ID, selected_data$activity),]
                                                
# Write the tiday data set to output file
write.table(tidy_data, file="tidy_data.txt", append=FALSE, 
            quote=FALSE, sep="\t", row.names=FALSE, col.names=TRUE)

# Generate column mean for each selected measure by Subject ID and Activity
tidy_data2 <- aggregate(tidy_data[,3:86], tidy_data[1:2], FUN=mean)

# Write aggregated column mean results to a second output file
write.table(tidy_data2, file="tidy_data2.txt", append=FALSE, 
            quote=FALSE, sep="\t", row.names=FALSE, col.names=TRUE)
