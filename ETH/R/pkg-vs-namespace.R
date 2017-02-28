require("nor1mix")
(lsP <- ls("package:nor1mix"))
(lsN <- ls(asNamespace("nor1mix"))) ## has a few more objects

## and this is the difference:  The non-exported aka "hidden" objects in nor1mix
setdiff(lsN, lsP)

