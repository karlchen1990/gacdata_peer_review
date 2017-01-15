#CodeBook for peer review assignment of coursera course get and clean data
The following steps are taken to clean up the data set
##read in all the related files
read in the feature names from file features.txt using function read.table and extract it as a character vector named feature_names_vector

read in the training data set from file X_train.txt and test data set from X_test.txt, specify the col.names option with feature_names_vector
Call the read in datset with names X_train,X_test
notice that the feature names contain some syntatically invalid symbols like "-", "(",")", they will be converted by function read.table to a dot.

read in the activity labels from file y_train.txt and y_test.txt, call them y_train, y_test
read in the subjects from file subject_train.txt and subject_test.txt, store them as subject_train, subject_test
##Extracts only the measurements on the mean and standard deviation for each measurement.
use the select function from package dplyr to select the mean and standard deviation variables from X_train and X_test separately.
The selection criteria is the column variables which contains ".std.." or ".mean.."
##name the activities in the data set
use function factor() to convert the activity labels in y_train and y_test, which are represented as integer, to factors.
The labels of the factors are read in from file activity_labels.txt 

##Appropriately labels the data set with descriptive variable names.
column bind the training data set(X_train) and test data set(X_test) separately with the activity labels (y_train and y_test), 
and subjects (subject_train,subject_test) using function bind_cols

##Merges the training and the test sets to create one data set.
row binds the labeled training data set and test set and store them as a data fram called complete_dataset

##creates a second, independent tidy data set with the average of each variable for each activity and each subject.
use function group_by() to group the combined data frame complete_dataset by subject and activity. Then use function summarise_all to get the mean value
of each variable for each activity and subject group 