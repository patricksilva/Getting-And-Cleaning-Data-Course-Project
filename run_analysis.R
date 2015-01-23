  inputFiles <- c("UCI HAR Dataset/activity_labels.txt",      #1
                   "UCI HAR Dataset/features.txt",             #2
                   "UCI HAR Dataset/test/subject_test.txt",    #3
                   "UCI HAR Dataset/test/X_test.txt",          #4
                   "UCI HAR Dataset/test/y_test.txt",          #5
                   "UCI HAR Dataset/train/subject_train.txt",  #6
                   "UCI HAR Dataset/train/X_train.txt",        #7
                   "UCI HAR Dataset/train/y_train.txt")        #8
  # reading files
  activityLabels <- read.table(inputFiles[1], stringsAsFactors = FALSE, 
                               col.names = c("id", "activity"))
  features <- read.table(inputFiles[2], stringsAsFactors = FALSE)
  subjectTest <- read.table(inputFiles[3])
  subjectTrain <- read.table(inputFiles[6])
  activityTest <- read.table(inputFiles[5])
  activityTrain <- read.table(inputFiles[8])
  xTest <- read.table(inputFiles[4])
  xTrain <- read.table(inputFiles[7])
  # creating raw table
  rawData <- rbind(
               cbind(activityTest, subjectTest, xTest),
               cbind(activityTrain, subjectTrain, xTrain))
  rm(subjectTest, subjectTrain, activityTest, activityTrain, xTest, xTrain)
  names(rawData) <- c("id", "subject", features[,2])
  rawData <- rawData[, grep("mean\\(|std|subject|id", names(rawData))]
  # making tidy names for activities
  activityLabels$activity <- gsub("_", "",
                               gsub("(_|^)([[:alpha:]])", "\\1\\U\\2",
                                 tolower(activityLabels$activity),
                                 perl = TRUE))
  rawData <- merge(rawData, activityLabels, by.x = "id", by.y = "id")[, -1]
  # making descriptive names for features
  names(rawData) <- gsub("BodyBody", "Body",  
                      gsub("Gyro", "AngularVelocity",
                        gsub("GyroJerk", "AngularAcceleration",
                          gsub("Acc", "Acceleration",
                            gsub("std","Std",
                              gsub("mean", "Mean",
                                gsub("\\(|\\)|,|-", "",
                                  gsub("^f", "Freq",
                                    gsub("^t", "Time",
                                      names(rawData))))))))))
  # making tidy table
  tidyData <- aggregate(rawData[, 2:ncol(rawData)-1],
                by = list(Subject = rawData$subject, Activity = rawData$activity),
                mean)
  tidyData <- tidyData[, -grep("subject|activity", names(tidyData))]
  tidyData <- tidyData[, c(2,1,3:ncol(tidyData))]
  write.table(tidyData, "average_data.txt", row.name = FALSE)
  rm(rawData, tidyData)