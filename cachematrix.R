## The first function creates matrix and the second function calculates the inverse of the matrix in the cache.

## The first function, makeCacheMatrix creates a matrix ‘x’, which is really a list containing ## a function to
##
## set the value of the matrix
## get the value of the matrix
## set the value of the inverse matrix
## get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
    y <- NULL
    set <- function(y) {
    x <<- y
    y <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) y <<- solve
  getinverse <- function() y
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## CacheSolve function returns a matrix that is the inverse of matrix 'x'

cacheSolve <- function(x, ...) {
  y <- x$getinverse()
  if(!is.null(y)) {
    message("getting cached data")
    return(y)
  }
  data <- x$get()
  y <- solve(data)
  x$setinverse(y)
  y
}
