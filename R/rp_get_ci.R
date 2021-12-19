#' Functions to compute lower and upper confidence intervals of a sample.
#'
#' \code{get_lower_ci} and \code{get_upper_ci} compute the lower and upper confidence
#' limits (two-sided) for samples from a distribution.
#'
#' @param x A numeric vector representing a sample from a distribution for which
#' to compute a confidence interval limit.
#' @param prob A numeric value in [0;1] representing the confidence level of the
#' confidence intervals to compute.
#' @return The lower (\code{get_lower_ci}) or upper (\code{get_upper_ci}) limit of the
#' confidence interval (two-sided) for \code{x}.
#' @examples
#' # get a sample from a distribution
#' x <- rnorm(100, 5, 2)
#'
#' # get the lower 95% confidence limit
#' x_lwr <- get_lower_ci(x, prob = 0.95)
#' x_upr <- get_upper_ci(x, prob = 0.95)
#'
#'@name get_ci
NULL

#' @rdname get_ci
#' @export
get_lower_ci <- function(x, prob) {
  sort(x)[[floor(length(x) * (1 - prob)/2)]]
}

#' @rdname get_ci
#' @export
get_upper_ci <- function(x, prob) {
  sort(x)[[ceiling(length(x) * (prob + (1 - prob)/2))]]
}
