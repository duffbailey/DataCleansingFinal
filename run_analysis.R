# run_analysis.R creates 2 tidy data sets that summarize smart phone data measruing body motion activity 
rm(list=ls())
# load libraries
library(dplyr)
library(tidyr)

# read in the feature list data
feature_list <- read.table("UCI HAR Dataset/features.txt", sep = "",header = FALSE)
# remove Parens from feature_list
feature_list <- gsub("\\)", "", feature_list$V2)
feature_list <- gsub("\\(", "", feature_list)

# read in the activity list labels
activity_list <- read.table("UCI HAR Dataset/activity_labels.txt", sep = "",header = FALSE)

# read in x_train_data with column names from feature_list
x_train_data <- read.csv("UCI HAR Dataset/train/X_train.txt", sep = "",header = FALSE, col.names = feature_list)

#Extracts only the measurements on the mean and standard deviation for each measurement. 
train_set <- select(x_train_data, contains(c("mean", "std")  ) )


y_train_data <- read.csv("UCI HAR Dataset/train/y_train.txt", sep = "",header = FALSE)

# add labels to the activity vector
train_activity_data <- left_join(y_train_data,activity_list, by = "V1")
train_activity_data <- rename(train_activity_data,activity_code = V1, activity = V2)

# bind the activity vector to the data table
train_set <- cbind(train_set, train_activity_data)

# get subjects for train observation set
train_subject_data <- read.table("UCI HAR Dataset/train/subject_train.txt")
train_subject_data <- train_subject_data %>%
  rename( subject_code = V1)  %>%
  mutate(group = "train")

train_set <- cbind(train_set, train_subject_data)

# do the above activities against the test data sets
# read in x_train_data with column names from feature_list
x_test_data <- read.csv("UCI HAR Dataset/test/X_test.txt", sep = "",header = FALSE, col.names = feature_list)

#Extracts only the measurements on the mean and standard deviation for each measurement. 
test_set <- select(x_test_data, contains(c("mean", "std")  ) )
y_test_data <- read.csv("UCI HAR Dataset/test/y_test.txt", sep = "",header = FALSE)

# add labels to the activity vector
test_activity_data <- left_join(y_test_data,activity_list, by = "V1")
test_activity_data <- rename(test_activity_data,activity_code = V1, activity = V2)

# bind the activity vector to the data table
test_set <- cbind(test_set, test_activity_data)

# get subjects for each observation set
test_subject_data <- read.table("UCI HAR Dataset/test/subject_test.txt")
test_subject_data <-  test_subject_data  %>%
  rename(, subject_code = V1) %>%
  mutate(group = "test")

test_set <- cbind(test_set, test_subject_data)




#Merges the training and the test sets to create one data set.

full_set <- rbind(test_set,train_set)
write.csv(full_set, "body_movement_observation_sample.csv")






#From the data set in step 4, creates a second, independent tidy data set with the
# average of each variable for each activity and each subject
means <- full_set %>% group_by(activity, activity_code, group, subject_code) %>% summarise(across(1:86, mean, .names = "mean_{.col}"))
write.csv(means, "body_movement_observation_means.csv")

