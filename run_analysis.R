run_analysis <- function() {

  #1. Merges the training and the test sets to create one data set.
  
  #read training and test data from file
  trainingX <- read.table("./train/X_train.txt", header = FALSE, colClass = "character")
  trainingY <- read.table("./train/y_train.txt", header = FALSE, colClass = "character")
  sTrain <- read.table("./train/subject_train.txt", header = FALSE, colClass = "character")
  testX <- read.table("./test/X_test.txt", header = FALSE, colClass = "character")
  testY <- read.table("./test/y_test.txt", header = FALSE, colClass = "character")
  sTest <- read.table("./test/subject_test.txt", header = FALSE, colClass = "character")
  
  #merge all training related data
  training <- cbind(sTrain, trainingX, trainingY)
  
  #merge all testing related data
  test <- cbind(sTest, testX, testY)
  
  #merge testing and training data
  mg <- rbind(training, test)
  
  #apply feature names from file to table heading names while 
  #retaining subject identifier and results
  features <- read.table("./features.txt", header = FALSE, colClass = "character")
  headings <- c("subject", features[,2], "resultY")
  names(mg) <- headings
  
#2. Extracts only the measurements on the mean and standard 
#deviation for each measurement.
  
  #create a boolean vector of all feature headings containing 'mean' 
  #and 'std' without discarding 'subject' and 'resultY' columns
  booVect <- grepl("(mean|std|subject|resultY)", headings, ignore.case = TRUE)
  
  #create new table with only these columns
  mg2 <- mg[,booVect]

  #3. Uses descriptive activity names to name the activities 
  #in the data set
  
  #read activity names from file
  activities <- read.table("/Users/drewt/documents/DataSci/3.CleaningData/UCI HAR Dataset/activity_labels.txt", header = FALSE, colClass = "character")
  
  #rename column headings to be consistent with other tables
  names(activities) <- c("resultY", "activity")

  #4. Appropriately labels the data set with descriptive 
  # variable names.
  
  #merge the activity names with data table
  mg3 <- merge(x = mg2, y = activities, by = c("resultY", "resultY"))
  
  #5. From the data set in step 4, creates a second, independent 
  #tidy data set with the average of each variable for each activity
  #and each subject.
  
  #calculate mean based on subject id and activity name using aggregate
  mg4 <- aggregate(mg3[, 2:87], by = list(subject = mg3$subject, result = mg3$activity), mean)
  
  #write table to file
  write.table(mg4, file = "./hm5.txt" , row.names = FALSE)
  
}
