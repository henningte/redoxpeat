% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rp_rescale.R
\name{rp_rescale}
\alias{rp_rescale}
\title{Rescales a scaled numeric vector.}
\usage{
rp_rescale(target, reference)
}
\arguments{
\item{target}{A numeric vector that should be rescaled.}

\item{reference}{A numeric vector that has been scaled with
\code{\link[base:scale]{scale}} and from which the attributes for rescaling
are taken.}
}
\value{
\code{target} multiplied with the scale attribute value of
\code{reference} and with the center attribute value of \code{reference} added.
}
\description{
\code{rp_rescale} rescales a numeric vector relative to a reference vector
that has been scaled with \code{\link[base:scale]{scale}}.
}
\examples{
# get a scaled vector
a <- scale(rnorm(100, 5, 2))

# rescale a
a_re <- rp_rescale(a, a)

}
