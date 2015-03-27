#Here are some easy tests you can run to make sure your code is working:

m <- matrix(c(-1, -2, 1, 1), 2,2)
x <- makeCacheMatrix(m)
x$get()
     [,1] [,2]
[1,]   -1    1
[2,]   -2    1

inv <- cacheSolve(x)
inv
     [,1] [,2]
[1,]    1   -1
[2,]    2   -1

> inv <- cacheSolve(x)
getting cached data
> inv
     [,1] [,2]
[1,]    1   -1
[2,]    2   -1


#PS To get an identity matrix, use diag():
> diag(x = 1, 3, 3)
     [,1] [,2] [,3]
[1,]    1    0    0
[2,]    0    1    0
[3,]    0    0    1