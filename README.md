Good day

You will need to unzip the assignment data file to your working directory.

The attached https://github.com/DawidKirsten/Getting_and_Cleaning_Data_Assignment/blob/master/run_analysis.R file will follow the below steps:

Step 1: Clearing workspace, save if you want to keep your functions before running code
Step 2: Read all the files, assuming you have unzipped the file from the link to your working directory
Step 3: Merges the training and the test sets to create one data set
Step 4: Extracts only the measurements on the mean and standard deviation for each measurement
Step 5: Create a set for the Mean and Standard Deviation, increment by 2 because data has subjects and labels in the beginning
Step 6: Save the current naming first
Step 7: Replace labels in data with label names
Step 8: Create list on labels, remove numbers and other special characters and then make lower case
Step 8: Then use the list as column names for data
Step 9: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Step 10: Write aggregate merged data table for assignment