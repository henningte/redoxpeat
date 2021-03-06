% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{ihss}
\alias{ihss}
\title{Chemical properties of several International Humic Substances Society reference humic substances.}
\format{
A data frame with 37 rows and 15 variables:
\describe{
  \item{type}{A character vector with the type of the IHSS reference HS.}
  \item{name}{A character vector with the HS name.}
  \item{available}{A logical vector indicating if the reference HS is
  still available.}
  \item{catalog_number}{A character vector with the catalog number of the
  reference HS.}
  \item{H2O}{A numeric vector with the water content [g/g].}
  \item{ash_content}{A numeric vector with the ash content (inorganic
  residue in a dry sample) [g/g].}
  \item{C}{A numeric vector with the C content [g/g].}
  \item{H}{A numeric vector with the H content [g/g].}
  \item{N}{A numeric vector with the N content [g/g].}
  \item{O}{A numeric vector with the O content [g/g].}
  \item{S}{A numeric vector with the S content [g/g].}
  \item{P}{A numeric vector with the P content [g/g].}
  \item{d13C}{The isotope signature of \eqn{^{13}}C
  (\eqn{\delta^{13}}C\textsubscript{VPDB}) [\textperthousand].}
  \item{d15N}{The isotope signature of \eqn{^{15}}N
  (\eqn{\delta^{15}}N\textsubscript{air}) [\textperthousand].}
  \item{P_comment}{A character vector representing the upper bound of P
  contents if P was not quantifiable.}
}
}
\source{
http://humic-substances.org/elemental-compositions-and-stable-isotopic-ratios-of-ihss-samples/
     \insertCite{HuffmanLaboratories.NA}{redoxpeat}
}
\usage{
ihss
}
\description{
A dataset containing chemical properties of several International Humic
Substances Society reference humic substances(element contents, isotope
signatures, water content, ash content)
\insertCite{HuffmanLaboratories.NA}{redoxpeat}.
}
\references{
\insertAllCited{}
}
\keyword{datasets}
