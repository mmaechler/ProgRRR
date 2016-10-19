
# R programming -- organization details

* *Lecturer*: [Martin Mächler, Seminar für Statistik, ETH Zürich)](https://stat.ethz.ch/~maechler)
* *Duration*: 2 days
* *Date & Time*:
	- 20.Oct.2016, 9:00--17:00  (2 coffee breaks, lunch break)
	- 21.Oct.2016, 9:00--~16:30            ditto

* *Venue* (@ Zürich Oerlikon) :
  Zentrum for Weiterbildung, Schaffhauserstrasse 228
  Tram 10 or 14, exit at "Berninaplatz".
  [Anreise](http://www.zwb.uzh.ch/anreise.html).


* *Target audience*:

	Advanced R users.  Knowledge about basic R language data types such as
	lists or the `lapply()` function is assumed, and typically you have
	written your own R functions before.

	(For introductory R courses please revisit the course list.)

* *Course language*: English (German if applicable to all participants)

* *Course description*
R has become one of the most efficient and versatile tool sets for solving
problems (in data analysis, visualization, teaching, rapid prototyping etc)
because it has been a design principle "turn ideas into software, quickly
and faithfully" (John Chambers, author of S, the precursor of R).
This enables you to build your own reliable tools for your
tasks, using R as an extendible programming language. The course provides a
thorough understanding of the R language.

* Topics include
    - Data types and classes of the R (programming) language
    - Functions in R -- _"Everything that happens is a function call"_
    - Programming tools: run time analysis, debugging; handling errors, warnings.
    - Good programming styles and practices
    - Writing reproducible R code - writing R packages

* Further mostly optional topics
 to be touched or treated detailed, depending on the participants needs:
    -  Namespaces, environments etc: _"Where does R find stuff?"_
    -  Object oriented programming with S3 and S4
    -  R code parallelization
    -  Using compiled code (C, C++, Fortran)


----



* Web Pages for Material and Interaction -- on [Github](https://github.com):
    - Material:    [MMaechler/ZHR](https://github.com/mmaechler/ProgRRR/tree/master/ZHR)
    - Interaction: In `ZHR` folder of https://github.com/Progr-RRR/ZHR:
	 [ZH R](https://github.com/mmaechler/ProgRRR/tree/master/ZHR)


* It would be _nice_ but not necessary to use a "pre-release" of R, i.e.,
  __"R 3.3.1 patched"__ instead of just `R 3.3.1`, for the main reason that
  all the help pages about package `methods` __S4__ methods and classes
  have been thoroughly reworked, including the examples.

	- Windows users get it from
	  https://cloud.r-project.org/bin/windows/base/rpatched.html
	- Mac users from http://r.research.att.com/
	  selecting __`R-3.3-branch`__
	  or download directly the [signed pkg](http://r.research.att.com/mavericks/R-3.3-branch/R-3.3-branch-mavericks-signed.pkg)
    - Linux users need to install from source, getting it from
	  http://stat.ethz.ch/R/daily/ (from our _"SfS"_ (Seminar fuer
	  Statistik, Math Dept., ETH Zurich)), typically downloading the "tar
	  ball" directly [R-patched.tar.gz](http://stat.ethz.ch/R/daily/R-patched.tar.gz).

	  __Before__ trying to install that, on Ubuntu (or similar Debian descendant), use
```sh
       sudo apt-get build-dep r-base-dev
 ```
      More information for these is available from CRAN's  
	  https://cloud.r-projec.org/bin/linux/ubuntu/   and  
	  https://cloud.r-projec.org/bin/linux/debian

* If you cannot get such an R version installed (and in any case), you can
  always browse the documentation including all help pages of _"R patched"
  at  http://stat.ethz.ch/R-manual/R-patched/doc/html/
  (provided by the "SfS", ETH and myself for more than 15 years), and
  analogously for `R-devel`.

* In addition to R, and R scripts, I will use `R markdown` scripts
  regularly; for these  RStudio (https://www.rstudio.com) is very handy and
  convenient to use.

* With R, bring along also the following packages installed:  
	-  knitr
	-  microbenchmark
	-  fortunes
	-  proftools
	-  magrittr
	-  nor1mix
	-  pryr
	-  devtools
	-  sfsmisc

and if possible (not always installable easily)
	-  Rmpfr
	-  Rgraphviz

In R, this happens most easily via
```r
	for(p in c("fortunes","knitr","microbenchmark","proftools",
					   "magrittr","nor1mix","pryr","devtools","sfsmisc"))
	   if(!require(p, character.only=TRUE)) install.packages(p)
    ## these two separately because delicate
	install.packages("Rmpfr")
	install.packages("Rgraphviz")
```
