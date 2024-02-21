#' Not in operator
#' @param x left-hand side argument
#' @param y right-hand side argument
#' @export
'%not in%' <- function(x,y)!('%in%'(x,y))
