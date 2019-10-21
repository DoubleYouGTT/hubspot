context("test-deal_associations")

test_that("deal_associations works", {
  res <- deal_associations()
  expect_is(res, "tbl_df")
  expect_equal(ncol(res), 3)
  expect_true(all(colnames(res) %in% c("dealId", "type", "Ids")))
})
