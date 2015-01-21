# Getting And Cleaning Data - Course Project
## Introduction
This repo contains my course project to [Coursera](www.coursera.org) 
[“Getting and Cleaning Data”](https://www.coursera.org/course/getdata) course, part of the 
[Data Science](https://www.coursera.org/specialization/jhudatascience/1) specialization.

There is just one R script called run_analysis.R that extracts from the 
[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) [1] 
only the measurements on the mean and standard deviation for each measurement from initial data and transforms this data into 
the table containing average of selected variables for each activity and each subject.

For more information about the initial and the final data read CodeBook.md.
## How to run
* clon this repo
* download the initial dataset and copy `UCI HAR Dataset` to the repo directory
* in R console set the working directory to the repo directory with `setwd("path-to-repo-directory")` command
* use `source("run_analysis.R")` to run the script

Final table will be saved as `average_data.txt`
## Files
* `run_analysis.R` contains the code to perform the data transformation
* `CodeBook.md` describes raw and tidy data and the transformations that was performed to clean up the raw data
* `average_data.txt` contains the clean data derived by script executing


---
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on 
Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living 
(IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012