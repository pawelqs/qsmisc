test_that("write_nf_session_info()", {
  path <- tempfile("versions.yml")
  withr::with_package("dplyr", {
    write_nf_session_info("PROCESS_X", path = path)
    expect_true(file.exists(path))
  })
})
