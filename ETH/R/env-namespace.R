### Week 6/7 ---- "How R Searches and Finds Stuff" -- part 2 -------

###'  Packages -- Namespaces

(e <- environment( mean )) # namespace:base
parent.env(e)# globalenv of course (because 'e' is)
## asNamespace()  or  getNamespace()  {as*() calls get*() if needed}
try( asNamespace("package:base") ) # not ok, but
try( asNamespace("base") ) # is correct
asNamespace("Matrix") # etc .. for all packages


##--
nm.stats <- environment( lm ) # <environment: namespace:stats>
str(L1 <- ls(envir = nm.stats)) # chr [1:1092] "[.acf" "[.formula" "[.terms" "[.ts" ...
str(L2 <- ls("package:stats"))  # chr [1: 446] "acf" "acf2AR" "add.scope" "add1" "addmargins" ...
str(intersect(L1, L2))
identical(L2, intersect(L1, L2)) # TRUE
## L2 is true subset of L1
setdiff(L2, L1) ## empty
setdiff(L1, L2) ## 600 something objects, e.g., coef.default

identical(asNamespace("stats"), nm.stats) # TRUE
(pkg.stats <- as.environment("package:stats"))
parent.env(pkg.stats) ## -> the next in the search path

parent.env(nm.stats)  ## -> the __imports__ of stats

coef # S3 generic function
methods("coef") # 6 methods -- all with "*" : "hidden"
getAnywhere("coef.default")
## now that we know it is in stats

stats ::: coef.default ## *need* 3 ":" because it is "hidden": only in namespace

`:::`  # now a Primitive (was a very simple 3-line function !!)

lm <- 1:10 # in globalenv  --- is "masking" the real lm() ...

stats :: lm # the real 'lm' function
stats ::: lm # works too

require(Rmpfr)##--> Messages
## Loading required package: Rmpfr
## Loading required package: gmp

## Attaching package: ‘gmp’

## The following objects are masked from ‘package:sfsmisc’:

##     factorize, is.whole

## The following objects are masked from ‘package:base’:

##     %*%, apply, crossprod, matrix, tcrossprod

##--------------
asNamespace("MASS")
(IM <- parent.env( asNamespace("MASS") ))
ls(IM) ## 118 objects -- many from 'stats'
##-- as we have seen in the source's  MASS/NAMESPACE file

##' all "parent environments" of a given env. 'e'
allParents <- function(e) {
    r <- e ## r := {collection of environments we encounter}
    EE <- emptyenv()
    while(!identical(EE, p <- parent.env(e))) {
        e <- p       # e := (new) current env.
        r <- c(r, e) # add e to the collection
    }
    r <- c(r, EE)
    setNames(r, vapply(r, environmentName, ""))
}

ap1 <- allParents(environment(lm))
str(ap1) # maybe "too muchl" --> use
str(ap1, give.attr=FALSE)
b
## now we know that already:
ap1[[length(ap1) - 2]] ## the 'Autoloads'

### ------------ 2018  Smart student question : ------------

## Q:  Can we put an "own" environment into the search() path ?
## A:  Yes, and that can be important: The answer is
attach
## --  and there's a very nice (;-)  function { I wrote .. so I should find it nice ;-) }
sfsmisc :: sourceAttach
## which takes  some.R   file, and source()s that into a new location in the search path
