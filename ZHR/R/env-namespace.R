#### ---- "How R Searches and Finds Stuff" -- part 2 --- Extended by M.Maechler
####       ------------------------------

(e <- environment( mean )) # namespace:base
parent.env(e)# globalenv of course (because 'e' is)
try( asNamespace("package:base") ) # but
     asNamespace("base") # works

##--
nm.stats <- environment( lm ) # <environment: namespace:stats>
str(L1 <- ls(envir = nm.stats)) # chr [1:1092] "[.acf" "[.formula" "[.terms" "[.ts" ...
str(L2 <- ls("package:stats"))  # chr [1: 446] "acf" "acf2AR" "add.scope" "add1" "addmargins" ...
str(intersect(L1, L2))
identical(L2, intersect(L1, L2)) # TRUE
## L2 is true subset of L1
setdiff(L1, L2) ## 600 something objects, e.g., coef.default
setdiff(L2, L1) ## 0 obj.

identical(asNamespace("stats"), nm.stats) # TRUE
(pkg.stats <- as.environment("package:stats"))
parent.env(pkg.stats) ## -> the next in the search path

coef # S3 generic function
methods("coef") # 5 methods -- all with "*" : "hidden"
getAnywhere("coef.default")
## now that we know it is in stats

stats ::: coef.default ## *need* 3 ":" because it is "hidden": only in namespace

lm <- 1:10 # in globalenv

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
(IM <- parent.env( asNamespace("MASS") )) # ->  imports:MASS
       ## = everything that MASS imports
ls(IM) ## 118 objects -- many from 'stats'
##-- as we have seen in the source's  MASS/NAMESPACE file


## --- New *after* 2016 lecture : --------
##' @title Collect all Parents of an Environment
##' @param e any 'environment'
##' @return a (named) list of environments: The "full chain" from 'e'
##' @author Martin Mächler
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
try( rm(lm))
ap1 <- allParents(environment(lm))
ap1 # maybe "too muchl" --> use
str(ap1, give.attr=FALSE)


## now we (may or may not) know that already:
(AutoL <- ap1[[length(ap1) - 2]]) # the 'Autoloads'
identical(AutoL, .AutoloadEnv)    # indeed


