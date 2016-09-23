==================================================================
Human Activity Recognition Using Smartphones Dataset
==================================================================

This is an exercise for a Coursera course, Getting and Cleaning Data. The data itself was provided by the course instructors through the UCI machine learning online data library. 

The original data set has been "tidied" according to the following instructions:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The file run_Analysis.R accomplishes this task by merging the training and testing data using cbind and rbind. The columns in the data set containing the "mean" or "std" are extracted by subsetting the data frame via regex and grepl. The averages of all mean and std data is then calculated for each subject and each activity type using aggregate. 

