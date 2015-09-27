## Matrix inversion finds use in many practical applications. For optimization problems involving
# large matrices, matrix-inversion can be very computationally expensive. It is important therefore to
# cache time-consuming computations to avoid computing them repeatedly. The following two functions cache
# the inverse of a matrix, given that the matrix is invertible.

## makeCacheMatrix creates a list which contains functions to:
## 1. set the value of the matrix to be inverted
## 2. get  the value of the matrix to be inverted
## 3. set the value of the inverse of the matrix
## 4. get the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {

  inverse<-NULL
  set<-function(B){
    A<<-B
    inverse<<-NULL
  }
   get<-function()x
   setinverse<-function(solve) inverse<<-solve
   getinverse<-function()inverse
   list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}

# ------------------------------------------------------------------

# To use, assign a variable, z, to the list obtained in makeCacheMatrix:
#   z<-makeCacheMatrix(mat) where mat is the nonsingular matrix 
# Typing  z$get() returns the matrix which was given as input.

# ------------------------------------------------------------------

# The second function takes as an input the list of functions created using makeCacheMatrix. The function
# first checks to see if the matrix inverse has already been computed; if it has, it returns the inverse.
# If not, it computes it and returns its value.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse<-x$getinverse()
  if(!is.null(inverse)){
    message("getting cached data")
    return(inverse)
  }
  data<-x$get()
  inverse<-solve(data,...)
  x$setinverse(inverse)
  inverse
}

# ------------------------------------------------------------------

# Example: 
# vec<-c(1,0,5,2,1,6,3,4,0)
# A<- matrix(vec,nrow=3)
# z<-makeCacheMatrix(A)
# cacheSolve(z)

# ------------------------------------------------------------------