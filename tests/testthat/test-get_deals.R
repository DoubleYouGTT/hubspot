context("test-get_deals")

test_that("get_deals works", {
  res <- get_deals(max_iter = 1, max_properties = 1)
  expect_is(res, "list")
})
