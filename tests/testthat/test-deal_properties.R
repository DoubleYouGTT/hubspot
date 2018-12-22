context("test-deal_properties")

test_that("deal_properties works", {
  res <- deal_properties()
  expect_is(res, "tbl_df")
  expect_gt(ncol(res), 3)
})
