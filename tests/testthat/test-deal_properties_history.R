context("test-deal_properties_history")

test_that("deal_properties_history works", {
  res <- deal_properties_history()
  expect_is(res, "tbl_df")
  expect_equal(ncol(res), 6)
})
