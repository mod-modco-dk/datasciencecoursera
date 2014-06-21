# assumptions 
# Script works on data downloaded from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# The downloaded data is in an "UCI HAR Dataset" directory in the R working directory.
# "UCI HAR Dataset" has the following directory layout - 
#  "UCI HAR Dataset"
#  - "test"     -- directory
#    - "Inertial Signals"  -- directory
#      - body_acc_x_test.txt      -- not used in script
#      - body_acc_y_test.txt      -- not used in script
#      - body_acc_z_test.txt      -- not used in script
#      - body_gyro_x_test.txt     -- not used in script
#      - body_gyro_y_test.txt     -- not used in script
#      - body_gyro_z_test.txt     -- not used in script
#      - total_acc_x_test.txt     -- not used in script
#      - total_acc_y_test.txt     -- not used in script
#      - total_acc_z_test.txt     -- not used in script
#    - subject_test.txt
#    - X_test.txt
#    - y_test.txt
#  - "train"    -- directory
#    - "Inertial Signals"  -- directory
#      - body_acc_x_train.txt     -- not used in script
#      - body_acc_y_train.txt     -- not used in script
#      - body_acc_z_train.txt     -- not used in script
#      - body_gyro_x_train.txt    -- not used in script
#      - body_gyro_y_train.txt    -- not used in script
#      - body_gyro_z_train.txt    -- not used in script
#      - total_acc_x_train.txt    -- not used in script
#      - total_acc_y_train.txt    -- not used in script
#      - total_acc_z_train.txt    -- not used in script
#    - subject_train.txt
#    - X_train.txt
#    - y_train.txt
#  - activity_labels.txt
#  - features.txt
#  - features_info.txt
#  - README.txt


# setwd("<insert path here>\\Getting and Cleaning Data\\CourseProject")


# step 1: read activity labels  activity_labels.txt 
df.activity_labels <- read.table(file="UCI HAR Dataset/activity_labels.txt"
                              ,skip=0
                              ,strip.white=TRUE
                              ,sep = " "
							  ,col.names = c("activity_id","activity_label"))

# print(df.activity_labels)							  
# step2: read features  (features.txt)

df.features <- read.table(file="UCI HAR Dataset/features.txt"
                         ,skip=0
                         ,strip.white=TRUE
                         ,sep = " "
						,col.names = c("feature_id","feature_label"))
					

# print(head(df.features))

##df.features[grepl("(mean|std)",df.features$feature_label),]

# find features with mean and std in col name
feature_id <- df.features[grepl("(mean|std)",df.features$feature_label,ignore.case = TRUE),]$feature_id
# remove () and replace - with _ in feature names
feature_label <- gsub("\\(", "", df.features[grepl("(mean|std)",df.features$feature_label,ignore.case = TRUE),]$feature_label)
feature_label <- gsub("\\)","",feature_label)
feature_label <- gsub("-","_",feature_label)
feature_label <- gsub(",","_",feature_label)




# step 3: read test set
# merge data in subject_test.txt, z_test.txt, y_test.txt
					
					
df.test <- read.table(file="UCI HAR Dataset/test/X_test.txt"
                    ,skip=0
                    ,sep = ""
					)


## set correct column names on std and mean columns
colnames(df.test)[feature_id] <- feature_label
					
##print(head(df.test))

#reduce df.test to only columns with mean and std data.

df.test <- df.test[,feature_id]

## read subject data
					
df.subject_test <- read.table(file="UCI HAR Dataset/test/subject_test.txt"
                    ,skip=0
                    ,sep = ""
					)

## add subject data to df.test					
df.test$subject_id <- df.subject_test$V1


## read activity data 					
df.y_test <- read.table(file="UCI HAR Dataset/test/y_test.txt"
                       ,skip=0
                       ,sep = ""
                       ,col.names = c("activity_id")
					   )

## activity number to label 
df.test_activity = merge(df.y_test,df.activity_labels,by.x="activity_id",by.y="activity_id",all=TRUE)					   
					 
## add activity label to df.test					 
df.test$activity_label <- df.test_activity$activity_label

##print(head(df.test))
					  
					
# step 4: read training set
# merge data in subject_test.txt, z_test.txt, y_test.txt
# this is a copy from step 3...


					
df.train <- read.table(file="UCI HAR Dataset/train/X_train.txt"
                    ,skip=0
                    ,sep = ""
					)


## set correct column names on std and mean columns
colnames(df.train)[feature_id] <- feature_label
					
##print(head(df.test))

#reduce df.test to only columns with mean and std data.

df.train <- df.train[,feature_id]

## read subject data
					
df.subject_train <- read.table(file="UCI HAR Dataset/train/subject_train.txt"
                    ,skip=0
                    ,sep = ""
					)

## add subject data to df.test					
df.train$subject_id <- df.subject_train$V1


## read activity data 					
df.y_train <- read.table(file="UCI HAR Dataset/train/y_train.txt"
                       ,skip=0
                       ,sep = ""
                       ,col.names = c("activity_id")
					   )

## activity number to label 
df.train_activity = merge(df.y_train,df.activity_labels,by.x="activity_id",by.y="activity_id",all=TRUE)					   
					 
## add activity label to df.test					 
df.train$activity_label <- df.train_activity$activity_label

## print(head(df.train))

# step 5 merge two data sets
df.merged <- rbind(df.test, df.train)
## nrow(df.merged) == nrow(df.test) + nrow(df.train)
# set subject_id and activity_label as first columns in data frame.
df.merged <- data.frame(subject_id=df.merged$subject_id,activity_label=df.merged$activity_label, df.merged[1:(length(names(df.merged))-2)])

# free memory
rm("df.test")
rm("df.train")

## save the merged data frame
write.table(df.merged, "activity_obeservations.txt", sep=",", row.names = FALSE)

# step 5: 
## aggregate example from ?aggregate

## testDF <- data.frame(v1 = c(1,3,5,7,8,3,5,NA,4,5,7,9),
##                     v2 = c(11,33,55,77,88,33,55,NA,44,55,77,99) )
##by1 <- c("red", "blue", 1, 2, NA, "big", 1, 2, "red", 1, NA, 12)
##by2 <- c("wet", "dry", 99, 95, NA, "damp", 95, 99, "red", 99, NA, NA)
##aggregate(x = testDF, by = list(by1, by2), FUN = "mean")

## removing subject_id and activity_label label from the computation, mean gives no meaning
df.aggdata <-aggregate(df.merged[3:(length(names(df.merged)))], by=list(df.merged$subject_id,df.merged$activity_label), FUN=mean, na.rm=TRUE)

##setting the right column headers on the first two columns in stead of "Group.1" and "Group.2"
colnames(df.aggdata)[1:2] <- c("subject_id","activity_label")


## save the merged data frame
write.table(df.aggdata, "activity_aggregates.txt", sep=",", row.names = FALSE)



