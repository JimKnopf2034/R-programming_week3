# This is the code for the Week 3 programming assignment

# Task 1
#----------
#
# Create a clojure that mimiks a matrix object, containing the matrix, its
# inverse and a setter and a getter.
makeCacheMatrix <- function(x = matrix()){
    inv <- NULL
    set <- function(y){
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    list( set = set, get = get,
        setinverse = setinverse, getinverse = getinverse
        )
}

# decorate the matrix object with a caching function infact this function uses
# the mechnism of the clojure to access the variables defined in the function
# makeCacheMatrix
cacheSolve <- function(x, ...){
     inv <- x$getinverse()
     if (!is.null(inv)){
         print("Getting the cached Values")
         return(inv)
     }
     data <- x$get()
     inv <- solve(data, ...)
     x$setinverse(inv)
     inv
}


mat <- matrix(rnorm(36), nrow=6, ncol=6)
specialMat <- makeCacheMatrix(mat)
print(is.null(specialMat$getinverse()))
cacheSolve(specialMat)
print(is.null(specialMat$getinverse()))
cacheSolve(specialMat)
