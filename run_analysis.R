# Assignment, requirements
#
# Create one R script called run_analysis.R that does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Step zero (external to this program): Rename directory "UCI HAR Dataset" to UCI_HAR_Dataset, put it into working directory

require("data.table") # for read.table
require("reshape2") # for melt

# For requirement 1, merge training and test data sets
x_train <- read.table("UCI_HAR_Dataset/train/X_train.txt")
y_train <- read.table("UCI_HAR_Dataset/train/y_train.txt")
x_test <- read.table("UCI_HAR_Dataset/test/X_test.txt")
y_test <- read.table("UCI_HAR_Dataset/test/y_test.txt")
subject_test <- read.table("UCI_HAR_Dataset/test/subject_test.txt")
subject_train <- read.table("UCI_HAR_Dataset/train/subject_train.txt")
# More to do - will pick up below...

# For requirement 3, descriptive activity names: 2nd column of input data set
activity_names <- read.table("UCI_HAR_Dataset/activity_labels.txt")[,2]

# Add column
y_test[,2] = activity_names[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
y_train[,2] = activity_names[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")

# For requirement 4, descriptive variable names, 2nd column of input data set
features <- read.table("UCI_HAR_Dataset/features.txt")[,2]
names(x_test) = features
names(x_train) = features
names(subject_test) = "subject"
names(subject_train) = "subject"

# For requirement 2, extract only the measurements on the mean and standard deviation for each measurement.
# I am not so sure the syntax/English of that requirement (above/prior line) is as clear as it could be.
extract_features <- grepl("mean|std", features)

# x_test_ms = x_test[,extract_features]
# x_train_ms = x_train[,extract_features]
x_test = x_test[,extract_features]
x_train = x_train[,extract_features]

# Munge stuff together, use cbind and rbind as appropriate
test_data <- cbind(as.data.table(subject_test), y_test, x_test)
train_data <- cbind(as.data.table(subject_train), y_train, x_train)
data = rbind(test_data, train_data)

id_labels = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
# Now stack into a single column, using melt, based on id_labels and data_labels
melt_data = melt(data, id = id_labels, measure.vars = data_labels)

# Use dcast to produce/get/achieve the mean
tidy_data = dcast(melt_data, subject + Activity_Label ~ variable, mean)

# write.table(tidy_data, file = "tidy_data.txt")
write.table(tidy_data, file = "tidy_data.txt", row.names=FALSE)
