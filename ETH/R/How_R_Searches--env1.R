#### From  "o beautiful code"
####        "How R Searches and Finds Stuff" (March 29, 2012)
####	     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
####  by Suraj Gupta
####	 ~~~~~~~~~~~
#### http://obeautifulcode.com/R/How-R-Searches-And-Finds-Stuff/
#### ===========================================================

### Early section
### "Play time with Environments (don’t skip me)"
###  -------------------------------------------

## environments are just objects.  lets create one.
myEnvironment  <- new.env()
## print it out...
myEnvironment
m  <- myEnvironment
m$abc <- LETTERS  # changing m ..
ls(myEnvironment) #            ---> !

## every environment (except R_EmptyEnv) has an enclosure.
## Who's myEnvironment's enclosure?  find out using parent.env()
parent.env( myEnvironment ) # --> It's "R_GlobalEnv"

## Who's R_GlobalEnv's enclosing environment?
## Its the environment called "package:stats" (in my installation, might be different on yours)
parent.env( parent.env( myEnvironment ) )
## MM: it's the last "attached" package in search(), i.e. at position [2] or [3] in search()
head(search())
## and one further -- still in the search()
parent.env(parent.env( parent.env( myEnvironment ) ))
## .. continue till "base":

## Excursion -- from  help(Reduce) ---
Funcall <- function(f, ...) f(...)
## n-fold iterate of a function, functional style:
Iterate <- function(f, n = 1)
    function(x) Reduce(Funcall, rep.int(list(f), n), x, right = TRUE)

lapply(seq_along(search()),
       function(n) Iterate(parent.env, n=n) (globalenv()))
nth.G.parent <- function(n, env) Iterate(parent.env, n=n) (env)
lapply(seq_along(search()), nth.G.parent, env = globalenv())

dropP <- function(x) { attr(x, "path") <- NULL ; x }
nth.G.parent <- function(n, env) dropP(Iterate(parent.env, n=n) (env))
lapply(seq_along(search()), nth.G.parent, env = globalenv())

## CARE: you can destroy your working search() path by dropping attributes!!

## Here's two other ways to ask the same question.
## This R_GlobalEnv must be special if it can retrieved using the identifier
## .GlobalEnv AND a function globalenv().  We'll discuss R_GlobalEnv later.
parent.env( .GlobalEnv )
## < environment: package:stats >
## ...
## ...
## ...
if(FALSE)## MM:
    parent.env( globalenv() )
identical(.GlobalEnv,
          globalenv() )# TRUE indeed

## The empty environment is accessed using emptyenv()
emptyenv()
## < environment: R_EmptyEnv >

## Why does myEnvironment have a funky name 0x0000000006ce0920?
## That's just the location of the environment in memory.

## We can add a friendly name by assigning a "name" attribute.
attr( myEnvironment, "name") <- "Cool Name"
## Unfortunately R doesn't replace the funky name with the friendly name when printing.
## MM: now (R 3.0.x) it *does*:
myEnvironment
## We can use the environmentName() function to verify our cool name
environmentName( myEnvironment )
## [1] "Cool Name"

## lets create a numeric object
myValue <- 5

## Unless you try hard, when you create an object it is automatically placed in the
## "current" or "local" environment, accessible using environment()
environment()
## < environment: R_GlobalEnv >

## And we can query an environment for all objects in the frame using ls().
## Here we verify that objects myEnvironment and myValue are both placed in the
## local environment, R_GlobalEnv
ls( envir = environment() )
## [1] "myEnvironment" "myValue"

## We can override the default behavior and create an object in an environment other
## than the local environment.
## To do this use the assign() function.  Here we create variable "myLogical" inside
## myEnvironment.
## We use ls() to verify that there was nothing in myEnvironment before the assignment,
## and again ls() verifies that "myLogical" is inside myEnvironment after the assignment
ls( envir = myEnvironment )
## character(0)
assign( "myLogical", c(FALSE, TRUE), envir = myEnvironment )
ls( envir = myEnvironment )
## [1] "myLogical"

## We can retrieve any named object from any given environment using the get() function
get( "myLogical", envir = myEnvironment )
## [1] FALSE  TRUE
nm <- "myLogical"
get(nm, envir = myEnvironment )
## How could I have known that myEnvironment's enclosure would be R_GlobalEnv before
## I created the object?
## Once again, R uses the local environment as the default value.
## You can change an environment's enclosure using the replacement form of parent.env().
myEnvironment2 <- new.env()
parent.env( myEnvironment2 )
## < environment: R_GlobalEnv >
parent.env( myEnvironment2 ) <- myEnvironment
parent.env( myEnvironment2 )
## < environment: 0x0000000006ce0920 >
##         attr(,"name")
## [1] "Cool Name"

## Here's another way to understand the "current" or "local" environment
## We create a function that calls environment() to query for the local environment.
## When R executes a function it automatically creates a new environment for that function.
## This is useful - variables/objects created inside the function will live in the new local environment.
## We call Test() to verify this.  We can see that Test() does NOT print R_GlobalEnv.
## We didn't created any objects within Test().  If we had, they would live in the "0x0000000006ce9b58"
## environment while Test() is running.  When the function completes executing, the environment dies.
Test <- function() { print( environment() ) }
environment()
## < environment: R_GlobalEnv >
Test()
## < environment: 0x0000000006ce9b58 >
Test() ## different
environment(Test)
## globalenv

## And why not...who's the enclosing environment?
## There's more than meets the eye here.  We'll go deeper in a bit...
Test2 <- function() { print( parent.env( environment() ) ) }
Test2()
## < environment: R_GlobalEnv >
## =====
environment(Test2)

