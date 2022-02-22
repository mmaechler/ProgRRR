<!-- new in Feb.2017; working from previous
  ~/Vorl/R/Progr_w_R/2016-webpage/index.md -->
# Programming w/ *R* for *R*eproducible *R*esearch: Prog R^3

## Table of Contents

### Week 1 -- Introduction
 - Reproducible Reseach -->  Rmarkdown, Sweave, Knitr, all based on Donald
   Knuth's "noweb".
   What happens in R Studio when klicking "Knit": Knitr (/ Sweave) and
   Pandoc; Graphically, Kieran
   Healy's (see [here](https://kieranhealy.org/resources/)) visualization:
   [Rmarkdown Diagram](https://polybox.ethz.ch/index.php/s/7vlx3zTAAqkoGyX).

 - Rmarkdown example for (https://cran.r-project.org/doc/FAQ/R-FAQ.html) [Question 7.31](https://cran.r-project.org/doc/FAQ/R-FAQ.html#Why-doesn_0027t-R-think-these-numbers-are-equal_003f);
 	[R/10x0.1-num.Rmd](R/10x0.1-num.Rmd)

   In R:
   
       Everything that **exists** is an object;  
       Everything that **happens** is a function call

 - Is that true?  Which function is called in `x <- 3` ? [R/functions-1.R](R/functions-1.R)

### Week 2 -- Objects, Function Calls, "Functions everywhere"
 - Hadley Wickham's  Advanced R: [http://adv-r.had.co.nz]
 - "Quiz" of Chapter 1 "Data Structures" --> `attributes`, atomic vectors,
   general vectors -- including `list()`s
 - _Everything that happens is a function call_ (more):	[R/functions-1.R](R/functions-1.R),
   notably help pages  `?c` (Details: output type via "hierarchy"): R _coerce_s objects
   to "convenient" type; further, see help on `[`, etc.
 - Generic functions `c()`, `[`, ...  `methods(<fun>)` to see them all.
 - Replacement functions: `dim<-`, `names<-`, `[<-`
 - _Everything that exists is an object_ (more): [R/type-mode-class.Rmd](R/type-mode-class.Rmd),
    shows `typeof()`, `class()`, `mode()` of atomic vectors and more, including "language objects".


### Week 3 -- Functions, their Environments, `search()` path, ...

 - Recapitulate:  [R/functions-2.Rmd](R/functions-2.Rmd)
 - Functions in packages in R: [R/packages-search.Rmd](R/packages-search.Rmd)
 - The three parts of every (non-`.Primitive`) function: ....
 - Repeat and learn more on functions, reading H.Wickam's chapter [6. Functions](http://adv-r.had.co.nz/Functions.html)
 - Lexical Scoping - `environment` [R/envexample1.R](R/envexample1.R), and the small [R/envex2.R](R/envex2.R).
 - `environment`s : Beginnig of "Advanced R"s [8. Environments](http://adv-r.had.co.nz/Environments.html)

### Week 4

 - Recap __Functions__:
    [Our modified functional-prog.Rmd](R/functional-prog.Rmd) excerpt of
    [H.Wickham's functional programming](http://adv-r.had.co.nz/Functional-programming.html) chapter.
 -  [The initial R session ("Play time ...")](R/How_R_Searches--env1.R),
	somewhat extended, of ***How R Searches and Finds Stuff***
 - We look again at H.Wickham's [8. Environments](http://adv-r.had.co.nz/Environments.html)
 - Functions --> environments:
 - `ls(), get(), assign(), find(), ls.str(), new.env(), parent.env(), globalenv(), emptyenv()`,
	and the first two figures in *How R Searches and Finds Stuff*

### Homework: Study the `new_counter` and `counter_one()` example of
 [functional-prog.Rmd](R/functional-prog.Rmd); then ask questions in class.

### Week 5

 - The `counter_one()` example (homework above): Q ?
 - **"R is slow"** etc:
   "***Premature optimization is the root of all evil***", [Donald
  Knuth](http://en.wikiquote.org/wiki/Donald_Knuth)
 - Rather: Test, test, and test again; using `all.equal(target, current,
  tolerance = 10^-8)`
 - NB: Good R packages contain a sub directory (sub folder) `./tests/` !!
   (Examples: `sfsmisc`, `copula`, `lme4`, ..., **all** standard R packages)
 - typical issue about [for()
  loop](http://stackoverflow.com/questions/2908822/speed-up-the-loop-operation-in-r)
  from Stackoverflow.

 - functions `system.time()` and `proc.time()`
  -- User Q about ['matrix vs. data.frame'](https://stat.ethz.ch/pipermail/r-help/2014-March/372321.html)
  on the R-help mailing list (March 2014). -- a first look at Bill
  Dunlap's solution + more, as Rmd script [matrix_df_timing.Rmd](R/matrix_df_timing.Rmd).
 - [Our (modified) "Performance.Rmd"](R/Performance.Rmd) from
  [Hadley Wickham's book chapter
  "Performance"](http://adv-r.had.co.nz/Performance.html).
 - Package `microbenchmark`: nice, (but partly doubtful says R core guru Luke Tierney)


### Week 6

 - continuing the topic 'Performance' (our `Performance.md`,  above)

#### More about profiling:

 - Hadley's "Profiling"](http://adv-r.had.co.nz/Profiling.html)
 - Luke Tierney's `proftools` package:
    [Explore `proftools` vignette](R/proftools-ex.R).

#### Packages and (their) Namespaces -- wrap up

 - Packages and their Namespaces: Why are namespaces needed: Rmd
    [whyNamespaces.Rmd](R/whyNamespaces.Rmd).

 - Finish *How R Searches and Finds Stuff* (from Week 4): Namespaces, imports

 - Packages and namespaces: [env-namespace.R](R/env-namespace.R)

 - Looking at R packages, source and "binary"; at first
 - The one slide about packages in search()[the "one" slide](R/packages-search.Rmd)


### Week 7

#### Packages and namespaces: final / Q & A

 - What does `library() / require()` do? [require-pkg-namespace.Rmd](R/require-pkg-namespace.Rmd)

 - The ["2x2 kinds of R packages"](package-kinds.pdf)
   (source -- binary; folder -- zipped)

#### Short outlook into  __Regular Expressions__
 - All good languages have them (R, perl, python, PHP, java, emacs-lisp, ...):
    http://www.regular-expressions.info/rlanguage.html

 - Help pages for `grep` and `regexp`.

 - [Reg.Exp. Cheat Sheet](https://www.rstudio.com/wp-content/uploads/2016/09/RegExCheatsheet.pdf)
   (RStudio contributed cheat sheets)

   R code for that : [reg-ex.Rmd](R/reg-ex.Rmd)

 - "Show off":  `regexplain` (github only) package:
     https://github.com/gadenbuie/regexplain#readme

--------------




## Miscellaneous Information

### Lecture attestation (Testat):

In order to obtain the ECTS credit point you have to pass the exam -- answering some questions, and writing R code - in a `*.Rmd` (R Markdown file) at the end of the teaching block. ... not in 2020 due to the Corona lockdown.

### Recommended Reading <!-- {#recommended-reading .heading} -->

-   Norman Matloff (2011) The Art of R Programming - A tour of
    statistical software design.\
    no starch press, San Francisco. ***on stock at Polybuchhandlung (CHF 42.-)***;
	see [online](http://www.nostarch.com/artofr.htm) for data, R code.
-   Hadley Wickham (2013 ff) ***Advanced R***, [online](http://adv-r.had.co.nz/)\
    *more advanced than our course; partly focused on his own packages*
-   Suraj Gupta (March 29, 2012)  ***How R Searches and Finds Stuff***,
    [online](http://obeautifulcode.com/R/How-R-Searches-And-Finds-Stuff/);\
    Tough read, but helpful with its nice illustrations. Do consider
    [Duncan Murdoch's note about it](https://stat.ethz.ch/pipermail/r-help/2014-March/372036.html) with minor caveats.

### Miscellaneous on Programming (with R) <!-- {#miscellaneous-on-programming-with-r .heading}  -->

-   "Literate Programming" by Donald Knuth
-   "The Elements of Programming Style" by Kernighan and Plauger:
    [Wikipedia,](http://en.wikipedia.org/wiki/The_Elements_of_Programming_Style),\
    [Quotes](http://www.softwarequotes.com/showquotes.aspx?id=574&name=P.)


---
[Martin Maechler](https://stat.ethz.ch/~maechler),
[Seminar for Statistics](https://stat.ethz.ch/),
[ETH Zurich](https://www.ethz.ch).
