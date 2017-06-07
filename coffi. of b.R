x<-c(100.0, 96.8, 92.6, 86.7, 78.8, 68.2, 54.4, 37.5, 21.3, 8.3)
b0<-array(length(x))
u<-20
for(i in 1:length(x)){
  
  b0[i] <- -(1/u)*log(1-(x[i]/100))
}

x<-c(96.1, 93.3, 89.2, 83.9, 76.7, 66.6, 53.5, 37.3, 21.0, 8.3)
b1<-array(length(x))
u<-19
for(i in 1:length(x)){
  
  b1[i] <- -(1/u)*log(1-(x[i]/100))
}

x<-c(92.2, 89.6, 85.9, 81.1, 74.2, 65.0, 52.7, 36.9, 21.0, 8.3)
b2<-array(length(x))
u<-18
for(i in 1:length(x)){
  
  b2[i] <- -(1/u)*log(1-(x[i]/100))
}

x<-c(88.2, 85.7, 82.5, 77.9, 71.7, 63.3, 51.6, 36.6, 21.0, 8.3)
b3<-array(length(x))
u<-17
for(i in 1:length(x)){
  
  b3[i] <- -(1/u)*log(1-(x[i]/100))
}

x<-c(84.1, 81.8, 79.0, 74.7, 69.1, 61.3, 50.4, 36.2, 20.8, 8.3)
b4<-array(length(x))
u<-16
for(i in 1:length(x)){
  
  b4[i] <- -(1/u)*log(1-(x[i]/100))
}

x<-c(79.9, 77.9, 75.3, 71.6, 66.4, 59.2, 49.1, 35.7, 20.8, 8.3)
b5<-array(length(x))
u<-15
for(i in 1:length(x)){
  
  b5[i] <- -(1/u)*log(1-(x[i]/100))
}

x<-c(75.4, 73.7, 71.4, 68.0, 63.4, 56.9, 47.7, 35.2, 20.8, 8.3)
b6<-array(length(x))
u<-14
for(i in 1:length(x)){
  
  b6[i] <- -(1/u)*log(1-(x[i]/100))
}

x<-c(71.0, 69.4, 67.3, 64.5, 60.4, 54.4, 46.1, 34.5, 20.7, 8.3)
b7<-array(length(x))
u<-13
for(i in 1:length(x)){
  
  b7[i] <- -(1/u)*log(1-(x[i]/100))
}

x<-c(66.4, 65.0, 63.3, 60.6, 57.1, 51.9, 44.3, 33.6, 20.5, 8.3)
b8<-array(length(x))
u<-12
for(i in 1:length(x)){
  
  b8[i] <- -(1/u)*log(1-(x[i]/100))
}

x<-c(61.7, 60.4, 59.0, 56.7, 53.7, 49.1, 42.4, 32.7, 20.3, 8.3)
b9<-array(length(x))
u<-11
for(i in 1:length(x)){
  
  b9[i] <- -(1/u)*log(1-(x[i]/100))
}

x<-c(56.7, 55.8, 54.4, 52.7, 50.0, 46.1, 40.3, 31.6, 20.1, 8.3)
b10<-array(length(x))
u<-10
for(i in 1:length(x)){
  
  b10[i] <- -(1/u)*log(1-(x[i]/100))
}

x<-c(51.8, 51.1, 49.8, 48.4, 46.1, 42.8, 37.8, 30.2, 19.8, 8.3)
b11<-array(length(x))
u<-9
for(i in 1:length(x)){
  
  b11[i] <- -(1/u)*log(1-(x[i]/100))
}

x<-c(46.6, 45.9, 45.1, 43.8, 42.0, 39.4, 35.2, 28.6, 19.3, 8.3)
b12<-array(length(x))
u<-8
for(i in 1:length(x)){
  
  b12[i] <- -(1/u)*log(1-(x[i]/100))
}

x<-c(41.3, 40.8, 40.1, 39.2, 37.8, 35.5, 32.2, 26.9, 18.6, 8.3)
b13<-array(length(x))
u<-7
for(i in 1:length(x)){
  
  b13[i] <- -(1/u)*log(1-(x[i]/100))
}

x<-c(35.9, 35.5, 35.0, 34.3, 33.2, 31.4, 29.0, 24.6, 17.8, 8.1)
b14<-array(length(x))
u<-6
for(i in 1:length(x)){
  
  b14[i] <- -(1/u)*log(1-(x[i]/100))
}

x<-c(30.4, 30.0, 29.7, 29.2, 28.4, 27.2, 25.3, 22.1, 16.6, 8.1)
b15<-array(length(x))
u<-5
for(i in 1:length(x)){
  
  b15[i] <- -(1/u)*log(1-(x[i]/100))
}

x<-c(24.6, 24.4, 24.2, 23.9, 23.3, 22.4, 21.2, 18.9, 14.8, 8.0)
b16<-array(length(x))
u<-4
for(i in 1:length(x)){
  
  b16[i] <- -(1/u)*log(1-(x[i]/100))
}

x<-c(18.7, 18.6, 18.4, 18.2, 18.0, 17.5, 16.8, 15.4, 12.7, 7.4)
b17<-array(length(x))
u<-3
for(i in 1:length(x)){
  
  b17[i] <- -(1/u)*log(1-(x[i]/100))
}

x<-c(12.7, 12.5, 12.5, 12.4, 12.4, 12.0, 11.7, 11.0, 9.7, 6.5)
b18<-array(length(x))
u<-2
for(i in 1:length(x)){
  
  b18[i] <- -(1/u)*log(1-(x[i]/100))
}

x<-c(6.4, 6.4, 6.4, 6.4, 6.4, 6.2, 6.2, 6.0, 5.7, 4.4)
b19<-array(length(x))
u<-1
for(i in 1:length(x)){
  
  b19[i] <- -(1/u)*log(1-(x[i]/100))
}

#for exponential regression
f <- function(u,w,a,b,k) {k *exp(-(a*u+b*w)) }
u<-rep(c(1:20), each=10)
w<-rep(c(1:10), 20)
y<- c(b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15, b16, b17, b18, b19)
dat <- data.frame(u, w, y)
b0[1]<-0.200
y<- c(b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15, b16, b17, b18, b19)
dat <- data.frame(u, w, y)
fm <- nls(y ~ f(u,w,a,b,k), data = dat, start = c(a=1, b=1,k=1))
co <- coef(fm)
co


