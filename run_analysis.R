#function to run the analysis for collected data
run_analysis<-function() {
  #read in feature names
  feature_names<-read.table("./UCI HAR Dataset/features.txt",stringsAsFactors = FALSE)
  feature_names_vector<-feature_names[[2]]
  #read in data set
  X_train<-read.table("./UCI HAR Dataset/train/X_train.txt",col.names = feature_names_vector,stringsAsFactors = FALSE)
  y_train<-read.table("./UCI HAR Dataset/train/y_train.txt",col.names = "activity")
  X_test<-read.table("./UCI HAR Dataset/test/X_test.txt",col.names = feature_names_vector,stringsAsFactors = FALSE)
  y_test<-read.table("./UCI HAR Dataset/test/y_test.txt",col.names = "activity")
  subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt",col.names = "subject")
  subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt",col.names = "subject")
  #select mean and std columns
  X_train_tbl<-tbl_df(X_train)
  X_test_tbl<-tbl_df(X_test)
  X_train_tbl_select<-select(X_train_tbl,contains(".std.."),contains(".mean.."))  
  X_test_tbl_select<-select(X_test_tbl,contains(".std.."),contains(".mean.."))  
  #give y labels a descriptive name
  activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt",col.names = c("number","activity"),stringsAsFactors = FALSE)
  y_train$activity<-factor(y_train$activity,labels = activity_labels$activity)
  y_test$activity<-factor(y_test$activity,labels = activity_labels$activity)
  #bind subject, activity and measurements
  X_train_dataset<-bind_cols(X_train_tbl_select,y_train,subject_train)
  X_test_dataset<-bind_cols(X_test_tbl_select,y_test,subject_test)
  #merge training set and test set
  complete_dataset<-bind_rows(X_train_dataset,X_test_dataset)
  analysis_result<-complete_dataset %>% group_by(subject,activity) %>% summarise_all(mean)
  write.table(analysis_result,"tidy_data.txt",row.names=FALSE)
}