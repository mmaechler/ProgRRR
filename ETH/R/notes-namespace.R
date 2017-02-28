##  Package  vs  Namespace  -- example "stats" :
l1 <- ls("package:stats")
l2 <- ls(envir= asNamespace("stats"))
all(l1 %in% l2) ## -> TRUE
setdiff(l2, l1) ## -> those only in namespace == "the hidden objects" !

example(pbirthday)

packageDescription("sfsmisc")
sfsmisc::pr # and *type* [TAB]ulator --> popup menu of about 4 objects
sfsmisc::primes
getAnywhere("primes")
getAnywhere("primes.")

##-> librrary

##-> help ( asNamespace ) -- Has interesting example :
##   ===================
## Only for for the daring ones, trying to get into the bowels :

lsNamespaceInfo <- function(ns, ...) {
    ns <- asNamespace(ns, base.OK = FALSE)
    ls(..., envir = get(".__NAMESPACE__.", envir = ns, inherits = FALSE))
}
allinfoNS <- function(ns) sapply(lsNamespaceInfo(ns), getNamespaceInfo, ns=ns)

## in 2 parts:
lsNamespaceInfo("stats")
## character vector

str(ns.st <- allinfoNS("stats"))
ls(ns.st $ lazydata) # no lazy data


str(ns.st4 <- allinfoNS("stats4"))
ls(ns.st4 $ lazydata) # no lazy data

str(ns.M <- allinfoNS("MASS"))
ls(ns.M $ lazydata) #  about 88

## see also   ? getNamespaceImports

`::` # calls getExportedValue

