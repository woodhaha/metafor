print.gosh.rma <- function(x, digits, ...) {

   if (!inherits(x, "gosh.rma"))
      stop("Argument 'x' must be an object of class \"gosh.rma\".")

   if (missing(digits))
      digits <- x$digits

   cat("\n")

   cat("Model fits attempted:", formatC(length(x$fit), format="f", digits=0), "\n")
   cat("Model fits succeeded:", formatC(sum(x$fit), format="f", digits=0), "\n\n")

   res.table <- matrix(NA, nrow=ncol(x$res), ncol=6)

   res.table[,1] <- apply(x$res, 2, mean, na.rm=TRUE)
   res.table[,2] <- apply(x$res, 2, min, na.rm=TRUE)
   res.table[,3] <- apply(x$res, 2, quantile, .25, na.rm=TRUE)
   res.table[,4] <- apply(x$res, 2, quantile, .50, na.rm=TRUE)
   res.table[,5] <- apply(x$res, 2, quantile, .75, na.rm=TRUE)
   res.table[,6] <- apply(x$res, 2, max, na.rm=TRUE)

   res.table <- formatC(res.table, format="f", digits=digits)

   colnames(res.table) <- c("mean", "min", "Q1", "median", "Q3", "max")
   rownames(res.table) <- colnames(x$res)

   if (ncol(x$res) == 6)
      rownames(res.table)[2] <- "Q"

   ### add blank row before the model coefficients in meta-regression models

   if (ncol(x$res) > 6)
      res.table <- rbind(res.table[seq_len(5),], "", res.table[6:nrow(res.table),,drop=FALSE])

   ### remove row for tau^2 in FE models

   if (x$method == "FE")
      res.table <- res.table[-5,]

   print(res.table, quote=FALSE, right=TRUE)

   cat("\n")

   invisible()

}
