# R-programming_week3

My solution to the second programming assignment in R-Programming.

## Explanation

The function `makeCacheMatrix` creates two variables, the variable x that
contains the data and the variable inv, in which  the inverse of the matrix is
stored. Via the mechnism of the so called clojure these variables stay in memory
even if the function that created them is already deleted - finished. This is
due to the fact, that the functions set, get, setinverse and getinverse use them
and are still alive and stored in the returned list object.

The function cacheSolve now uses only these two functions which have still
access to the original variables to store and recall the inverse of the matrix.
