context("test-owners")

test_that("owners works", {
  res <- owners()
  expect_is(res, "tbl_df")
  expect_equal(ncol(res), 12)
})
