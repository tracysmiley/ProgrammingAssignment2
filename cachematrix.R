## Put comments here that give an overall description of what your
## functions do

## Creates variable shared across enviornments to support caching capability.

makeCacheMatrix <- function(x = numeric()) {
    m2 <- NULL
    set <- function(y) {
        x <<- y
        m2 <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) m2 <<- solve
    getsolve <- function() m2
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}

## Write a short comment describing this function

cachesolve <- function(x, ...) {
## Checks if variable exists and retrusn it is it is found
    m2 <- x$getsolve()
    if(!is.null(m2)) {
        message("getting cached data")
        return(m2)
    }
## If not found then run the solve routine and set the varia le for future caching.
    data <- x$get()
    m2 <- solve(data, ...)
    x$setsolve(m2)
    m2
}
