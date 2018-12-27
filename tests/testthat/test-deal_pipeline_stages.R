context("test-deal_pipeline_stages")

test_that("deal_pipeline_stages works", {
  res <- deal_pipeline_stages()
  expect_is(res, "tbl_df")
  expect_equal(ncol(res), 9)
})
