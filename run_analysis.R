## 1. Merges the training and the test sets to create one data set.
## 4. Appropriately labels the data set with descriptive variable names.

# read in feature name
FName<-readLines("./R/UCI HAR Dataset/features.txt")
FName<-sapply(strsplit(FName," "),function(X) X[2])

# read in train data
XTrain<-read.table("./R/UCI HAR Dataset/train/X_train.txt",dec=" ",col.names=FName)
yTrain<-read.table("./R/UCI HAR Dataset/train/y_train.txt",col.names="activity_codes")
SubjectTrain<-read.table("./R/UCI HAR Dataset/train/subject_train.txt",col.names="subject")
# read in test data
XTest<-read.table("./R/UCI HAR Dataset/test/X_test.txt",dec=" ",col.names=FName)
yTest<-read.table("./R/UCI HAR Dataset/test/y_test.txt",col.names="activity_codes")
SubjectTest<-read.table("./R/UCI HAR Dataset/test/subject_test.txt",col.names="subject")

# merge into a single table
Feature_all=rbind(XTrain,XTest)
#deal with scientific notation
Feature_all=data.frame(sapply(Feature_all, function(x) as.numeric(as.character(x)) ))
names(Feature_all)=FName

Activities=rbind(yTrain,yTest)
Subjects=rbind(SubjectTrain,SubjectTest)
Subjects$subject=factor(Subjects$subject)
Subject_Activity=cbind(Subjects,Activities)
rm(Activities,Subjects,SubjectTrain,SubjectTest)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#get columns with mean()or std()
ColIdx=grep("mean()|std()",FName)
Feature_mean_std=Feature_all[,ColIdx];
rm(XTrain,yTrain,XTest,yTest)

## 3. Uses descriptive activity names to name the activities in the data set
# readactivity labels
DesAct<-readLines("./R/UCI HAR Dataset/activity_labels.txt")
DesAct<-strsplit(DesAct," ")
# separate into code and label
DesActLbl<-sapply(DesAct,function(X) X[2])
DesActCode<-sapply(DesAct,function(X) X[1])

Subject_Activity$activity_labels=factor(sapply(Subject_Activity$activity_codes, function(CurCode){ DesActLbl[DesActCode==CurCode] }),levels = DesActLbl)
rm(DesActLbl,DesAct,DesActCode)

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
ActFeatureAve=data.frame(sapply(Feature_mean_std, function(x) tapply(x, interaction(Subject_Activity$activity_labels, Subject_Activity$subject), mean)))
names(ActFeatureAve)=FName[ColIdx]
Act_Sub=strsplit(row.names(ActFeatureAve),"\\.")
Act_Sub=data.frame(Activity=sapply(Act_Sub,function(X) X[1]),Subject=sapply(Act_Sub,function(X) X[2]))
ActFeatureAve=cbind(Act_Sub,ActFeatureAve)
rm(Act_Sub,FName,ColIdx)

## 6. exportto file

write.table(cbind(Subject_Activity,Feature_mean_std),"./R/UCI HAR Dataset/out/Features_mean_std.txt",row.names = FALSE,sep="\t")
write.table(cbind(Subject_Activity,Feature_all),"./R/UCI HAR Dataset/out/Features_all.txt",row.names = FALSE,sep="\t")
write.table(ActFeatureAve,"./R/UCI HAR Dataset/out/Feature_ave.txt",row.names = FALSE,sep="\t")



