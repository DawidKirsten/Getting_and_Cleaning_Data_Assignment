Assignment <- function(){
##Clearing workspace, save if you want to keep your functions before running code
rm(list = ls())
# read all the files, assuming you have unzipped the file from the link to your working directory
TestLabels <- read.table("UCI HAR Dataset\\test\\y_test.txt", col.names="label")
TestSubjects <- read.table("UCI HAR Dataset\\test\\subject_test.txt", col.names="subject")
TestData <- read.table("UCI HAR Dataset\\test\\X_test.txt")
TrainLabels <- read.table("UCI HAR Dataset\\train\\y_train.txt", col.names="label")
TrainSubjects <- read.table("UCI HAR Dataset\\train\\subject_train.txt", col.names="subject")
TrainData <- read.table("UCI HAR Dataset\\train\\X_train.txt")

# Part 1: Merges the training and the test sets to create one data set
MergeData <- rbind(cbind(TestSubjects, TestLabels, TestData),cbind(TrainSubjects, TrainLabels, TrainData))

# Part 2: Extracts only the measurements on the mean and standard deviation for each measurement
Features <- read.table("UCI HAR Dataset\\features.txt", strip.white=TRUE, stringsAsFactors=FALSE)
Features_MeanStd <- Features[grep("mean\\(\\)|std\\(\\)", Features$V2), ]
# Create a set for the Mean and Standard Deviation, increment by 2 because data has subjects and labels in the beginning
MergeData_MeanStd <- MergeData[, c(1, 2, Features_MeanStd$V1+2)]

# Part 3: Uses descriptive activity names to name the activities in the data set
Labels <- read.table("UCI HAR Dataset\\activity_labels.txt", stringsAsFactors=FALSE)
# replace labels in data with label names
MergeData_MeanStd$label <- Labels[MergeData_MeanStd$label, 2]

# Part 4: Appropriately labels the data set with descriptive variable names. 
# Create list on labels, remove numbers and other special characters and then make lower case
GoodLabels <- c("subject", "label", Features_MeanStd$V2)
GoodLabels <- tolower(gsub("[^[:alpha:]]", "", GoodLabels))
# then use the list as column names for data
colnames(MergeData_MeanStd) <- GoodLabels

# Part 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
AggMergeData <- aggregate(MergeData_MeanStd[, 3:ncol(MergeData_MeanStd)], by=list(subject = MergeData_MeanStd$subject, label = MergeData_MeanStd$label), mean)

# write aggregate merged data table for assignment
write.table(format(AggMergeData, scientific=T), "TidyDataSet.txt", row.names=F, col.names=F, quote=2)
}