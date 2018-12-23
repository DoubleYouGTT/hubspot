context("test-deal_stages_history")

test_that("deal_stages_history works", {
  res <- deal_stages_history()
  expect_is(res, "tbl_df")
  expect_equal(ncol(res), 5)
})

