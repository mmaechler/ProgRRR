## MM: This is a "nice" idea ... but it breaks completely, because it *does* increased NAMED(.) by 1 (to 2) !!!
if(FALSE)# it does *not* work when inside a function (that "evals the promise of 'x'")
showAdr <- function(x) {
    if(capabilities("profmem")) {
        tracemem(x)
    } else {
        cat("R version not configured for memory tracing\n")
        .Internal(inspect(x))# also works w/o tracemem
    }
}

## in R, R CMD BATCH, also from ESS: there is *no* copying
## However, in Rstudio copying *does* happen even in these cases!

x <- array(50, dim = c(1000, 50, 40))
.Internal(inspect(x))# also works w/o tracemem
dim(x) <- c(1000*50, 40) # *no* copying // but with* copying in Rstudio
.Internal(inspect(x))# also works w/o tracemem
x[3] <- pi               # *no* copying // but *with* copying in Rstudio
.Internal(inspect(x))# also works w/o tracemem

## Alternatively, use Hadley Wickham's  `pryr` package
if(require("pryr"))
	address(x)
	
## But this "encapsulation" also "fails", i.e. *does* copying (because "a function typically mentions its arguments") 
x <- array(50, dim = c(1000, 50, 40))
strsplit(capture.output(.Internal(inspect(x)))[1], " ")[[1]][1]
dim(x) <- c(1000*50, 40)
strsplit(capture.output(.Internal(inspect(x)))[1], " ")[[1]][1]
x[3] <- pi
strsplit(capture.output(.Internal(inspect(x)))[1], " ")[[1]][1]
## Why ? --- capture.output -- using eval() "also" increasing NAMED - (still "why?")

x <- 1:9; .Internal(inspect(x)); invisible(eval(.Internal(inspect(x)))); writeLines(capture.output(.Internal(inspect(x))))
##--> the last one has increased NAMED() to 2 !! -- can we use a function here -- yes we can :
c.o <- function() writeLines(capture.output(.Internal(inspect(x))))
x <- 1:9; .Internal(inspect(x)); invisible(eval(.Internal(inspect(x)))); c.o() # as above: last has NAM(2)
debugonce(capture.output) # and do again:
x <- 1:9; .Internal(inspect(x)); invisible(eval(.Internal(inspect(x)))); c.o()

## and inside capture.output(), immediately type
.Internal(inspect(x))# already shows NAMED 2  --- why ??

x[3] <- 11L; .Internal(inspect(x)) # ==> changed (because it has NAM(2) above ...

## BUT  this works:
x <- 1:9; .Internal(inspect(x)); x[3] <- 11L; .Internal(inspect(x))  # unchanged even in RStudio as on *ONE* line
.Internal(inspect(x)) # address still not changed *BUT*  NAM=2 !!
x
.Internal(inspect(x)) # ditto:  address still not changed but NAM=2
x[3] <- 11L; .Internal(inspect(x)) # where as it *has* changed here because NAM was 2


proc.time()
