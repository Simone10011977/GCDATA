# Getting and Cleaning Data Course Project

This repository contains the files required for the Coursera Getting and Cleaning Data course project.

## Files Included

### run_analysis.R

This script performs the following steps:

1. Loads the training and test datasets.
2. Merges the datasets into one complete dataset.
3. Extracts only measurements on the mean() and standard deviation().
4. Replaces activity IDs with descriptive activity names.
5. Labels the dataset with descriptive variable names.
6. Creates a second independent tidy dataset containing the average of each variable for each activity and subject.
7. Writes the final tidy dataset to tidy_dataset.txt.

### tidy_dataset.txt

The final tidy dataset produced by the script. It contains the average of each selected variable for each activity and each subject.

### CodeBook.md

Describes the variables, source data, and transformations performed to create the tidy dataset.
