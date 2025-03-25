## In R,
## Everything that **exists** is an object;
## Everything that **happens** is a function call :

## In the slides "Using R, Part 2 (2012)", we were looking at function f.maxi().
## I wrote on the BB:
## The return value of a function is the value of the last evaluated function call
c
## Help page:
?c #===>  Read the "hierarchy" part in Details
`<-`
`[`

`## What *function* is  `[` ?
x <- 10:20
`:`
x[2]   # is exactly the same as
`[`(x, 2)
`[`(x, 2:3)
`:`(3, 7)
is.function(`:`)


 
# everything that happens is a function call -- which function here ?
x



















"Read (incl. Parse), Eval, Print - Loop" # REPL


##=>
print
methods("print") # *many*   --- do also have a look the help page  ?methods



class(`[`)
class("[") #  " and `   work both (in such contexts: function *name* or __object__ itself)
typeof(`[`)
typeof(`c`)
typeof(ls)
`[<-`(x,2,13) # is almost the same as
x[2] <- 13    # << (here `x` is changed)
methods("[<-")

## The difference between "[" and "[[" already shows with a simple named vector:
x <- 1:10
names(x) <- LETTERS[1:10]# does *not* call 'names' function
x
Q <- quantile(rnorm(50)) ; Q
sum(x) # it is a vector
x["C"]
x[["C"]]
`names<-`(x,letters[1:10] )
x <- `names<-`(x,letters[1:10] )
attributes(x)

## Atomic objects:  numeric, character, logical,... vectors
## ---------------  and even matrices of those:
is.atomic(diag(4))

D  <- diag(4)
D
dim(D) <- NULL   # ... a function call:  which function is called here?
D
`dim<-`(D, c(4,4))
D <- diag(1:4); D # matrix ... but can also be treated as a vector:
D[7:9]
D[11]

`names<-`
typeof(`names<-`) # builtin
class (`names<-`) # "function"
class(class)

`dim<-`
