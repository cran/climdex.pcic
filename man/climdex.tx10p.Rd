\name{climdex.tx10p}
\alias{climdex.tx10p}
\title{Percent of Values Below 10th Percentile Daily Maximum Temperature}
\usage{
  climdex.tx10p(ci, freq = c("monthly", "annual"))
}
\arguments{
  \item{ci}{Object of type climdexInput.}

  \item{freq}{Time frequency to aggregate to.}
}
\value{
  A vector containing a timeseries containing values of the
  index on a monthly or annual timescale.
}
\description{
  This function computes the climdex index TX10p.
}
\details{
  This function takes a climdexInput object as input and
  computes the monthly or annual percent of values below
  the 10th percentile of baseline daily maximum
  temperature.
}
\note{
  These functions may calculate slightly different results
  than fclimdex.

  The bootstrapping method is not well defined for cases
  where the base data contains numerous missing values.
  Because of that, this code (and fclimdex) are not very
  robust against missing values with respect to these
  indicies. When computing percentiles inside the base
  period, both this implementation and fclimdex do not
  divide through by the number of non-missing values when
  aggregating the values inside the base period. Instead,
  they divide through by the number of base years minus
  one. This will result in a negative bias when missing
  values are present.
}
\examples{
## Create a climdexInput object from some data already loaded in and
## ready to go.

## Parse the dates into PCICt.
tmax.dates <- as.PCICt(do.call(paste, ec.1018935.tmax[,c("year",
"jday")]), format="\%Y \%j", cal="gregorian")
tmin.dates <- as.PCICt(do.call(paste, ec.1018935.tmin[,c("year",
"jday")]), format="\%Y \%j", cal="gregorian")
prec.dates <- as.PCICt(do.call(paste, ec.1018935.prec[,c("year",
"jday")]), format="\%Y \%j", cal="gregorian")

## Load the data in.
ci <- climdexInput.raw(ec.1018935.tmax$MAX_TEMP,
ec.1018935.tmin$MIN_TEMP, ec.1018935.prec$ONE_DAY_PRECIPITATION,
tmax.dates, tmin.dates, prec.dates, base.range=c(1971, 2000))

## Create a monthly timeseries of the TX10p index.
tx10p <- climdex.tx10p(ci)
}
\references{
  \url{http://cccma.seos.uvic.ca/ETCCDMI/list_27_indices.shtml}
}
\seealso{
  \code{\link{climdexInput.raw}},
  \code{\link{climdexInput.csv}}.
}
\keyword{climate}
\keyword{ts}

