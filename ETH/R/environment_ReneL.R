## environment.R
## René Locher  ==== based on M.Maechler's answer to   "How can `environment<-` be useful __in practice__ ?"
## Version: 2016-04-27

require(lattice)

str(iris)
histogram(~ Petal.Width | Species, data = iris)

## or, more explicit
histogram(~ Petal.Width | Species, data = iris,
          panel = panel.histogram)

## Taking modified panel function based on panel.histogram and modifying it
panel.histogramM <-
    function (x, breaks, equal.widths = TRUE, type = "density", nint = round(log2(length(x)) + 1),
              alpha = plot.polygon$alpha, col = plot.polygon$col, border = plot.polygon$border,
              lty = plot.polygon$lty, lwd = plot.polygon$lwd, ..., identifier = "histogram")
{
    plot.polygon <- trellis.par.get("plot.polygon")
    xscale <- current.panel.limits()$xlim
    panel.lines(x = xscale[1] + diff(xscale) * c(0.05, 0.95),
                y = c(0, 0), col = border, lty = lty, lwd = lwd, alpha = alpha,
                identifier = paste(identifier, "baseline", sep = "."))
    if (length(x) > 0) {
        if (is.null(breaks)) {
            breaks <- if (is.factor(x))
                          seq_len(1 + nlevels(x)) - 0.5
                      else if (equal.widths)
                          do.breaks(range(x, finite = TRUE), nint)
                      else quantile(x, 0:nint/nint, na.rm = TRUE)
        }
        h <- hist.constructor(x, breaks = breaks, ...)
        y <- switch(type, count = h$counts, percent = 100 * h$counts/length(x),
                    density = h$density)
        breaks <- h$breaks
        nb <- length(breaks)
        if (length(y) != nb - 1)
            warning("problem with 'hist' computations")
        if (nb > 1) {
            panel.rect(x = breaks[-nb], y = 0, height = y, width = diff(breaks),
                       col = col, alpha = alpha, border = border, lty = lty,
                       lwd = lwd, just = c("left", "bottom"), identifier = identifier)
        }
    }
    grid.text("modified panel function") ## <<< The only difference to original :)
}
## ... and doing some modification in the code above (not shown)


## The environment of panel.histogramM is R_GlobalEnv and not package:lattice
environment(panel.histogramM)

## This call does  __not work__  as the code uses hidden functions of the package lattice:
histogram(~ Petal.Width | Species, data = iris,
          panel = panel.histogramM)

## Now, giving panel.histogramM() the environment of panel.histogram() ...
environment(panel.histogramM) <- environment(panel.histogram)
## makes the plot work!  {and also shows the  "modified panel function"}
histogram(~ Petal.Width | Species, data = iris,
          panel = panel.histogramM)
