require("data.table")
require("reshape2")

# Basically, do the following:
# 0. Download and unzip the data set
# 1. Merge the training and the test sets to create one data set
# 2. Extract only the measurements on the mean and standard deviation for each measurement
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive variable names
# 5. Create an independent tidy data set with the average of each variable for each activity and each subject

# Download the input file if not available locally
# >>> See Step 0.
infile <- "getdata-projectfiles-UCI HAR Dataset.zip"
if (!file.exists(infile)) {
        url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(url, destfile = infile)
}

# Unzip the input file if not already unziped
if (!file.exists("UCI HAR Dataset")) {
        unzip(infile)
}

# Read the feature and activity names.
# Note: column 2 contains the actual names
# >>> See Step 4.
features <- read.table("UCI HAR Dataset/features.txt")[,2]
activities <- read.table("UCI HAR Dataset/activity_labels.txt")[,2]

# Create R-friendly names (remove parenthesis and replace -/, with a dot)
features <- gsub("[()]", "", features)
features <- gsub("[-,]", ".", features)

# Create a function which reads a unified data set
# Both the test and train data sets share the same structure,
# so combine the subject, activity and features relating to
# mean and standard deviation
# Examples:
#       testdata <- readset("test")
#       traindata <- readset("train")
readset <- function(name) {
        
        # Create directory path e.g. UCI HAR Dataset/test or UCI HAR Dataset/train
        dir <- file.path("UCI HAR Dataset", name)

        # Read the subject, X and y data sets using the specified column names
        subject <- read.table(sprintf("%s/subject_%s.txt", dir, name), col.names = "subject")
        y <- read.table(sprintf("%s/y_%s.txt", dir, name), col.names = "activity")
        x <- read.table(sprintf("%s/X_%s.txt", dir, name), col.names = features)

        # Only keep the mean and standard deviation (i.e. std) data
        # by filtering the column names
        # >>> See Step 2.
        x <- x[, grepl("mean|std", colnames(x), ignore.case = TRUE)]

        # Transform activity index into activity name
        # >>> See Step 3.
        y$activity <- activities[y$activity]
        
        # Create a unified data set
        set <- cbind(subject, y, x)

        # Return the resulting data set
        return(set)
}

# Read and test and trainning data sets
testdata <- readset("test")
traindata <- readset("train")

# Merge both data sets
# >>> See Step 1.
data <- rbind(testdata, traindata)

# Classify the data with activity and subject as the ids and
# all other columns as measures
data_melted <- melt(data, id.vars=c("activity", "subject"))

# Create a tidy data set showing mean by activity and subject for all variables
# >>> See Step 5.
tidy <- dcast(data_melted, activity + subject ~ variable, mean)

# Write the final tidied data set
write.table(tidy, "out.txt", row.names = FALSE)
