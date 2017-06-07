Ly1<- function(u, w){
  a=0.08410118
  b=0.22092111
  k=0.25869662
  
  Ly1 <- k*exp(-(a*u+b*w))
  print(Ly1)
}



#For finding Resourse percentenge
A1<- matrix(nrow = 120, ncol = 10)
u<-seq(from = 1, to = 21, by = (1/6))
u<-u[-121]
w<-c(1:10)
s=1
for (i  in u) {
  
  for (j in w) {
    A1[s,j] <- ((1-exp(-Ly1(i-1,j-1)*(20-i+1)))*100)
  }
  s<-s+1
}
#x[1,1] <- 100
#print(x3)

#for exporting data to excel file
#library(xlsx)
#write.xlsx(x, "C:\\Users\\Sumit\\Desktop\\20-20(orignal_lastyear)_DL_Table.xlsx")

Ly1<- function(u, w){
  a=0.01523922
  b=0.12879007
  k=0.11903328
  
  Ly1 <- k*exp(-(a*u+b*w))
  print(Ly1)
}



#For finding Resourse percentenge
A2<- matrix(nrow = 120, ncol = 10)
u<-seq(from = 1, to = 21, by = (1/6))
u<-u[-121]
w<-c(1:10)
s=1
for (i  in u) {
  
  for (j in w) {
    A2[s,j] <- ((1-exp(-Ly1(i-1,j-1)*(20-i+1)))*100)
  }
  s<-s+1
}


Ly1<- function(u, w){
  a=-0.01301051
  b=0.05633227
  k=0.07704898
  
  Ly1 <- k*exp(-(a*u+b*w))
  print(Ly1)
}



#For finding Resourse percentenge
A3<- matrix(nrow = 120, ncol = 10)
u<-seq(from = 1, to = 21, by = (1/6))
u<-u[-121]
w<-c(1:10)
s=1
for (i  in u) {
  
  for (j in w) {
    A3[s,j] <- ((1-exp(-Ly1(i-1,j-1)*(20-i+1)))*100)
  }
  s<-s+1
}

Ly1<- function(u, w){
  a=0.02692388
  b=0.15093453
  k=0.16832787
  
  Ly1 <- k*exp(-(a*u+b*w))
  print(Ly1)
}



#For finding Resourse percentenge
A4<- matrix(nrow = 120, ncol = 10)
u<-seq(from = 1, to = 21, by = (1/6))
u<-u[-121]
w<-c(1:10)
s=1
for (i  in u) {
  
  for (j in w) {
    A4[s,j] <- ((1-exp(-Ly1(i-1,j-1)*(20-i+1)))*100)
  }
  s<-s+1
}

A<-matrix(nrow = 120, ncol = 10)
A[1:36,]<-A1[1:36,]
A[37:90,]<-A4[37:90,]
A[91:120,]<-A3[91:120,]


y9<-A[,10]
x<-c(1:120)

library(ggplot2)

df<-data.frame(x=x, y=y9)

qplot(data=df,
      x=x,
      y=y9,
      geom=c("line", "point"),xlab = "Balls", ylab = "After 9th Wicket")+
  geom_smooth(se=F)
stat_smooth(method = "loess")
after9wicket = predict(loess(y9~x), x)

dev.copy(png,'after9wicket.png')
dev.off()

y8<-A[,9]

df<-data.frame(x=x, y=y8)

qplot(data=df,
      x=x,
      y=y8,
      geom=c("line", "point"),xlab = "Balls", ylab = "After 8th Wicket")+
  geom_smooth(se=F)
stat_smooth(method = "loess")
after8wicket = predict(loess(y8~x), x)
dev.copy(png,'after8wicket.png')
dev.off()

y7<-A[,8]

df<-data.frame(x=x, y=y7)

qplot(data=df,
      x=x,
      y=y7,
      geom=c("line", "point"),xlab = "Balls", ylab = "After 7th Wicket")+
  geom_smooth(se=F)
stat_smooth(method = "loess")
after7wicket = predict(loess(y7~x), x)
dev.copy(png,'after7wicket.png')
dev.off()


y6<-A[,7]

df<-data.frame(x=x, y=y6)

qplot(data=df,
      x=x,
      y=y6,
      geom=c("line", "point"),xlab = "Balls", ylab = "After 6th Wicket")+
  geom_smooth(se=F)
stat_smooth(method = "loess")
after6wicket = predict(loess(y6~x), x)
dev.copy(png,'after6wicket.png')
dev.off()

y5<-A[,6]

df<-data.frame(x=x, y=y5)

qplot(data=df,
      x=x,
      y=y5,
      geom=c("line", "point"),xlab = "Balls", ylab = "After 5th Wicket")+
  geom_smooth(se=F)
stat_smooth(method = "loess")
after5wicket = predict(loess(y5~x), x)
dev.copy(png,'after5wicket.png')
dev.off()

y4<-A[,5]

df<-data.frame(x=x, y=y4)

qplot(data=df,
      x=x,
      y=y4,
      geom=c("line", "point"),xlab = "Balls", ylab = "After 4th Wicket")+
  geom_smooth(se=F)
stat_smooth(method = "loess")
after4wicket = predict(loess(y4~x), x)
dev.copy(png,'after4wicket.png')
dev.off()

y3<-A[,4]

df<-data.frame(x=x, y=y3)

qplot(data=df,
      x=x,
      y=y3,
      geom=c("line", "point"),xlab = "Balls", ylab = "After 3th Wicket")+
  geom_smooth(se=F)
stat_smooth(method = "loess")
after3wicket = predict(loess(y3~x), x)
dev.copy(png,'after3wicket.png')
dev.off()

y2<-A[,3]

df<-data.frame(x=x, y=y2)

qplot(data=df,
      x=x,
      y=y2,
      geom=c("line", "point"),xlab = "Balls", ylab = "After 2th Wicket")+
  geom_smooth(se=F)
stat_smooth(method = "loess")
after2wicket = predict(loess(y2~x), x)
dev.copy(png,'after2wicket.png')
dev.off()

y1<-A[,2]

df<-data.frame(x=x, y=y1)

qplot(data=df,
      x=x,
      y=y1,
      geom=c("line", "point"),xlab = "Balls", ylab = "After 1th Wicket")+
  geom_smooth(se=F)
stat_smooth(method = "loess")
after1wicket = predict(loess(y1~x), x)
dev.copy(png,'after1wicket.png')
dev.off()
y0<-A[,1]

df<-data.frame(x=x, y=y0)

qplot(data=df,
      x=x,
      y=y0,
      geom=c("line", "point"),xlab = "Balls", ylab = "After 0th Wicket")+
  geom_smooth(se=F)
stat_smooth(method = "loess")
after0wicket = predict(loess(y0~x), x)
dev.copy(png,'after0wicket.png')
dev.off()

table<- cbind(after0wicket,after1wicket,after2wicket,after3wicket,after4wicket,after5wicket,
              after6wicket,after7wicket,after8wicket,after9wicket)

A[1,1]<-100
A[13:108,]<-table[13:108,]
View(A)

#for a common plot of all wickets
library(ggfortify)
library(zoo)
wick0<-A[,1]
wick1<-A[,2]
wick2<-A[,3]
wick3<-A[,4]
wick4<-A[,5]
wick5<-A[,6]
wick6<-A[,7]
wick7<-A[,8]
wick8<-A[,9]
wick9<-A[,10]
autoplot(ts(cbind(wick0, wick1, wick2, wick3, wick4, wick5, wick6, wick7, wick8, wick9), start = c(0,0), frequency = 1), facets=FALSE, xlab="overs remaining")

