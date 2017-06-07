#cleaning data and renaming columns
setwd("F:\\cricket data\\men t20\\t20_csv_male")
temp = list.files(pattern="*.csv")
myfiles = lapply(temp, read.delim)
data<-list(length(myfiles)) #seprating a column into 15 columns

library(dplyr)
library(tidyr)
for (i in 1:length(myfiles)) {
  
data[[i]]<-as.data.frame(myfiles[[i]]) %>% separate(version.1, into = paste("V", 1:11, sep = "_"), sep=",")

#renaming the column names
names(data[[i]])[1]<-"balls"
names(data[[i]])[2]<-"inning"
names(data[[i]])[3]<-"over"
names(data[[i]])[4]<-"battingteam"
names(data[[i]])[5]<-"batsman"
names(data[[i]])[6]<-"otherendbatsman"
names(data[[i]])[7]<-"bowler"
names(data[[i]])[8]<-"runs"
names(data[[i]])[9]<-"extras"
names(data[[i]])[10]<-"wickets"

data[[i]]<-filter(data[[i]], balls=="ball")
data[[i]]<-select(data[[i]], inning, over, runs, extras, wickets)

data[[i]][c(which((data[[i]]$wickets=="")==FALSE)), 5]<-1
data[[i]][c(which((data[[i]]$wickets=="")==TRUE)), 5]<-0
}

#for finding score of each match in 1st inning
team1_data<-list(length(data))
team1_final_score<-list(length(data))
for (i in 1:length(data)) {
  team1_data[[i]]<-filter(data[[i]], inning==1)
  team1_data[[i]]$runs<-as.numeric(as.character(team1_data[[i]]$runs))
  team1_data[[i]]$extras<-as.numeric(as.character(team1_data[[i]]$extras))
  
  team1_final_score[[i]]<-sum(team1_data[[i]]$runs)+sum(team1_data[[i]]$extras)
}

#for finding Z0 Average score
Z0<-sum(unlist(team1_final_score))/length(data)

#for finding cummilative score in 1st inning of each match 
library(dplyr)

cumulative_sum<-list(length(data))
for(i in 1:length(data)){
    c=0
  x<-array(length(team1_data[[i]]$over))
  team1_final_score[i]<-as.numeric(as.character(team1_final_score[i]))
  team1_data[[i]]$over<-as.numeric(as.character(team1_data[[i]]$over))
  team1_data[[i]]$wickets<-as.numeric(as.character(team1_data[[i]]$wickets))
  team1_data[[i]]$runs<-as.numeric(as.character(team1_data[[i]]$runs))
  team1_data[[i]]$extras<-as.numeric(as.character(team1_data[[i]]$extras))
  for(j in 1:length(team1_data[[i]]$over)){
    c=c+team1_data[[i]]$runs[j]+team1_data[[i]]$extras[j]
    x[j] <- c
  }
  cumulative_sum[[i]]<- c(x)
}

for(i in 1:length(data)){
  
  c=0
  x<-array(length(team1_data[[i]]$wickets))
  team1_data[[i]]$wickets<-as.numeric(as.character(team1_data[[i]]$wickets))
  for (j in 1:length(team1_data[[i]]$wickets)) {
    c=c+team1_data[[i]]$wickets[j]
    x[j]= c
  }
  team1_data[[i]]$wickets <- c(x)
}

