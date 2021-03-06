% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{aeschbacher2012}
\alias{aeschbacher2012}
\title{EAC and EDC values for various HS derived from \insertCite{Aeschbacher.2012;textual}{redoxpeat}.}
\format{
A data frame with 15 rows and 7 variables:
\describe{
  \item{EAC}{A numeric vector with the EAC [mmol/g].}
  \item{EDC}{A numeric vector with the EAC [mmol/g].}
  \item{figure_id}{An integer representing the point number in figure 4 in
  \insertCite{Aeschbacher.2012;textual}{redoxpeat}.}
  \item{figure_label}{A character vector with the sample label used in
  figure 4 in \insertCite{Aeschbacher.2012;textual}{redoxpeat}.}
  \item{sample_type}{A character vector with the sample type (name and type
  of reference material).}
  \item{catalog_number}{A character vector with the IHSS catalog number for
  the HS, where available.}
  \item{comment}{A character vector with a comment how the EAC/EDC values
  were normalized.}
}
}
\source{
\insertCite{Aeschbacher.2012;textual}{redoxpeat}
}
\usage{
aeschbacher2012
}
\description{
A dataset containing EAC and EDC values for several IHSS reference HS as
derived from \insertCite{Aeschbacher.2012;textual}{redoxpeat}. Data were
derived from figure 4 in the publication using the R package
\insertCite{Poisot.2011}{redoxpeat}.
}
\references{
\insertAllCited{}
}
\keyword{datasets}
