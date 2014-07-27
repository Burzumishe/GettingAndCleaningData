## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# function creates tidy file with given name
writeTidyFile <- function(file_name)
{
    # Read activity labels
    activity_labels <- read.table("activity_labels.txt")[, 2]
    
    # Read all features
    all_features <- read.table("features.txt")[, 2]
    
    # Extract only the measurements on the mean and standard deviation
    features <- grepl("mean|std", all_features)
    
    # Load test data
    X_test <- read.table("test/X_test.txt")
    y_test <- read.table("test/y_test.txt")
    subject_test <- read.table("test/subject_test.txt")
    
    names(X_test) = all_features
    X_test = X_test[, features]
    
    # Read activity test data
    y_test[, 2] = activity_labels[y_test[, 1]]
    names(y_test) = c("ActivityID", "ActivityName")
    names(subject_test) = "subject"
    
    # Bind test data
    test_data <- cbind(as.data.table(subject_test), y_test, X_test)
    
    # Read train data
    X_train <- read.table("train/X_train.txt")
    y_train <- read.table("train/y_train.txt")
    
    subject_train <- read.table("train/subject_train.txt")
    
    names(X_train) = all_features
    
    # Extract only the measurements on the mean and standard deviation
    X_train = X_train[, features]
    
    # Read activity train data
    y_train[, 2] = activity_labels[y_train[, 1]]
    names(y_train) = c("ActivityID", "ActivityName")
    names(subject_train) = "subject"
    
    # Bind train data
    train_data <- cbind(as.data.table(subject_train), y_train, X_train)
    
    # Merge test and train data
    data = rbind(test_data, train_data)
    
    # melt the dataset
    id_labels = c("subject", "ActivityID", "ActivityName")
    measure_vars = setdiff(colnames(data), id_labels)
    melted_data <- melt(data, id=id_labels, measure.vars=measure_vars)
    
    # Apply mean function
    tidy_data <- dcast(melted_data, subject + ActivityName ~ variable, mean) 
    
    #Write tidy data
    write.table(tidy_data, file = file_name)
}

writeTidyFile("tidy.txt")
