context("test-get_deal_properties")

test_that("get_deal_properties works", {
  res <- get_deal_properties()
  expect_is(res, "character")
  expect_true(length(res) > 10)
})
