# The caching example given by R D Peng
# https://github.com/rdpeng/ProgrammingAssignment2
makeVector <- function(x = numeric()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}

cachemean <- function(x, ...) {
        m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- mean(data, ...)
        x$setmean(m)
        m
}

vec <- makeVector(1:6)
vec$set(1:9)
print(is.null(vec$getmean()))
cachemean(vec)
print(is.null(vec$getmean()))
cachemean(vec)
