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

