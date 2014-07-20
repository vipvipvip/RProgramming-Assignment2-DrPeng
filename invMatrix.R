makeCacheMatrix <- function (x=numeric(), ...) {
  ## x is a matrix that needs inversion
  ## set the value of the matrix
  ## get the value of the matrix
  ## set the inversion
  ## get the inversed matrix
  
  minv <- NULL
  set <- function(y) {
    x <<- y
    minv <<- NULL
  }
  
  get <- function() x
  setinverse <- function(inverse) minv <<- inverse
  
  # modified this function solve if minv was not set via cacheSolve() first
  getinverse <- function() {
    if(!is.null(minv)) {
      return(minv)
    } else {
      minv = solve(x,...)
      minv
    }
  }
  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

cacheSolve <- function (x, ...) {
  # x is a matrix
  # The following function calculates the inverse of the matrix 
  # created with makeCacheMatrix(). However, it first checks to see if the matrix
  # has already been inverted. If so, it gets the inverse from the cache and skips 
  # the computation. Otherwise, it inverses the matrix and sets the value of the inverted matrix
  #in the cache via the setmean function.
  
  minv <- x$getinverse()
  if(!is.null(minv)) {
    message("getting cached data")
    return(minv)
  }
  data <- x$get()
  minv <- solve(data, ...)
  x$setinverse(m)
  minv
}
