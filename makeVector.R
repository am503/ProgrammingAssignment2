# Caching the mean of a Vector part 1 - R programming course

# Alright so the makeVector function stores a list of functions to be used with a certain vector to be
# input. 

makeVector<-function(x=numeric()){
  # set the value of the mean to null
  m<-NULL
  # this sets a new vector if we wish to change the vector. it then assignes the mean (m) to NULL again.
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  # get gets the vector 
  get<-function()x
  # setmean sets the mean 
  setmean<-function(mean) m<<-mean
  # getmean gets the mean
  getmean<-function()m
  #list then stores the functions set, get, setmean and getmean
  list(set=set,get=get,setmean=setmean,getmean=getmean)
}

# Upon sourcing the code, we can have a<-makeVector(<data>).

# a$get() returns the vector
# a$set(<new data>) assigns to y which is then renamed to x a new vector

# Note: the mean is actually calculated in cachevector.R


