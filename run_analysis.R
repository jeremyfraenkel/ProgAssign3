install.packages("readr")
install.packages("dplyr")
library(readr)
library(dplyr)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "samsung.zip")
unzip("samsung.zip")

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

merge_X <- bind_rows(X_train,X_test)
merge_y <- bind_rows(y_train,y_test)

merge_labels <- function(x){
	for(i in 1:length(activity_labels$V2)){
		x <- gsub(i,activity_labels$V2[i],x)
	}
	x
}
merge_y <- merge_labels(merge_y[[1]])
merge_y <- as.data.frame(merge_y)
colnames(merge_y) <- "activity"

merge_subject <- bind_rows(subject_train,subject_test)
colnames(merge_subject) <- "subject"

cols <- grep("(mean|std)[()]",features$V2)
merge_X <- merge_X[,cols]
cols_features <- features$V2[cols]
cols_features <- gsub("\\()","",cols_features)
colnames(merge_X) <- cols_features

merge_all <- bind_cols(merge_y, merge_subject, merge_X)
tidy <- aggregate(.~ activity+subject,merge_all, mean)
print(tidy)
