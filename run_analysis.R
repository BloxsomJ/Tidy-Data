run_analysis <- function() {
  #load necessary libraries
  library(dplyr)
  
  #load data
  X_train <- read.table("train/X_train.txt")
  Y_train <- read.table("train/y_train.txt")
  S_train <- read.table("train/subject_train.txt")
  
  X_test <- read.table("test/X_test.txt")
  Y_test <- read.table("test/y_test.txt")
  S_test <- read.table("test/subject_test.txt")
  
  features <- read.table("features.txt")
  activities <- read.table("activity_labels.txt")
  
  #combine test and training data
  X_data <- rbind(X_train, X_test)
  Y_data <- rbind(Y_train, Y_test)
  S_data <- rbind(S_train, S_test)
  
  #descriptively label columns
  names(X_data) <- features$V2
  names(S_data) <- "subject"
  names(Y_data) <- "activity"
  
  #extract mean() and std() columns
  means <- grepl("mean()", names(X_data), fixed=TRUE)
  stds <- grepl("std()", names(X_data))
  meanstd <- means | stds
  data <- X_data[,meanstd]
  
  #combine activity, subject and instrument data
  data <- cbind(Y_data, data)
  data <- cbind(S_data, data)
  
  ##replace activity numbers with relevant activity names
  data <- merge(data, activities, by.x = "activity", by.y = "V1", sort=FALSE)
  data <- data[,-1]
  names(data)[length(names(data))] <- "activity"
  data <- data[,c(1,68,2:67)]
  
  #from the data set in step 4, create a second, independent tidy data set with
  #the average of each variable for each activity and each subject
  
  data2 <- summarise_all(group_by(data, subject, activity), mean)
  
  write.table(data2, file = "Samsung_Data_Means.txt", row.names=FALSE)
  
}