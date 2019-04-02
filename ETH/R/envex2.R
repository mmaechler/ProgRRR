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


## to make it work:
environment(s) <- e1
s()
environment(s) <- e2
s()

### Let's assume an auxiliary function in package

## 1) print it to console
## 2) copy&paste to *.R  script
## 3) "fix the bug"
## 4) "send to console" (evaluate in globalenv)
## 5) This is not sufficient

## but rather you must additionally get it to have the correct "enclosing environment"
environment(<thisFun>) <- asNamespace("pkgName")
