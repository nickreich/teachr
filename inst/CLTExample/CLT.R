#Sample from a uniform distribution
hist(runif(10000,0,1))
qqnorm(runif(10000,0,1))

#Number of simulations
nsim<-1000
#sampling the mean from a sample of size n from a uniform(0,1) distribution 
CLT.unif.mean<-function(n){out<-mean(runif(n,0,1));return(out)}
#qqnorm plots for sample size of 1,5,10,100
par(mfrow=c(2,2))
for (i in c(1,5,10,100)){qqnorm(replicate(nsim,CLT.mean(i)),main=paste0(i))}




#define the mixture distribution 
rmix<-function(n){
        b<-rbinom(n,1,.5)
        out<-b*rnorm(n,0,1)+(1-b)*rnorm(n,4,1)
        return(out)
}

#Sample from a mixture distribution
par(mfrow=c(1,2))
dat<-rmix(1000)
hist(dat)
qqnorm(dat)

CLT.mix.mean<-function(n){out<-mean(rmix(n));return(out)}
#qqnorm plots for sample size of 1,5,10,100
par(mfrow=c(3,3))
for (i in c(1,2,3,4,5,6,7,8,9)){qqnorm(replicate(nsim,CLT.mix.mean(i)),main=paste0(i))}
par(mfrow=c(3,3))
for (i in c(1,2,3,4,5,6,7,8,9)){
        dat<-replicate(nsim,CLT.mix.mean(i))
        hist(dat,main=paste0("n=",i),freq=FALSE);points(density(dat),type="l",col="red",lwd=5)
        points(c(-800:800)/100,dnorm(c(-800:800)/100,mean(dat),sd(dat)),col="blue",type="l",lwd=3)
        }




