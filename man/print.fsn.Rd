\name{print.fsn}
\alias{print.fsn}
\title{Print Method for 'fsn' Objects}
\description{
   Print method for objects of class \code{"fsn"}.
}
\usage{
\method{print}{fsn}(x, digits, \dots)
}
\arguments{
   \item{x}{an object of class \code{"fsn"}.}
   \item{digits}{integer specifying the number of decimal places to which the printed results should be rounded (if unspecified, the default is to take the value from the object).}
   \item{\dots}{other arguments.}
}
\details{
   The output shows the results from the fail-safe N calculation.
}
\value{
   The function does not return an object.
}
\author{
   Wolfgang Viechtbauer \email{wvb@metafor-project.org} \cr
   package website: \url{http://www.metafor-project.org/} \cr
   author homepage: \url{http://www.wvbauer.com/}
}
\references{
   Viechtbauer, W. (2010). Conducting meta-analyses in R with the metafor package. \emph{Journal of Statistical Software}, \bold{36}(3), 1--48. \url{http://www.jstatsoft.org/v36/i03/}.
}
\seealso{
   \code{\link{fsn}}
}
\keyword{print}
