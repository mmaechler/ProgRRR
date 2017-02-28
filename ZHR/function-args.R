objs <- mget(ls("package:base", all=TRUE), inherits = TRUE)
funs <- Filter(is.function, objs)
str(funs)
args <- lapply(funs, formals)
nargs <- sapply(funs, function(f) length(formals(f)))
narg2 <- sapply(args, length)
narg3 <- lengths(args)
narg4 <- vapply(args, length, 1L)

identical(nargs, narg2)

head(sort(nargs))
names(which(nargs == 0))
(fun0 <- funs[nargs == 0])

head(sort(nargs, decreasing=TRUE))
