#' Rescales a scaled numeric vector.
#'
#' \code{rp_rescale} rescales a numeric vector relative to a reference vector
#' that has been scaled with \code{\link[base:scale]{scale}}.
#'
#' @param target A numeric vector that should be rescaled.
#' @param reference A numeric vector that has been scaled with
#' \code{\link[base:scale]{scale}} and from which the attributes for rescaling
#' are taken.
#' @return \code{target} multiplied with the scale attribute value of
#' \code{reference} and with the center attribute value of \code{reference} added.
#' @examples
#' # get a scaled vector
#' a <- scale(rnorm(100, 5, 2))
#'
#' # rescale a
#' a_re <- rp_rescale(a, a)
#'
#' @export
rp_rescale <- function(target,
                       reference) {

  center <- attr(reference, "scaled:center")
  if(is.null(center)) center <- 0
  scale <- attr(reference, "scaled:scale")
  if(is.null(scale)) scale <- 1

  # if target has been scaled, remove attributes
  attr(target, "scaled:center") <- NULL
  attr(target, "scaled:scale") <- NULL

  target * scale + center

}
