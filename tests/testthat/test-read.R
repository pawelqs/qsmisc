test_that("read_files() works", {
  path <- test_path("testdata", "read_files_data")
  res <- read_files(path)
  expect_true("id" %in% names(res))
  expect_equal(unique(res$id), c("cars1", "cars2"))
  expect_equal(nrow(res), 64)
  expect_equal(ncol(res), 12)
  expect_error(read_files("nonexistent"))
})
