#### New  for 2025 ---- say more about  "test, test, test!" -----------

### 1.  The function I had added to R
stopifnot
## With comment *and* author indentation ==> look into the true source:

## Online e.g., GH mirro
https://github.com/r-devel/r-svn/blob/main/src/library/base/R/stop.R

## On my computer:
file.show("~/R/D/r-devel/R/src/library/base/R/stop.R")

## ========  help(stopifnot)  :

## Examples:

## NB: Some of these examples are expected to produce an error. To
##     prevent them from terminating a run with example() they are
##     piped into a call to try().

stopifnot(1 == 1, all.equal(pi, 3.14159265), 1 < 2) # all TRUE


m <- matrix(c(1,3,3,1), 2, 2)
stopifnot(m == t(m), diag(m) == rep(1, 2)) # all(.) |=>  TRUE

stopifnot(length(10)) |> try() # gives an error: '1' is *not* TRUE
## even when   if(1) "ok"   works

stopifnot(all.equal(pi, 3.14159265),  2 < 2, (1:10 < 12), "a" < "b") |> try()
## More convenient for interactive "line by line" evaluation:
stopifnot(exprs = {
  all.equal(pi, 3.1415927)
  2 < 2
  1:10 < 12
  "a" < "b"
}) |> try()

eObj <- expression(2 < 3, 3 <= 3:6, 1:10 < 2)
stopifnot(exprObject = eObj) |> try()
stopifnot(exprObject = quote(3 == 3))
stopifnot(exprObject = TRUE)


# long all.equal() error messages are abbreviated:
stopifnot(all.equal(rep(list(pi),4), list(3.1, 3.14, 3.141, 3.1415))) |> try()

# The default error message can be overridden to be more informative:
m[1,2] <- 12
stopifnot("m must be symmetric"= m == t(m)) # |> try()
#=> Error: m must be symmetric

##' warnifnot(): a "only-warning" version of stopifnot()
##'   {Yes, learn how to use do.call(substitute, ...) in a powerful manner !!}
warnifnot <- stopifnot ; N <- length(bdy <- body(warnifnot))
bdy        <- do.call(substitute, list(bdy,   list(stopifnot = quote(warnifnot))))
bdy[[N-1]] <- do.call(substitute, list(bdy[[N-1]], list(stop = quote(warning))))
body(warnifnot) <- bdy
warnifnot(1 == 1, 1 < 2, 2 < 2) # => warns " 2 < 2 is not TRUE  "
warnifnot(exprs = {
    1 == 1
    3 < 3  # => warns "3 < 3 is not TRUE"
})

## --- end of  example(stopifnot)

##============== See its use in  Matrix/tests/  a <large!> Recommended package I maintain:
## ``` shell
pushd ~/R/Pkgs/Matrix-1-7-branch/
wc *.R
"
   130    546   4507 abIndex-tsts.R
    51    227   1683 base-matrix-fun.R
   247    956   8254 bind.R
   400   1591  15506 Class+Meth.R
   100    433   3598 dg_Matrix.R
   182    725   6407 dpo-test.R
    67    221   2235 dtpMatrix.R
   760   3738  28537 factorizing.R
   633   2954  23118 group-methods.R
  1386   6118  49187 indexing.R
  1058   4633  39902 matprod.R
    88    334   2797 matr-exp.R
   153    504   4916 other-pkgs.R
   339   1326  13051 packed-unpacked.R
   196    515   6696 performance.R
  1616   7515  62752 Simple.R
   241   1216   9481 spModel.matrix.R
   184    777   6422 symmDN.R
   191    893   7232 validObj.R
    60    231   1849 write-read.R

  8082  35453 298130 TOTAL
"
## 8000+ lines of test code  (including comments etc):

###---------------------

## Example 2)  --- package 'sfsmisc' (SfS = Seminar für Statistik @ ETH Zurich)
"
 ~/R/Pkgs/sfsmisc-kept-clean
"
## Online:
"
https://github.com/mmaechler/sfsmisc
"                            #######

## ./tests/  contains also several *.Rout.save  files
## -------   ==> testing if  current R output equals to previous R output.
