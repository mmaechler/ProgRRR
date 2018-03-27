###  Reading and *EXPLORING*  the vignette of package  'proftools':

## Install the package if we don't have it:
if(!require("proftools"))  install.packages("proftools")

packageDescription("proftools")## ok, by  __Luke Tierney__ an R Core guru

## We explore the installed package  _manually_ here
## The ./doc/  sub-directory (= sub-folder) has vignettes (and potentially more):
(doc.dir <- system.file(package="proftools", "doc"))

list.files(doc.dir)
                 ## vvvvvvvvvvvvvvv to get full path names:
list.files(doc.dir, full.names=TRUE)

## --> now open (my slightly adapted version ofthe vignette)  ./proftools-vignette.R


## or show the pdf
system(paste("evince ", file.path(doc.dir, "proftools.pdf"), "&"))
