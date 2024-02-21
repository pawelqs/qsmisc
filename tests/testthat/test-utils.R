test_that("%not in% works", {
  expect_true(2 %not in% c(3, 4, 6))
  expect_false(2 %not in% c(2, 4, 6))
})
