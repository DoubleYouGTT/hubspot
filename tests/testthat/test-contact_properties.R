context("test-contact_properties")

test_that("contact_properties works", {
  res <- contact_properties()
  expect_is(res, "tbl_df")
  expect_gt(ncol(res), 3)
})
