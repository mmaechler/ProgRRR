## Find all "extract" (aka "subset" aka "indexing") methods -->  ?Extract
(allxmet <- methods("["))

(xmet <- .S3methods("[")) # some visible some not
str(xmet)
attr(xmet,"info")

## repeat the above after !!
require(Matrix)

## drop all attributes, including class:  as.vector()
(nmet <- as.vector(xmet))

metList <- lapply(nmet, function(nm) getAnywhere(nm))
metList[1:2] # hmm, too complex
str(metList[1])

## better:
(clss <- sub("\\[\\.", "", nmet))
metLis <- lapply(clss, function(cl) getS3method("[", cl))
names(metLis) <- nmet
head(metLis)

## or
metLis <- sapply(nmet, function(nm) getS3method("[", sub("\\[\\.", "", nm)))

## Note to MM and R-core
.S3PrimitiveGenerics ## base
.knownS3Generics     ## base
utils:::getKnownS3generics
tools:::.get_S3_primitive_generics
tools:::.get_internal_S3_generics # contains primitives, too
## etc, seem pretty messy and somewhat "incosistent"

##--> generalize
allS3methods <- function(f) {
    if (!is.character(f)) f <- deparse(substitute(f))
    stopifnot(length(f) == 1)
    ## methods():  some visible, some not
    nmet <- as.vector(.S3methods(f))## as.vector: drop all attributes, incl. class
    ## remove function name and "." from beginning : e.g. for  "[."
    cls <- sub(paste0("^", gsub("\\[","\\\\[", f), "\\."),
	       "", nmet)
    setNames(lapply(cls, function(cl) getS3method(f, cl)),
	     nmet)
}

x.met <- allS3methods("[")
str(x.met)

repl.met <- allS3methods("[<-")
str(repl.met)
repl.met

str( M.met <- allS3methods("Math") )
