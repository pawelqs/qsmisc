% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read.R
\name{read_files}
\alias{read_files}
\title{Read all the files from the directory}
\usage{
read_files(
  path,
  ...,
  id = "id",
  id_regexp = NULL,
  fun = readr::read_tsv,
  recursive = FALSE,
  show_col_types = FALSE
)
}
\arguments{
\item{path}{The path to the directory}

\item{...}{Additional arguments to pass to \code{fun}}

\item{id}{The column name to store the file name}

\item{id_regexp}{A regular expression to extract the id from the file path.
If NULL, the file name without file extension is used.}

\item{fun}{The function to read the files}

\item{recursive}{Whether to read files recursively}

\item{show_col_types}{Whether to show column types}
}
\description{
Read all the files from the directory
}
