#' Not in operator
#' @param x left-hand side argument
#' @param y right-hand side argument
#' @export
'%not in%' <- function(x,y)!('%in%'(x,y))


#' Quick save of a single object
#'
#' Saves object to ~/.qstools directory, together with quick_load() allows
#' to quickly move object between R sessions (e.g. between the analysis and
#' package debuggin session)
#'
#' @param object object to save
#' @export
quick_save <- function(object) {
  dir.create("~/.qstools", showWarnings = FALSE)
  saveRDS(object, "~/.qstools/object.Rds")
}


#' @describeIn quick_save Quick load of ~/.qstools/object.Rds
#' @export
quick_load <- function() {
  readRDS("~/.qstools/object.Rds")
}
