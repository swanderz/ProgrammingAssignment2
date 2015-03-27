# style caveat:
#	I've combined Prof Peng's style guidelienes w/ Google's, so:
#	1) Function names are capitalized verbs w/ no spaces
# 	2) variable names have no "_" and lowercase
#	3) I did however use Prof Peng's 8 space indent suggestion
#	ref: <https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml>
MakeCacheMatrix <- function( data.matrix = matrix()) {
	# Create object to store & modify data about a matrix and its inverse
	#
	# Args:
	#	data.matrix: an invertible matrix
	# Returns:
	#	A vector of attribute functions for data.matrix
	
	stored.inv <- NULL
	Set <- function(y) {
		# Set new matrix as env value of data.matrix, and
		# flush cached inverse
		data.matrix <<- y
		stored.inv <<- NULL
	}
	Get <- function() {
		# Get current value of data.matrix
		return(data.matrix)
	}
	SetInv <- function(given.inv) {
		# Set stored value of data.matrix's inverse
		stored.inv <<- given.inv
	}
	GetInv <- function() {
		# Get stored value of data.matrix's inverse
		return(stored.inv)
	}
	list(Set = Set, Get = Get, SetInv = SetInv,
		GetInv = GetInv)
}
CacheSolve <- function(x, ...) {
	# Find inverse of matrix by:
	# 1) Taking matrix's vector of atrributes, 2) checking for cached 
	# inverse of matrix, and either: A) returns stored inverse, or
	# B) calculates, stores, and returns inverse of matrix
	# 
	# Args: 
	#	MakeCacheMatrix object for given matrix
	# Returns:
	# 	Inverse of given matrix

	cached.inv <- x$GetInv()
	if (!is.null(cached.inv)) {  # checks for stored inverse
		message("getting cached data")
		return(cached.inv)
	}
	# calculate, store, and return inverse of matrix
	matrix.given <- x$Get()
	matrix.inv <- solve(matrix.given, ...)
	x$SetInv(matrix.inv)
	matrix.inv
}