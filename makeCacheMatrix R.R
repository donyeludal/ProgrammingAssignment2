## Put comments here that give an overall description of what your
## functions do
## Input "x" is a matrix
## and "k" as the solved value as a null isntead of "m"
## lastly, instead of using "mean" or "solve" I used "Inverse"
makeCacheMatrix <- function(x = matrix()){
  k <- NULL
  set <- function(y){
  x <<- y
  k <<- NULL
  }
 get <- function() {x}
 setInverse <- function(inverse) {k <<- inverse}
 getInverse <- function() {k}
 list(set = set, get = get, setInverse =  setInverse, getInverse = getInverse)
}

## The same is applied here, "k" as the solved value as a null
## and "Inverse" for the invertible sqaure matrix
cacheSolve <- function(x, ...){
  k <- x$getInverse()
  if(!is.null(k)) {
    message("retrieving cached data")
    return(k)
  }
  mat <- x$get()
  k <- solve(mat, ...)
  x$setInverse(k)
  k
}

Program Trial-------------------------------------------------------

 dmatrix <- makeCacheMatrix(matrix(1:4, nrow=2, ncol=2))
> dmatrix$get()
     [,1] [,2]
[1,]    1    3
[2,]    2    4
> dmatrix$getInverse()
NULL
> cacheSolve(dmatrix)
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> cacheSolve(dmatrix)
retrieving cached data
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> dmatrix$getInverse()
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5



