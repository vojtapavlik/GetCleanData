parent <- getwd()

##reading in the test file
setwd("./test")
test <- read.table("X_test.txt")
testL <- read.table("y_test.txt")
testS <- read.table("subject_test.txt")
setwd(parent)

#reading in the train file
setwd("./train")
train <- read.table("X_train.txt")
trainL <- read.table("y_train.txt")
trainS <- read.table("subject_train.txt")
setwd(parent)

#reading in the activity labels
activityL <- read.table("activity_labels.txt")
features <- read.table("features.txt")
setwd(parent)


#subject assigning
train <- cbind(trainL, trainS, train)
test <- cbind(testL, testS, test)

#merging the datasets
merged <- rbind(test,train)

#rename the features
colnames(merged) <- c("Activity","Subject",as.character(features$V2))

#assign activities according to the codes
merged[,1] <- activityL[merged[,1],2]

#selecting only mean and std
toKeep <- grep("mean\\(|std",colnames(merged))
merged2 <- merged[,c(1:2,toKeep)]

write.table(merged2, "dataMerged.txt", sep = "\t", row.name = FALSE)

############# AVERAGED DATASET ###################

uniqueA <- levels(merged$Activity)
uniqueS <- unique(merged$Subject)

averaged <- NULL
for (i in uniqueA) {
  for (j in uniqueS) {
    selectedRows <- merged[,"Activity"] == i & merged[,"Subject"] == j
    mergedSub <- merged[selectedRows,]
    aver <- apply(mergedSub[,2:ncol(mergedSub)], 2, mean)
    aver <- cbind(i, t(as.data.frame(aver)))
    averaged <- rbind(averaged,aver)
  }
}

averaged <- as.data.frame(averaged)
averaged[,2] <- as.integer(as.character(averaged[,2]))
averaged[,3:563] <- apply(averaged[,3:563], 2, as.numeric)
colnames(averaged)[1] <- "Activity"

write.table(averaged, "tidyAveragedData.txt", row.name = FALSE)


