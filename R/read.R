#' Read all the files from the directory
#'
#' @param path The path to the directory
#' @param ... Additional arguments to pass to `fun`
#' @param id The column name to store the file name
#' @param id_regexp A regular expression to extract the id from the file path.
#'   If NULL, the file name without file extension is used.
#' @param fun The function to read the files
#' @param recursive Whether to read files recursively
#' @param show_col_types Whether to show column types
#'
#' @export
read_files <- function(path,
                       ...,
                       id = "id",
                       id_regexp = NULL,
                       fun = readr::read_tsv,
                       recursive = FALSE,
                       show_col_types = FALSE) {
  files <- list.files(path, full.names = TRUE, recursive = recursive)
  if (length(files) == 0) {
    stop("No files found in ", path)
  }

  if (!is.null(id_regexp)) {
    names(files) <- stringr::str_extract(files, id_regexp)
  } else {
    names(files) <- stringr::str_extract(basename(files), ".*(?=\\.)")
  }

  purrr::map(files, fun, show_col_types = show_col_types, ...) |>
    dplyr::bind_rows(.id = id)
}
