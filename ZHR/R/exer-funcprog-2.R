## 1.  Create a function that creates functions that compute the ith
## [central moment](http://en.wikipedia.org/wiki/Central_moment) of a numeric
## vector. You can test it by running the following code:

moment <- function(k) {
    function(x, na.rm=FALSE, ...) {
        m <- mean(x, na.rm=na.rm, ...)
        mean( (x - m)^k, na.rm=na.rm, ...)
    }
}

m1 <- moment(1)
m2 <- moment(2)

x <- runif(100)
stopifnot(all.equal(m1(x), 0))
stopifnot(all.equal(m2(x), var(x) * 99 / 100))

###---------------
## 2.  Create a function `pick()` that takes an index, `i`, as an argument and
##     returns a function with an argument `x` that subsets `x` with `i`.

pick <- function(i) function(x) x[[i]]

lapply(mtcars, pick(5))
# should do the same as this
lapply(mtcars, function(x) x[[5]])
## --------------------------------

identical(lapply(mtcars, pick(5)),
          lapply(mtcars, function(x) x[[5]]))  # so it does as desired

##    ... how can we "improve" the last lapply()?




identical(lapply(mtcars, pick(5)),
          lapply(mtcars, `[[`, 5))
