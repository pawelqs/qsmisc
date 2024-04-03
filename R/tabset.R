#' Print or plot list of elements as quarto tabset
#'
#' Remember to use this function inside a tabset div and quarto chunk with
#' results = "asis" option. See examples below
#'
#' @param lst List of elements to print or plot
#' @param fun Plotting or printing function
#' @param ... not used
#' @param heading Heading to use for each tab
#'
#' @examples
#' \dontrun{
#' :::: {.column-page-outset}
#' ::: {.panel-tabset}
#' ```{r, results='asis'}
#' x <- list(z = 1:10, y = rnorm(100))
#' tabset(x)
#' ```
#' :::
#' ::::
#' }
#'
#' @export
tabset <- function(lst, ..., heading = "##", fun = print) {
  purrr::iwalk(lst, function(x, name) {
    cat(sprintf("%s %s\n\n", heading, name))
    fun(x)
    cat("\n\n")
  })
}
