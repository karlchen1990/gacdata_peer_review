#CodeBook for peer review assignment of coursera course get and clean data
feature_names: data frame which contains the content read back from file features.txt
feature_names_vector: a character vector which contains the all feature names as in data frame feature_names
X_train: data frame which contains training data set 
y_train: data frame which contains training data set labels,that is, the activity subjects took
X_test: data frame which contains test data set
y_test: data frame which contains test data set labels
subject_train: data frame which has the subjects who do the activities in training data set
subject_test: data frame which has the subjects who do the activities in test data set
X_train_tbl_select:data frame of training data set after selecting the mean and std columns 
X_test_tbl_select:data frame of test data set after selecting the mean and std columns 
activity_labels:data frame contains activity labels read from file activity_labels.txt
X_train_dataset: labeld training dataset
X_test_dataset: labeld test dataset
complete_dataset: data set which contains training and test data set 
analysis_result: a tidy data set with the average of each variable for each activity and each subject