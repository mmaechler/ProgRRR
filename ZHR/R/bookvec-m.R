# class "bookvec" of vectors that count writes of their elements

# each instance of the class consists of a list whose components are the
# vector values and a vector of counts

# construct a new object of class bookvec
newbookvec <- function(x) {
   tmp <- list()
   tmp$vec <- x  # the vector itself
   tmp$wrts <- rep(0,length(x))  # counts of the writes, one for each element
   class(tmp) <- "bookvec"
   return(tmp)
}

##' Construct a new object of class bookvec -- MM style
newbookvec <- function(x) {
   tmp <- list(vec = x,  # the vector itself
               wrts = rep(0,length(x)))  # counts of the writes, one for each element
   class(tmp) <- "bookvec"
   tmp
}

# function to read
"[.bookvec" <- function(bv,subs) {
   return(bv$vec[subs])
}

# function to write
"[<-.bookvec" <- function(bv,subs,value) {
   bv$wrts[subs] <- bv$wrts[subs] + 1  # note the recycling
   bv$vec[subs] <- value
   return(bv)
}

bv1 <- newbookvec(5:2)
bv1[2] <- 4
str(bv1)
bv1[] <- bv1[]+ 3

print.bookvec <- function(x, ...) {
        cat("vec:\n"); print(x$vec)
        cat("counts:\n"); print(x$wrts)
        invisible(x)
}
        
bv1
