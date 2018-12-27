context("test-deal_pipelines")

test_that("deal_pipelines works", {
  res <- deal_pipelines()
  expect_is(res, "tbl_df")
  expect_equal(ncol(res), 8)
})
