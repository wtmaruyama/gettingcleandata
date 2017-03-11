path <- getwd()

pathRoot <- paste0(path,"/UCI HAR Dataset/")
pathTrain <- paste0(path,"/UCI HAR Dataset/train")
pathTest <- paste0(path,"/UCI HAR Dataset/test")

# Construct the path to a file from components in a platform-independent way.
ftrain <- file.path(pathTrain, "X_train.txt")
ftest <- file.path(pathTest, "X_test.txt")

# read name of features
features <- read.table(file.path(pathRoot), "features.txt")[,2]

# read.table: Reads a file in table format and creates a data frame
dtrain <-read.table(ftrain)
dtest <- read.table(ftest)

####  1. Merges the training and the test sets to create one data set.
data <- rbind(dtrain,dtest)

# put names in columns
colnames(data) <- features

### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
extract_features <- grepl("mean|std", features)
data <- data[,extract_features]

# Labels of data
ltrain <- read.table(file.path(pathTrain, "y_train.txt"))
ltest <- read.table(file.path(pathTest, "y_test.txt"))
label <- rbind(ltrain,ltest)
colnames(label) <- "activityId"

####  3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table(file.path(paste0(path,"/UCI HAR Dataset/"),"activity_labels.txt"))
colnames(activity_labels)<- c("activityId","activityName")
label <- merge(x = label, y = activity_labels, by.x = "activityId", by.y = "activityId")
# Concanate labels in data
data <- cbind(data,label)

####  4 Appropriately labels the data set with descriptive variable names.
name <- names(data)
cleanNames <- gsub("[()]", "", name)
cleanNames <- gsub("-|,", " ", cleanNames)
cleanNames <- gsub("^t|^f", "", cleanNames)
library(stringi)
cleanNames <- trim(cleanNames)
colnames(data) <- cleanNames

####  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(dplyr)
# Read the subject test
subtest<-read.table(file.path(pathTest,"subject_test.txt"), header=FALSE)
# Read the subject train
subtrain<-read.table(file.path(pathTrain,"subject_train.txt"), header=FALSE)
# Concanate
subject<-rbind(subtrain,subtest)
colnames(subject) <- "subject"

# Concanate subject in data
data <- cbind(subject, data)
tidy <- data

namesTidy <- names(tidy)
# Create unique column names
colnames(tidy) <- make.names(namesTidy , unique=TRUE)

# Group by one or more variables.
tidyGroup <- group_by(tidy, subject,activityName)
# Apply the functions to all (non-grouping) columns - Is necessary unique names for variables
tidyMean <- summarise_all(tidyGroup, mean)

tidyMean[1:10]

# Create tidy dataset
write.table(tidyMean, file="tidy.txt", row.names=FALSE, col.names=TRUE, sep="\t", quote=TRUE)