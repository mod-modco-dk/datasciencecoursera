The data the produced dataset, are derived from, are described on this web page: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data, that the data sets are derived from, is obtained from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The zip file is downloaded and unzipped into a R working directory.
The unzipped data is placed in a directory named "UCI HAR Dataset"
The data is transformed using the R script "run_analysis.R"

The script "run_analysis.R" is well commented. 

The basic steps are.
* 1. Merge the subjects and activities with the train and test observations for the two datasets.
* 2. Extract the columns with mean and standard deviation data.
* 3. Rename columns to column names without the characters "(", ")", "," and "-".
* 4. Merge the two data sets.
* 5. Rearrange the columns so that observation subject and subject activity are the two first columns.
* 6. Save the data.
* 7. Summarize the data on subject and subject activity.
* 8. Save the data.


The script can be started in R be executing with the command
source("run_analysis.R")







