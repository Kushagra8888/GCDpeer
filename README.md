#Getting And Cleaning Data Peer Review

##Objective

Use the "Human Activity Recognition Using Smartphones Dataset" to produce a tidy dataset that summarizes a subset of the available by mean for each subject and for each activity.

##Files

- run_analysis.R : The R script for reading the required files, processing it and writing the new dataset to a file "tidy.txt"

- tidy.txt : A text file with containing the tidy data.

Note: It is assumed that the the folder titled "UCI HAR Dataset" is present in the working directory.

##Solution overview

1. Read the features.txt file
2. Use regex matching to get the indices of only those features which depict mean or standard deviation.
3. Read the activity_labels.txt file
4. Read X_test.txt and subet it on the basis of step 2.
5. Assign variable names to features based on step 2.
6. Read subject_test.txt
7. Read y_test.txt and merge with activity labels from step 3.
8. Add subject and activity variables to the dataset.
9. Repeat steps 4-8 for reading and processing train dataset.
10. Combine and summarize the two datasets to get the required results.




 
