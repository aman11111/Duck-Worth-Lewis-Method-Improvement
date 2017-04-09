setwd("F:\\")
df <- read.table("ggevent.log", sep = ",", header = FALSE)
#(giving names to the columns)
colnames(df)<-c("ai5","x","y","sdkv","event","ts","z","timestamp","game_id")
library(dplyr)
#(removing columns which are not required further)
df1<-select(df, -x, -y, -z, -sdkv, -ts, -game_id)

library(stringr)
#(breaking the timestamp column into 3 columns and picking the last one)
df2<-str_split_fixed(df1$timestamp, ":", 3)
df1[,3] <- df2[,3]
#(giving the column a name)
colnames(df1)[3] <- "time"
#(spliting time column into three parts and picking the last column into df1)
df4<-str_split_fixed(df1$`time`, " ", 3)
df1[,3]<-df4[,3]
#(spliting event column into three parts and picking the last column into df1)
df5<-str_split_fixed(df1$event, ":", 3)
df1[,2]<-df5[,3]
#(spliting ai5 column into three parts and picking the last column into df1)
df7<-str_split_fixed(df1$ai5, ":", 3)
df1[,1]<-df7[,3]
#(again spliting time column into three parts and converting it into seconds)
df8<-str_split_fixed(df1$time, ":", 3)

for(i in 1:length(df1$ai5)){
  df8[i,1]<- 60*(as.numeric(df8[i,2]))+as.numeric(df8[i,3])
}
df1[,3]<-df8[,1]
View(df1)
#(finding total number of different users, here denoted by L)
L<-unique(df1$ai5)
#(making a list of there activities, here list is defined by K)
K<-list(length(L))
for(i in 1:length(L)){
  K[[i]]<- df1[which(df1$ai5==L[i]),]
}
#(removing unwanted elements)
rm(df, df2, df4, df5, df7, df8)

#(finding number of rows in every element of the list)
myvec <- sapply(K, NROW)

#(removing elements of the list which have only one row)
z<-which(myvec==1)
for(i in 1:length(z)){
  K[[z[i]-i+1]]<-NULL
}
#(making all value of time numeric)
for(j in 1:length(K)){
  K[[j]]$time<-as.numeric(K[[j]]$time)
  
}


#(continuous two ggstart problem )
for(j in 1:length(K)){
  for(i in 1:(length(K[[j]]$time)-1)){
    if(K[[j]]$event[i]==" ggstart" && K[[j]]$event[i+1] ==" ggstart"){
      K[[j]]$time[i+1]<-K[[j]]$time[i]
    }
    else{
      i<-i+1
    }
  }
  
}


#(continuous two ggstop problem )
for(j in 1:length(K)){
  y=0
  for(i in 1:(length(K[[j]]$time)-1-y)){
    if(K[[j]]$event[i]==" ggstop" && K[[j]]$event[i+1] ==" ggstop"){
      K[[j]]$time[i]<-K[[j]]$time[i+1]
    }
    else{
      i<-i+1
    }
  }
  
}

#(for removing one ggstart row from continuous two gstart )
for(j in 1:length(K)){
  i<-1
  while(i<length(K[[j]]$time)){
    if(K[[j]]$event[i]== " ggstart" && K[[j]]$event[i+1] == " ggstart"){
      K[[j]]<-K[[j]][-i, ]
    }
    else{
      i<-i+1
    }
  }
  
}

#(for removing one ggstop row from continuous two gstop )

for(j in 1:length(K)){
  i<-1
  while(i<length(K[[j]]$time)){
    if(K[[j]]$event[i]== " ggstop" && K[[j]]$event[i+1] == " ggstop"){
      K[[j]]<-K[[j]][-i, ]
    }
    else{
      i<-i+1
    }
  }
  
}

#(code for conjugative ggstop and ggstart)
for(j in 1:length(K)){
  i<-2
  while(i<length(K[[j]]$time)){
    if(K[[j]]$event[i]== " ggstop" && K[[j]]$event[i+1] == " ggstart"){
      if(K[[j]]$time[i+1]-K[[j]]$time[i]<30 && K[[j]]$event[i-1]==" ggstart"){
        K[[j]]$time[i+1]<-K[[j]]$time[i-1]
        K[[j]]<-K[[j]][c(-i, -(i-1)), ]
      }
      else{
        i<-i+1
      }
    }
    else{
      i<-i+1
    }
  }
  
}

#(removing matrices which have only one row after removing rows in conjugative ggstop and ggstart)
myvec <- sapply(K, NROW)
m<-which(myvec==1)

for(i in 1:length(m)){
  K[[m[i]-i+1]]<-NULL
}

#(total number of valid sessions)
avgarray<-list(length(K))
countvalid<-rep(0, length(K))

for(j in 1:length(K)){
  countvalid[j] =0
  avgarray[[j]]<-rep(0, (length(K[[j]]$event)-1))
  for(i in 1:(length(K[[j]]$event)-1)){
    if(K[[j]]$event[i] ==" ggstart" && K[[j]]$event[i+1]==" ggstop"){
      if(K[[j]]$time[i+1]-K[[j]]$time[i]>60){
        avgarray[[j]][i]<- K[[j]]$time[i+1]-K[[j]]$time[i]
        countvalid[j] =countvalid[j] +1
      }
      else{
        avgarray[[j]][i]<- 0
        i<-i+1
      }
    }
  }
}

sum(countvalid)

#(total number of sessions)
count<-rep(0, length(K))

for(j in 1:length(K)){
  count[j] =0
  for(i in 1:(length(K[[j]]$event)-1)){
    if(K[[j]]$event[i] ==" ggstart" && K[[j]]$event[i+1]==" ggstop"){
      if(K[[j]]$time[i+1]-K[[j]]$time[i]>=1){
        count[j] =count[j] +1
      }
      else{
        i<-i+1
      }
    }
  }
}

sum(count)

#(for average time of a session)
h<-unlist(avgarray)
v<-which(h==0)
h<-h[-v]
mean(h)

print("total number of sessions are")
sum(count)

print("total number of valid sessions are")
sum(countvalid)

print("average of valid sessions is")
mean(h)

