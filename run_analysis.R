#read the X sets of the training and test data that content the sets' data
#and merge them
settrain <- read.table("UCI HAR Dataset/train/X_train.txt")
settest <- read.table("UCI HAR Dataset/test/X_test.txt")
#merge the sets with rbind
xsets <- rbind(settrain, settest)

#read the Y sets of the training and test data that content the sets' labels
#and merge them
labtrain <- read.table("UCI HAR Dataset/train/Y_train.txt")
labtest <- read.table("UCI HAR Dataset/test/Y_test.txt")
#merge the sets with rbind
y_sets <- rbind(labtest,labtrain)

#read the subjects data of the training and test sets
subtrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
subtest <- read.table("UCI HAR Dataset/test/subject_test.txt")
#merge the sets
subject_sets <- rbind(subtrain, subtest)

#2)extracts only the measurements of std and mean for each measurement.
#extract it from the features.txt set
features_set <- read.table('./UCI HAR Dataset/features.txt', header=FALSE, col.names=c('id', 'feature'))
features_stdmean <- grep('mean\\(\\)|std\\(\\)', features_set$feature)

#filter the dataset
filter_feature <- X_sets[, features_stdmean]
names(features_stdmean) <- features_set[features_set$id %in% features_stdmean, 2]
x_filtered <- features_stdmean

act_lab <- read.table('./UCI HAR Dataset/activity_labels.txt', header=FALSE, col.names=c('id', 'name'))
