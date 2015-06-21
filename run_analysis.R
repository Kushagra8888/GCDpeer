#Load and subset features and activty labels
all_features <- read.table("UCI HAR Dataset/features.txt", header = FALSE)
req_features <- all_features[grep("mean\\(\\)|std", all_features$V2, value = FALSE), ]
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE, col.names = c("Class", "Label"))

#Read and process test dataset
raw_test <- read.table("UCI HAR Dataset/test/X_test.txt", colClasses = "numeric", header = FALSE)
test_subset <- raw_test[,as.numeric(req_features$V1)]
colnames(test_subset) <- req_features$V2
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names = c("Subject"))
test_activities <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE, col.names = "Class")
test_activities_labeled <- merge(x = test_activities, y = activity_labels, by.x = "Class", by.y = "Class", sort = FALSE)
test_subset$activity <- test_activities_labeled$Label
test_subset$subject <- test_subjects$Subject

#Read and process train datasset
raw_test <- read.table("UCI HAR Dataset/test/X_test.txt", colClasses = "numeric", header = FALSE)
test_subset <- raw_test[,as.numeric(req_features$V1)]
colnames(test_subset) <- req_features$V2
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names = c("Subject"))
test_activities <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE, col.names = "Class")
test_activities_labeled <- merge(x = test_activities, y = activity_labels, by.x = "Class", by.y = "Class", sort = FALSE)
test_subset$activity <- test_activities_labeled$Label
test_subset$subject <- test_subjects$Subject

#Combinne the test and train datasets
combined <- rbind(test_subset, train_subset)
combinedMelt <- melt(combined, id=c("activity", "subject"))
casted <- dcast(combinedMelt, subject + activity ~ variable, mean)
write.table(casted, file = "tidy.txt", row.names = FALSE)