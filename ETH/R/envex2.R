s <- function() a+b
s() # error

e1 <- new.env()
e1$a <- 1:3
e1$b <- 1000


e2 <- new.env()
e2$a <- 10:20
e2$b <- 100^2

eval(expression( a+b ), envir = e1)# ok
eval(expression( a+b ), envir = e2)# ok
eval(     quote( a+b ), envir = e1)# ok
eval(quote( s() ), envir = e1)# error
environment(s)

## to make it work, use the powerful and hence "dangerous"  `environment<-` :
environment(s) <- e1
s() # works
environment(s) <- e2
s() # works ... differently
tt <- function() { a <- 77; b <- 33; s()}
tt()

### Let's assume an auxiliary function in package that needs to be improved.

## 1) print it to console
## 2) copy&paste to *.R  script
## 3) "fix the bug"
## 4) "send to console" (evaluate in globalenv)
## 5) This is not sufficient
##
## but rather you must additionally get it to have the correct "enclosing environment"
environment(<thisFun>) <- asNamespace("pkgName")

## e.g.,
median
methods(median)
##--> median.default
methods(quantile)
sink("quantile.default.R") # ==> "console output" goes to file
getAnywhere("quantile.default")
sink() # end the previous  sink()ing ..

## or {slightly nicer, also keeps  `quantile.default <- ...`}:
dump("quantile.default", file="quant.R", envir = asNamespace("stats"))
## "fix" it: for demo: change defaults 
##    for 'probs' (to give 9 octiles), and `digits = 2`
source("quant.R") ## use the modified ("fixed") version of the function
environment(quantile.default) <- asNamespace("stats")
str(quantile.default)
## find("quantile.default")
set.seed(32); x <- rt(27, df=2)
round(sort(x),2) # compactly show "data"
quantile(x) # note that quantile() is unchanged, but the default *method* is ..
