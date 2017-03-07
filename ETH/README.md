# Programming with *R* for *R*eproducible *R*esearch

## Table of Contents

### Week 1 -- Introduction
 - Reproducible Reseach -->  Rmarkdown, Sweave, Knitr, all based on Donald
   Knuth's "noweb".
   What happens in R Studio when klicking "Knit": Knitr (/ Sweave) and
   Pandoc; Graphically, Kieran
   Healy's (see [here](https://kieranhealy.org/resources/)) visualization:
   [Rmarkdown Diagram](https://polybox.ethz.ch/index.php/s/7vlx3zTAAqkoGyX).

 - Rmarkdown example for (https://cran.r-project.org/doc/FAQ/R-FAQ.html]) Question 7.31;
 	[R/10x0.1-num.Rmd](R/10x0.1-num.Rmd)

   In R,
   everything that **exists** is an object;
   everything that **happens** is a function call

 - Is that true?  Which function is called in `x <- 3` ? [R/functions-1.R](functions-1.R)

### Week 2 --
 - Hadley Wickham's  Advanced R: [https://adv-r.had.co.nz]
 - "Quiz" of Chapter 1 "Data Structures" --> `attributes`, atomic vectors,
   general vectors -- including `list()`s
 - _Everything that happens is a function call_ (more):	[R/functions-1.R](R/functions-1.R),
   notably help pages  `?c` (Details: output type via "hierarchy"): R _coerce_s objects
   to "convenient" type; further, see help on `[`, etc.
 - Generic functions `c()`, `[`, ...  `methods(<fun>)` to see them all.
 - Replacement functions: `dim<-`, `names<-`, `[<-`
 - _Everything that exists is an object_ (more): [R/type-mode-class.Rmd](type-mode-class.Rmd),
    shows `typeof()`, `class()`, `mode()` of atomic vectors and more, including "language objects".


### Week 3

 - Recapitulate:  [R/functions-2.Rmd](R/functions-2.Rmd)
 - Functions in packages in R: [R/packages-search.Rmd](packages-search.Rmd)
 - The three parts of every (non-`.Primitive`) function: ....
 - Lexical Scoping - `environment` [R/envexample1.R](R/envexample1.R)
 - `environment`s : Look at Wickham's chapter [8. Environments](https://adv-r.had.co.nz/Environments.html)

---
[Martin Maechler](https://stat.ethz.ch/~maechler), [ETH Zurich](https://www.ethz.ch.)




