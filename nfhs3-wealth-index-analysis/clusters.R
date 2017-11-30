library(dplyr)
library(tidyr)
library(NbClust)
library(ggplot2)
#subset for the variables we are interested in, as discussed in the
#Wealth_Index_Initial_Report.pdf

household <- read.csv("household_truncated.csv")
householdWI <- select(household, HV201, HV202, HV205, HV206, HV207, SH47I, SH47J, 
                      HV209, HV210, HV211, HV212, HV221, HV243A, HV243B, SH47B, SH47E, 
                      SH47D, SH47F, SH47G, SH47N, SH47U, HV226, HV213, HV214, HV215, SH56A,
                      SH56B, SH56C, SH56D, HV216, SH58, HV247, HV225, HV242, 
                      HV025, HV026, SH025)

#create a new dataset without missing data
householdWI <- na.omit(householdWI)

write.csv(householdWI, file = "householdWI.csv")

#Rural household subset
Rural <- subset(householdWI, HV025 == 'Rural')

#Urban household subset
Urban <- subset(householdWI, HV025 == 'Urban')

#Mega city household subset
MCity <- subset(householdWI, SH025 == 'Mega city')

#MAke a subset for all urban areas excluding mega cities
OUrban <- subset(householdWI, HV025 == 'Urban' & SH025 != 'Mega city')

#Now delete HV025, HV026 and SH025 from all these subsets
MCity <- subset(MCity, select = -c(HV025, HV026, SH025))
Urban <- subset(Urban, select = -c(HV025, HV026, SH025))
Rural <- subset(Rural, select = -c(HV025, HV026, SH025))
OUrban <- subset(OUrban, select = -c(HV025, HV026, SH025))
householdWI <- subset(householdWI, select = -c(HV025, HV026, SH025))


#this function is copied from r-bloggers, it will help us visualize wss for different
#values of k
wssplot <- function(data, nc=30, seed=30){
  wss <- (nrow(data)-1)*sum(apply(data,2,var))
  for (i in 2:nc){
    set.seed(seed)
    wss[i] <- sum(kmeans(data, centers=i)$withinss)}
  plot(1:nc, wss, type="b", xlab="Number of Clusters",
       ylab="Within groups sum of squares")}



for (i in 1:ncol(Rural)){
  if (is.factor(Rural[,i]))
    Rural[,i] <- as.numeric(Rural[,i])-1
  else
    Rural[,i] <- scale(as.numeric(Rural[,i]))
}


wssplot(Rural, nc = 30, seed = 30)
clusterR <- kmeans(Rural, centers = 2, iter.max=1000)


for (i in 1:ncol(Urban)){
  if (is.factor(Urban[,i]))
    Urban[,i] <- as.numeric(Urban[,i])-1
  else
    Urban[,i] <- scale(as.numeric(Urban[,i]))
}
wssplot(Urban, nc = 30, seed = 30)
clusterU <- kmeans(Urban, centers = 4, iter.max=1000)


for (i in 1:ncol(OUrban)){
  if (is.factor(OUrban[,i]))
    OUrban[,i] <- as.numeric(OUrban[,i])-1
  else
    OUrban[,i] <- scale(as.numeric(OUrban[,i]))
}

wssplot(OUrban, nc = 30, seed = 30)

clusterOU <- kmeans(OUrban, centers = 5, iter.max=1000)



for (i in 1:ncol(MCity)){
  if (is.factor(MCity[,i]))
    MCity[,i] <- as.numeric(MCity[,i])-1
  else
    MCity[,i] <- scale(as.numeric(MCity[,i]))
}
wssplot(MCity, nc = 30, seed = 30)
clusterMC <- kmeans(MCity, centers = 5, iter.max=1000)
