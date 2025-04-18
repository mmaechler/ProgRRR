##__ Original : Norm Matloff's  "Art of R ..."  Code/Ch7/envexample1.R

###--- Lexical Scoping ("Syntactic": *where* is the function defined) -----------------
##     ===============
## h() finds 'd' inside f()  and finds 'w'   in  globalenv()
##
f <- function(y) {

  h <- function() d*(w+y)
  d <- 8
  h() ## is the same as
      ## return(h())
}

if(FALSE) ## not yet at beginning --- the same but showing environments!
f <- function(y) {

  h <- function() {
      cat("h: "); print(ls(environment()))
      d*(w+y)
  }

  print(ls(environment(h)))
  d <- 8
   ## h's environment is the local environment() of f(); ==> also contains 'd'

   print(environment(h))
   cat("environment(h):              "); print(ls(environment(h)))
    cat("inside f - the same as '(h)':"); print(ls(environment()))
    cat("the same? ", identical(environment(h), environment()), "\n")
   cat("environment(f) [=globalenv]: "); print(ls(environment(f))) # = Globalenv

   h()
}

w <- 10
f(3)

rm(w)
f(3)
h()
## Sometimes we think we rather "want"  **dynamic scoping**
## but R uses  "only" syntactic scoping :
g <- function(a) {
        w <- 9
        f(a)
}

g(3) ## --> error:

## w is *not* found:  it is in caller (function)
## but neither in h or f  nor in globalenv
w <- 5
g(3) # works

##------------------ Functions returning Functions ----------------
## --> the result functions are **closures**  (in a stricter sense),
## namely functions with non-trivial environment, or
##
##  Closure :=   function + data  , i.e.
##           =   function + non-trivial environment

## Useful practical example:
?splinefun
?approxfun
?ecdf

example(splinefun) ## runs all code from the *help* page  'Examples' section

## Upps!  New example did redfine `f` !
f ## prints .... last line:
## <environment: ......>   i.e., *not* the globalenv
## Looking at the function body:  where's the funny  'z'  from ??

ls( environment(f) ) # aha, from the environment
ls.str( environment(f) )

