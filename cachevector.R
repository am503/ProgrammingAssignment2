# Caching the mean of a Vector part 2 - R programming course

# x here is the stored list of functions we created in makeVector.R
cachemean<-function(x,...){
  
  m<-x$getmean()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data<-x$get()
  m<-mean(data,...)
  x$setmean(m)
  m
}