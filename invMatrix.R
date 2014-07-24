# here is how to test these two functions:
## amatrix = makeCacheMatrix(matrix(c(1,2,3,4), nrow=2, ncol=2))
## amatrix$get()         # Returns original matrix
## cacheSolve(amatrix)   # Computes, caches, and returns    matrix inverse
## amatrix$getinverse()  # Returns matrix inverse
## cacheSolve(amatrix)   # Returns cached matrix inverse using previously computed matrix inverse

## amatrix$set(matrix(c(0,5,99,66), nrow=2, ncol=2)) # Modify existing matrix
## cacheSolve(amatrix)   # Computes, caches, and returns new matrix inverse
## amatrix$get()         # Returns matrix
## amatrix$getinverse()  # Returns matrix inverse


makeCacheMatrix <- function (x=numeric(), ...) {
  ## this function is a list vector with gets/set for matrix
  ## its purpose is to cache the inverse if not already set
  ## and return the 
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
  
  # modified this function to call solve if minv was not set via cacheSolve() first
  # this is extra and beyond what the assignment called for.
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
  # in the cache via the setinverse function.
  
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
