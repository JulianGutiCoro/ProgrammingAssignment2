## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# This function creates a special matrix. It stores a matrix and chaches its inverse.
makeCacheMatrix <- function(x = matrix()) { # Creo la función que guarda las cosas en el caché
      
      i <- NULL
      set <- function(y) { # guarda la información en el cahcé
            x <<- y
            i <<- NULL
      } 
      get <- function() x
      setinverse <- function(inverse) i <<- inverse
      getinverse <- function() i
      list(set = set, get = get, # Creo la lista que guardará las cosas en el caché
           setinverse = setinverse,
           getinverse = getinverse)
}


# Write a short comment describing this function

# This function checks if the inverse function has already been calculated. If not, it  calculates de inverse.
cacheSolve <- function(x, ...) { ## Creo la función que resuelve la inversa de la matrix
      i <- x$getinverse()
      if(!is.null(i)) { ## Se busca la matriz en el caché
            message("getting cached matrix inverse")
            return(i)
      }
      data <- x$get() ## Si no está en el caché, entonces resuelvo la inversa de la matrix
      i <- solve(data, ...)
      x$setinverse(i)
      i
}


B <- makeCacheMatrix(A) # Ejercicio de comprobación de las funciones
cacheSolve(B)
cacheSolve(B)
