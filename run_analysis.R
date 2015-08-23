
library(dplyr)
library(reshape2)
##******************************************************************************
##***** Functions **************************************************************
##******************************************************************************

##______________________________________________________________________________
##----- This function is used to retrieve a vector of names contaning ----------
##----- a specified pattern in the columns of a given datatable       ----------
##------------------------------------------------------------------------------
cNames <- function(x,myPattern,st = TRUE) {
     g <- grep(myPattern,names(x),value=st)
     g <- data.frame(g)
     g <- rename(g,colName=g)
     g
}
##______________________________________________________________________________




MyPath <- getwd()


a <- read.table(paste(MyPath,"/features.txt",sep = ""),header = F,sep=" ")
a <- a$V2
a <- sub("mean\\(\\)","MEAN_FUN",a)
a <- sub("std\\(\\)","STD_FUN",a)



act <- read.table(paste(MyPath,"/activity_labels.txt",sep = ""),header = F,sep=" ",col.names = c("Act_ID","Act_Name"))



zVal <- read.table(paste(MyPath,"/X_train.txt",sep = ""),col.names = a)
zAct <- read.table(paste(MyPath,"/y_train.txt",sep = ""),col.names="Act_ID")
zAct <- merge(zAct,act)
zSub <- read.table(paste(MyPath,"/subject_train.txt",sep = ""),col.names = "Subject")
ztrain <- cbind("Group"="Train",zSub,zAct,zVal)

zVal <- read.table(paste(MyPath,"/X_test.txt",sep = ""),col.names = a)
zAct <- read.table(paste(MyPath,"/y_test.txt",sep = ""),col.names="Act_ID")
zAct <- merge(zAct,act)
zSub <- read.table(paste(MyPath,"/subject_test.txt",sep = ""),col.names = "Subject")
ztest <- cbind("Group"="Test",zSub,zAct,zVal)

zTotal <- rbind(ztrain,ztest)
x <- rbind(cNames(zTotal,"MEAN_FUN",FALSE),cNames(zTotal,"STD_FUN",FALSE))


MyData <- select(zTotal,c(1,2,3,4,x[,1]))

rm(a,act,x,zAct,zSub,zTotal,zVal,ztrain,ztest)
gc()


cns <- colnames(MyData)
dMelt <- melt(MyData,id=cns[1:4],measure.vars = cns[5:length(cns)])
dMelt <- rename(dMelt,Orig_Head=variable)
a <- dcast(dMelt, Subject + Act_Name ~ Orig_Head,mean)
##write.table(a,"summary.csv",sep = ",",row.names = FALSE)
write.table(a,paste(MyPath,"/summary.txt",sep = ""),row.names = FALSE)
