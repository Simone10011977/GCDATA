if (!file.exists("UCI HAR Dataset")) {
  
  download.file(
    "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
    "dataset.zip",
    mode = "wb"
  )
  
  unzip("dataset.zip")
}

# Load required package
library(dplyr)


# Read metadata
features <- read.table("UCI HAR Dataset/features.txt",
                       stringsAsFactors = FALSE)
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt",
                              stringsAsFactors = FALSE)

# Read training data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Read test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Assign column names
colnames(x_train) <- features$V2
colnames(x_test) <- features$V2

colnames(y_train) <- "activity"
colnames(y_test) <- "activity"

colnames(subject_train) <- "subject"
colnames(subject_test) <- "subject"

# Merge training and test sets
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

merged_data <- cbind(subject_data, y_data, x_data)

# Extract only mean and standard deviation measurements
mean_std_columns <- grep("mean\\(\\)|std\\(\\)",
                         names(merged_data),
                         value = FALSE)

tidy_data <- merged_data[, c(1, 2, mean_std_columns)]

# Use descriptive activity names
tidy_data$activity <- factor(
  tidy_data$activity,
  levels = activity_labels$V1,
  labels = activity_labels$V2
)

# Clean variable names
names(tidy_data) <- gsub("^t", "Time", names(tidy_data))
names(tidy_data) <- gsub("^f", "Frequency", names(tidy_data))
names(tidy_data) <- gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data) <- gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data) <- gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data) <- gsub("BodyBody", "Body", names(tidy_data))

# Create independent tidy dataset
final_tidy_data <- tidy_data %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean),
            .groups = "drop")

# Write output
write.table(final_tidy_data,
            "tidy_dataset.txt",
            row.names = FALSE,
            quote = FALSE)
