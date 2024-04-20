
#' Write session info to a YAML file in a nf-core manner
#'
#' @param task_process Name of the process
#' @param ... Not used
#' @param pkgs One of:
#'   - "other_packages" - lists main loaded packages
#'   - "all" - lists all loaded packages
#'   - vector of packages to be listed
#' @param path Path to the output file
#' @export
#'
#' @examples
#' library(qsmisc)
#' write_nf_session_info("PROCESSX":, path = "versions.yml")
#'
#' \dontrun{
#' write_nf_session_info("${task.process}":, path = "versions.yml")
#' }
write_nf_session_info <- function(task_process,
                                  ...,
                                  pkgs = "other_packages",
                                  path = "versions.yml") {
  si <- sessionInfo()
  r_version <- strsplit(si$R.version$version.string, ' ')[[1]][3]

  pkgs_versions <- c(si[["otherPkgs"]], si[["loadedOnly"]]) |>
    lapply(function(x) x$Version) |>
    unlist()

  selected_packages <-
    if (pkgs == "other_packages") {
      names(si$otherPkgs)
    } else if (pkgs == "all") {
      names(pkg_versions)
    } else {
      pkgs
    }

  versions <- c(r.base = r_version, pkgs_versions[selected_packages])
  versions_chr <- paste0("    ", names(versions), ": ", versions)

  lines <- c(
    paste0('"', task_process, '":'),
    versions_chr
  )

  writeLines(lines, path)
}
